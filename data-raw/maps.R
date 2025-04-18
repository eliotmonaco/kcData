# Create spatial data sets

library(tidyverse)
library(tigris)
library(sf)

options(tigris_use_cache = TRUE)

year <- 2014:2023

map_data <- list()
nm <- list()

for (i in 1:length(year)) {
  nm$city <- paste("map", year[i], "city", sep = "_")
  map_data[[nm$city]] <- tryCatch(
    {
      # City boundary map
      places(state = 29, year = year[i]) |>
        filter(NAME == "Kansas City")
    },
    error = function(e) NA
  )

  nm$tract <- paste("map", year[i], "tract", sep = "_")
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

  nm$zcta <- paste("map", year[i], "zcta", sep = "_")
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

# Compare GEOIDs from year to year
ls <- list()

for (i in 1:(length(year) - 1)) {
  # Compare tract GEOIDs
  x <- map_data[[paste0("map_", year[i], "_tract")]]$GEOID
  y <- map_data[[paste0("map_", year[i + 1], "_tract")]]$GEOID
  nm <- paste("tracts", year[i], "vs", year[i + 1], sep = "_")
  ls[[nm]] <- identical(sort(x), sort(y))

  # Compare ZCTA GEOIDs
  x <- map_data[[paste0("map_", year[i], "_zcta")]]$GEOID20
  y <- map_data[[paste0("map_", year[i + 1], "_zcta")]]$GEOID20
  nm <- paste("zctas", year[i], "vs", year[i + 1], sep = "_")
  ls[[nm]] <- identical(sort(x), sort(y))
}

# Save in `data/`
for (i in 1:length(map_data)) {
  nm <- paste0("data/", names(map_data)[i], ".rda")
  save(
    list = names(map_data)[i],
    file = nm,
    envir = as.environment(map_data)
  )
}

# Save in `data-raw/`
saveRDS(map_data, "data-raw/map_data_2014_2023.rds")
