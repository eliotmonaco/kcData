# Create population data sets

library(tidyverse)
library(tidycensus)



# How to properly align map years and survey years?





# 2020 Decennial census



# 1-year ACS

year <- 2014:2023

acs1 <- list()
acs5 <- list()

for (i in 1:length(year)) {
  nm <- paste0("acs1_", year[i])
  acs1[[nm]] <- tryCatch(
    {
      # Get variables for Age & Sex, Race, and Hispanic Origin tables
      vars_full <- load_variables(year[i], "acs1")
      vars <- vars_full$name[grepl("^[BC]0[123]", vars_full$name)]
      # Get ACS data, join to variable details, and filter for KCMO
      get_acs(
        geography = "place",
        variables = vars,
        year = year[i],
        state = 29,
        survey = "acs1"
      ) |>
        left_join(
          vars_full,
          by = c("variable" = "name")
        ) |>
        filter(NAME == "Kansas City city, Missouri")
    },
    error = function(e) NA
  )

  nm <- paste0("acs5_", year[i], "_city")
  acs5[[nm]] <- tryCatch(
    {
      # Get variables for Age & Sex, Race, and Hispanic Origin tables
      vars_full <- load_variables(year[i], "acs1")
      vars <- vars_full$name[grepl("^[BC]0[123]", vars_full$name)]
      # Get ACS data, join to variable details, and filter for KCMO
      get_acs(
        geography = "place",
        variables = vars,
        year = year[i],
        state = 29,
        survey = "acs1"
      ) |>
        left_join(
          vars_full,
          by = c("variable" = "name")
        ) |>
        filter(NAME == "Kansas City city, Missouri")
    },
    error = function(e) NA
  )


  nm <- paste0("acs5_", year[i], "_tract")

  nm <- paste0("acs5_", year[i], "_zcta")

}

# 5-year ACS

year <- 2014:2023

acs5 <- list()

for (i in 1:length(year)) {
  nm <- paste0("acs5_", year[i])
  acs5[[nm]] <- tryCatch(
    {
      # Get variables for Age & Sex, Race, and Hispanic Origin tables
      vars_full <- load_variables(year[i], "acs1")
      vars <- vars_full$name[grepl("^[BC]0[123]", vars_full$name)]
      # Get ACS data, join to variable details, and filter for KCMO
      get_acs(
        geography = "place",
        variables = vars,
        year = year[i],
        state = 29,
        survey = "acs1"
      ) |>
        left_join(
          vars_full,
          by = c("variable" = "name")
        ) |>
        filter(NAME == "Kansas City city, Missouri")
    },
    error = function(e) NA
  )
}








vars_acs <- load_variables(2021, "acs5")
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
