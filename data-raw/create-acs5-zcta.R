# Create 5-year ACS population data sets (ZCTA)

library(tidyverse)
library(tidycensus)

# Load map data for join
shp <- readRDS("data-raw/shp_2014_2023.rds")

acs5_zcta <- list()
surv <- "acs5"
year <- 2014:2023
geo <- "zcta"

for (i in 1:length(year)) {
  nm <- paste(surv, geo, year[i], sep = "_")
  shp_nm <- paste("shp", geo, year[i], sep = "_")
  var <- colnames(shp[[shp_nm]])[grepl(pattern = "ZCTA", x = colnames(shp[[shp_nm]]))]
  acs5_zcta[[nm]] <- tryCatch(
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
          zcta = shp[[shp_nm]][[var]],
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
          zcta = shp[[shp_nm]][[var]],
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
for (i in 1:length(acs5_zcta)) {
  nm <- paste0("data/", names(acs5_zcta)[i], ".rda")
  save(
    list = names(acs5_zcta)[i],
    file = nm,
    envir = as.environment(acs5_zcta)
  )
}

# Save in `data-raw/`
saveRDS(acs5_zcta, "data-raw/acs5_zcta_2014_2023.rds")
