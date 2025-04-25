# Create 5-year ACS data sets (city)

library(tidyverse)
library(tidycensus)

acs5_city <- list()
surv <- "acs5"
year <- 2014:2023
geo <- "city"

for (i in 1:length(year)) {
  nm <- paste(surv, geo, year[i], sep = "_")
  acs5_city[[nm]] <- tryCatch(
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

# Save in `data/`
for (i in 1:length(acs5_city)) {
  nm <- paste0("data/", names(acs5_city)[i], ".rda")
  save(
    list = names(acs5_city)[i],
    file = nm,
    envir = as.environment(acs5_city)
  )
}

# Save in `data-raw/`
saveRDS(acs5_city, "data-raw/acs5_city_2014_2023.rds")
