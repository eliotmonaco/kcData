# Create spatial data sets

# library(tidyverse)
# library(tigris)
# library(sf)
#
# options(tigris_use_cache = TRUE)
#
# year <- 2014:2024
#
# shp <- list()
# nm <- list()
#
# for (i in 1:length(year)) {
#   nm$city <- paste("shp", "city", year[i], sep = "_")
#   shp[[nm$city]] <- tryCatch(
#     {
#       # City boundary map
#       places(state = 29, year = year[i]) |>
#         filter(NAME == "Kansas City")
#     },
#     error = function(e) NA
#   )
#
#   nm$tract <- paste("shp", "tract", year[i], sep = "_")
#   shp[[nm$tract]] <- tryCatch(
#     {
#       # Census tract map
#       tracts(state = 29, year = year[i]) |>
#         st_join(
#           shp[[nm$city]][, "geometry"],
#           left = FALSE
#         )
#     },
#     error = function(e) NA
#   )
#
#   nm$zcta <- paste("shp", "zcta", year[i], sep = "_")
#   shp[[nm$zcta]] <- tryCatch(
#     {
#       # ZCTA map
#       zctas(year = year[i]) |>
#         st_join(
#           shp[[nm$city]][, "geometry"],
#           left = FALSE
#         )    },
#     error = function(e) NA
#   )
# }





# debugonce(get_kc_sf)
# df <- get_kc_sf(2014, "place")

devtools::load_all()

options(tigris_use_cache = TRUE)

# year <- c(2014, 2024)
year <- 2024
# year <- 2018:2024
# geo <- c("place", "county", "tract", "block group", "block", "zcta")
geo <- c("place", "tract", "zcta")
sf_data <- list()

for (i in 1:length(year)) {
  for (j in 1:length(geo)) {
    geo2 <- ifelse(geo[j] == "place", "city", sub("\\s", "", geo[j]))
    nm <- paste("sf", geo2, year[i], sep = "_")
    sf_data[[nm]] <- tryCatch(
      {
        get_kc_sf(geo[j], year[i])
      },
      error = function(e) NA
    )
  }
}

# area in kc
# pop in kc - in file or as function?














# Compare GEOIDs from year to year
ls <- list()

for (i in 1:(length(year) - 1)) {
  # Compare tract GEOIDs
  x <- shp[[paste("shp", "tract", year[i], sep = "_")]]$GEOID
  y <- shp[[paste("shp", "tract", year[i + 1], sep = "_")]]$GEOID
  nm <- paste("tracts", year[i], "vs", year[i + 1], sep = "_")
  ls[[nm]] <- identical(sort(x), sort(y))

  # Compare ZCTA GEOIDs
  x <- shp[[paste("shp", "zcta", year[i], sep = "_")]]$GEOID20
  y <- shp[[paste("shp", "zcta", year[i + 1], sep = "_")]]$GEOID20
  # x <- shp[[paste0("shp_", year[i], "_zcta")]]$GEOID20
  # y <- shp[[paste0("shp_", year[i + 1], "_zcta")]]$GEOID20
  nm <- paste("zctas", year[i], "vs", year[i + 1], sep = "_")
  ls[[nm]] <- identical(sort(x), sort(y))
}

# Save in `data/`
for (i in 1:length(shp)) {
  nm <- paste0("data/", names(shp)[i], ".rda")
  save(
    list = names(shp)[i],
    file = nm,
    envir = as.environment(shp)
  )
}

# Save in `data-raw/`
saveRDS(shp, "data-raw/shp_2014_2023.rds")
