# Create 5-year ACS population data sets (city)

library(tidyverse)
library(tidycensus)

pop_acs5_city <- list()
surv <- "acs5"
year <- 2014:2023
geo <- "city"

for (i in 1:length(year)) {
  nm <- paste("pop", year[i], surv, geo, sep = "_")
  pop_acs5_city[[nm]] <- tryCatch(
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
for (i in 1:length(pop_acs5_city)) {
  nm <- paste0("data/", names(pop_acs5_city)[i], ".rda")
  save(
    list = names(pop_acs5_city)[i],
    file = nm,
    envir = as.environment(pop_acs5_city)
  )
}

# Save in `data-raw/`
saveRDS(pop_acs5_city, "data-raw/pop_acs5_city_2014_2023.rds")
