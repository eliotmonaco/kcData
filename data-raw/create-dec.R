# Create decennial census data sets

library(tidyverse)
library(tidycensus)


vars_pl <- load_variables(2020, "pl", cache = TRUE)
vars_dp <- load_variables(2020, "dp", cache = TRUE)
vars_dhc <- load_variables(2020, "dhc", cache = TRUE)
vars_ddhca <- load_variables(2020, "ddhca", cache = TRUE)
vars_ddhcb <- load_variables(2020, "ddhcb", cache = TRUE)

vars_pl |>
  group_by(concept) |>
  count()

vars_dp |>
  group_by(concept) |>
  count()

vars_dhc |>
  group_by(concept) |>
  count() |>
  print(n = 500)

vars_ddhca |>
  group_by(concept) |>
  count() |>
  print(n = 500)

vars_ddhcb |>
  group_by(concept) |>
  count() |>
  print(n = 500)



p <- paste(
  "(?i)^hispanic\\sor\\slatino\\sorigin$",
  "^hispanic\\sor\\slatino\\sorigin\\sby\\srace",
  "^hispanic\\sor\\slatino\\sorigin,\\sand",
  "^housing", "^race$", "^race.+total",
  "^sex\\sby\\sage\\sfor\\sselected",
  "^total\\spopulation$",
  sep = "|"
)
vars <- vars_dhc$name[grepl(p, vars_dhc$concept)]
df <- vars_dhc |>
  filter(name %in% vars)



dec_dhc <- get_decennial(
  geography = "place",
  variables = vars,
  # table = "ddhca",
  year = 2020,
  sumfile = "dhc",
  state = 29,
  # county = "Jackson",
  # pop_group = "all",
  key = keyring::key_get("census-api-key"),
  show_call = TRUE
)

dec_dhc <- dec_dhc |>
  filter(NAME == "Kansas City city, Missouri")

dec_dhc <- dec_dhc |>
  left_join(vars_dhc, by = c("variable" = "name"))














