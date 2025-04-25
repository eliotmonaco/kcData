# Create 1-year ACS data sets

library(tidyverse)
library(tidycensus)

ls_acs1 <- list()
surv <- "acs1" # only city-level data is available
year <- 2014:2023

for (i in 1:length(year)) {
  nm <- paste(surv, year[i], sep = "_")
  ls_acs1[[nm]] <- tryCatch(
    {
      # Get variables for Age & Sex, Race, and Hispanic Origin tables
      vars_df <- load_variables(year[i], surv, cache = TRUE)
      vars <- vars_df$name[grepl("^[BC]0[123]", vars_df$name)]
      # Get ACS data, join to variable details, and filter for geography
      get_acs(
        geography = "place",
        variables = vars,
        year = year[i],
        state = 29,
        key = keyring::key_get("census-api-key"),
        survey = surv,
        show_call = TRUE
      ) |>
        left_join(
          vars_df,
          by = c("variable" = "name")
        ) |>
        filter(NAME == "Kansas City city, Missouri")
    },
    error = function(e) NA
  )
}

ls_acs1 <- purrr::keep(ls_acs1, is.list)

# Save in `data/`
for (i in 1:length(ls_acs1)) {
  nm <- paste0("data/", names(ls_acs1)[i], ".rda")
  save(
    list = names(ls_acs1)[i],
    file = nm,
    envir = as.environment(ls_acs1)
  )
}

# Save in `data-raw/`
saveRDS(ls_acs1, "data-raw/acs1_2014_2023.rds")
