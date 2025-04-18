# Create 5-year ACS population data sets (ZCTA)

library(tidyverse)
library(tidycensus)

# Load map data for join
map_data <- readRDS("data-raw/map_data_2014_2023.rds")

pop_acs5_zcta <- list()
surv <- "acs5"
year <- 2014:2023
geo <- "zcta"

for (i in 1:length(year)) {
  nm <- paste("pop", year[i], surv, geo, sep = "_")
  map_nm <- paste("map", year[i], geo, sep = "_")
  var <- colnames(map_data[[map_nm]])[grepl(pattern = "ZCTA", x = colnames(map_data[[map_nm]]))]
  pop_acs5_zcta[[nm]] <- tryCatch(
    {
      # Get variables for Age & Sex, Race, and Hispanic Origin tables
      vars_full <- load_variables(year[i], surv)
      vars <- vars_full$name[grepl("^[BC]0[123]", vars_full$name)]
      # Get ACS data, join to variable details, and filter for geography
      if (year[i] < 2020) {
        get_acs(
          geography = geo,
          variables = vars,
          year = year[i],
          zcta = map_data[[map_nm]][[var]],
          state = 29, # required for pre-2020 data
          survey = surv
        ) |>
          left_join(
            vars_full,
            by = c("variable" = "name")
          )
      } else {
        get_acs(
          geography = geo,
          variables = vars,
          year = year[i],
          zcta = map_data[[map_nm]][[var]],
          survey = surv
        ) |>
          left_join(
            vars_full,
            by = c("variable" = "name")
          )
      }
    },
    error = function(e) NA
  )
}

# Save in `data/`
for (i in 1:length(pop_acs5_zcta)) {
  nm <- paste0("data/", names(pop_acs5_zcta)[i], ".rda")
  save(
    list = names(pop_acs5_zcta)[i],
    file = nm,
    envir = as.environment(pop_acs5_zcta)
  )
}

# Save in `data-raw/`
saveRDS(pop_acs5_zcta, "data-raw/pop_acs5_zcta_2014_2023.rds")
