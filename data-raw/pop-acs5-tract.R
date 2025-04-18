# Create 5-year ACS population data sets (census tract)

library(tidyverse)
library(tidycensus)

# Load map data for join
map_data <- readRDS("data-raw/map_data_2014_2023.rds")

pop_acs5_tract <- list()
surv <- "acs5"
year <- 2014:2023
geo <- "tract"

for (i in 1:length(year)) {
  nm <- paste("pop", year[i], surv, geo, sep = "_")
  map_nm <- paste("map", year[i], geo, sep = "_")
  pop_acs5_tract[[nm]] <- tryCatch(
    {
      # Get variables for Age & Sex, Race, and Hispanic Origin tables
      vars_full <- load_variables(year[i], surv)
      vars <- vars_full$name[grepl("^[BC]0[123]", vars_full$name)]
      # Get ACS data, join to variable details, and filter for geography
      get_acs(
        geography = geo,
        variables = vars,
        year = year[i],
        state = 29,
        survey = surv
      ) |>
        left_join(
          vars_full,
          by = c("variable" = "name")
        )
    },
    error = function(e) NA
  )
}

saveRDS(pop_acs5_tract, "data-raw/pop_acs5_tract_2014_2023.rds")

# Compare GEOIDs from map and ACS in same years
ls <- list()

for (i in 1:length(year)) {
  map_nm <- paste("map", year[i], geo, sep = "_")
  nm <- paste("pop", year[i], surv, geo, sep = "_")
  x <- map_data[[map_nm]]$GEOID
  y <- pop_acs5_tract[[nm]]$GEOID
  nm <- paste("tracts", year[i], sep = "_")
  ls[[nm]] <- all(x %in% y)
}

# Filter population data by tracts in map data
pop_acs5_tract2 <- list()

for (i in 1:length(year)) {
  nm <- paste("pop", year[i], surv, geo, sep = "_")
  map_nm <- paste("map", year[i], geo, sep = "_")
  pop_acs5_tract2[[nm]] <- pop_acs5_tract[[nm]] |>
    filter(GEOID %in% map_data[[map_nm]]$GEOID)
}

# Save in `data/`
for (i in 1:length(pop_acs5_tract)) {
  nm <- paste0("data/", names(pop_acs5_tract)[i], ".rda")
  save(
    list = names(pop_acs5_tract)[i],
    file = nm,
    envir = as.environment(pop_acs5_tract)
  )
}

# Save in `data-raw/`
saveRDS(pop_acs5_tract2, "data-raw/pop_acs5_tract_2014_2023.rds")
