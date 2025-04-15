# This script creates KC-specific map and population data objects from US Census
# data

library(tidyverse)
library(tidycensus)
library(tigris)
library(sf)

# Maps --------------------------------------------------------------------

options(tigris_use_cache = TRUE)

# City boundaries map
map_city_2024 <- places(state = 29, year = 2024) |>
  filter(NAME == "Kansas City")

# Census tracts map
map_tract_2024 <- tracts(state = 29, year = 2024) |>
  st_join(
    map_city_2024[, "geometry"],
    left = FALSE
  )

# ZCTAs map
map_zcta_2024 <- zctas(year = 2024) |>
  st_join(
    map_city_2024[, "geometry"],
    left = FALSE
  )

# Visualize
map_city_2024 |>
  ggplot() +
  geom_sf()

map_tract_2024 |>
  ggplot() +
  geom_sf()

map_zcta_2024 |>
  ggplot() +
  geom_sf()

ggplot() +
  geom_sf(
    data = map_tract_2024,
    fill = "darkgrey"
  ) +
  geom_sf(
    data = map_city_2024,
    fill = NA,
    color = "red"
  )

ggplot() +
  geom_sf(
    data = map_zcta_2024,
    fill = "darkgrey"
  ) +
  geom_sf(
    data = map_city_2024,
    fill = NA,
    color = "red"
  )

# Population --------------------------------------------------------------

vars_acs <- load_variables(2023, "acs5")

# All variables from Age & Sex, Race, and Hispanic Origin tables (full and
# collapsed)
vars <- vars_acs$name[grepl("^[BC]0[123]", vars_acs$name)]

# City pop
pop_city_2023acs5 <- get_acs(
  geography = "place",
  variables = vars,
  year = 2023,
  state = 29,
  survey = "acs5"
) |>
  left_join(
    vars_acs |>
      select(-geography),
    by = c("variable" = "name")
  ) |>
  filter(NAME == "Kansas City city, Missouri")

# Pop by tract
pop_tract_2023acs5 <- get_acs(
  geography = "tract",
  variables = vars,
  year = 2023,
  state = 29,
  survey = "acs5"
) |>
  left_join(
    vars_acs |>
      select(-geography),
    by = c("variable" = "name")
  ) |>
  filter(GEOID %in% map_tract_2024$GEOID)

# Pop by ZCTA
pop_zcta_2023acs5 <- get_acs(
  geography = "zcta",
  variables = vars,
  year = 2023,
  zcta = map_zcta_2024$ZCTA5CE20,
  survey = "acs5"
) |>
  left_join(
    vars_acs |>
      select(-geography),
    by = c("variable" = "name")
  )

# Save --------------------------------------------------------------------

usethis::use_data(map_city_2024, overwrite = TRUE)
usethis::use_data(map_tract_2024, overwrite = TRUE)
usethis::use_data(map_zcta_2024, overwrite = TRUE)
usethis::use_data(pop_city_2023acs5, overwrite = TRUE)
usethis::use_data(pop_tract_2023acs5, overwrite = TRUE)
usethis::use_data(pop_zcta_2023acs5, overwrite = TRUE)
