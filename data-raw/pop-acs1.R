# Create 1-year ACS population data sets

library(tidyverse)
library(tidycensus)

pop_acs1 <- list()
surv <- "acs1" # only city-level data is available
year <- 2014:2023

for (i in 1:length(year)) {
  nm <- paste("pop", year[i], surv, sep = "_")
  pop_acs1[[nm]] <- tryCatch(
    {
      # Get variables for Age & Sex, Race, and Hispanic Origin tables
      vars_full <- load_variables(year[i], surv)
      vars <- vars_full$name[grepl("^[BC]0[123]", vars_full$name)]
      # Get ACS data, join to variable details, and filter for geography
      get_acs(
        geography = "place",
        variables = vars,
        year = year[i],
        state = 29,
        survey = surv
      ) |>
        left_join(
          vars_full,
          by = c("variable" = "name")
        ) |>
        filter(NAME == "Kansas City city, Missouri")
    },
    error = function(e) NA
  )
}

# Save in `data/`
for (i in 1:length(pop_acs1)) {
  nm <- paste0("data/", names(pop_acs1)[i], ".rda")
  save(
    list = names(pop_acs1)[i],
    file = nm,
    envir = as.environment(pop_acs1)
  )
}

# Save in `data-raw/`
saveRDS(pop_acs1, "data-raw/pop_acs1_2014_2023.rds")
