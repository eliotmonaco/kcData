# Create spatial data sets

library(tidyverse)
library(tigris)
library(sf)

options(tigris_use_cache = TRUE)

year <- 2014:2023

map_data <- list()
nm <- list()

for (i in 1:length(year)) {
  nm$city <- paste0("map_", year[i], "_city")
  map_data[[nm$city]] <- tryCatch(
    {
      # City boundary map
      places(state = 29, year = year[i]) |>
        filter(NAME == "Kansas City")
    },
    error = function(e) NA
  )

  nm$tract <- paste0("map_", year[i], "_tract")
  map_data[[nm$tract]] <- tryCatch(
    {
      # Census tract map
      tracts(state = 29, year = year[i]) |>
        st_join(
          map_data[[nm$city]][, "geometry"],
          left = FALSE
        )
    },
    error = function(e) NA
  )

  nm$zcta <- paste0("map_", year[i], "_zcta")
  map_data[[nm$zcta]] <- tryCatch(
    {
      # ZCTA map
      zctas(year = year[i]) |>
        st_join(
          map_data[[nm$city]][, "geometry"],
          left = FALSE
        )    },
    error = function(e) NA
  )
}

map_data <- c(
  map_data_2014_2019,
  map_data_2020_2022,
  map_data_2023
)

saveRDS(map_data, "data-raw/map_data_2014_2023.rds")

