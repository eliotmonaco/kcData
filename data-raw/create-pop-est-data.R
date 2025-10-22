# Create population estimates datasets

library(tidyverse)

# Intercensal population estimates, 2010-2020
# https://www.census.gov/data/tables/time-series/demo/popest/intercensal-2010-2020-cities.html

popest_ic20 <- readxl::read_excel(
  "data-raw/sub-ip-est2020int-pop-29.xlsx",
  skip = 2,
  .name_repair = ~ setmeup::fix_colnames(.x, n_pfx = "est_")
)

vars <- colnames(popest_ic20)

popest_ic20 <- readxl::read_excel(
  "data-raw/sub-ip-est2020int-pop-29.xlsx",
  skip = 3,
  .name_repair = ~ setmeup::fix_colnames(.x, n_pfx = "est_")
)

colnames(popest_ic20)[c(1:3, 13)] <- vars[c(1:3, 13)]

popest_ic20 <- popest_ic20 |>
  filter(geographic_area == "Kansas City city, Missouri")

colnames(popest_ic20) <- str_replace_all(
  colnames(popest_ic20),
  c(
    "april_1_2010_estimates_base" = "est_base_apr_1_2010",
    "population_estimate_as_of_july_1" = "est_2010",
    "april_1_2020_census" = "census_apr_1_2020"
  )
)

# Vintage 2024 population estimates
# https://www.census.gov/data/tables/time-series/demo/popest/2020s-total-cities-and-towns.html

popest_v24 <- read.csv("data-raw/sub-est2024_29.csv")

colnames(popest_v24) <- tolower(colnames(popest_v24))

popest_v24 <- popest_v24 |>
  filter(name == "Kansas City city") |>
  select(name, contains("estimate"))

colnames(popest_v24) <- str_replace_all(
  colnames(popest_v24),
  c(
    "estimatesbase" = "est_base_",
    "popestimate" = "est_"
  )
)

# Save data

usethis::use_data(popest_ic20, overwrite = T)
usethis::use_data(popest_v24, overwrite = T)
