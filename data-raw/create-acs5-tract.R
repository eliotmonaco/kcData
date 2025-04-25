# Create 5-year ACS data sets (census tract)

library(tidyverse)
library(tidycensus)

# Load shapefiles for join
shp <- readRDS("data-raw/shp_2014_2023.rds")

acs5_tract <- list()
surv <- "acs5"
year <- 2014:2023
geo <- "tract"

for (i in 1:length(year)) {
  nm <- paste(surv, geo, year[i], sep = "_")
  shp_nm <- paste("shp", geo, year[i], sep = "_")
  acs5_tract[[nm]] <- tryCatch(
    {
      # Get variables for Age & Sex, Race, and Hispanic Origin tables
      vars_df <- load_variables(year[i], surv, cache = TRUE)
      vars <- vars_df$name[grepl("^[BC]0[123]", vars_df$name)]
      # Get ACS data, join to variable details, and filter for geography
      get_acs(
        geography = geo,
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
        )
    },
    error = function(e) NA
  )
}

# Compare GEOIDs from shapefile and ACS in same years
ls <- list()

for (i in 1:length(year)) {
  shp_nm <- paste("shp", geo, year[i], sep = "_")
  nm <- paste(surv, geo, year[i], sep = "_")
  x <- shp[[shp_nm]]$GEOID
  y <- acs5_tract[[nm]]$GEOID
  nm <- paste("tracts", year[i], sep = "_")
  ls[[nm]] <- all(x %in% y)
}

# Filter population data by tracts in shapefiles
acs5_tract2 <- list()

for (i in 1:length(year)) {
  nm <- paste(surv, geo, year[i], sep = "_")
  shp_nm <- paste("shp", geo, year[i], sep = "_")
  acs5_tract2[[nm]] <- acs5_tract[[nm]] |>
    filter(GEOID %in% shp[[shp_nm]]$GEOID)
}

# Save in `data/`
for (i in 1:length(acs5_tract2)) {
  nm <- paste0("data/", names(acs5_tract2)[i], ".rda")
  save(
    list = names(acs5_tract2)[i],
    file = nm,
    envir = as.environment(acs5_tract2)
  )
}

# Save in `data-raw/`
saveRDS(acs5_tract2, "data-raw/acs5_tract_2014_2023.rds")
