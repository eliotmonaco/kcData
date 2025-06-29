devtools::load_all()

# debugonce(get_kc_pop)
df <- get_kc_pop(
  dataset = "dhc",
  geo = "block",
  year = 2020,
  vars = "P12_001N",
  var_match = "fixed",
  key = keyring::key_get("census-api-key")
)


# 2020 census: P12 & P13 tables (Sex by Age) from DHC file?




vars10 <- tidycensus::load_variables(2010, "sf1", cache = TRUE)

vars10 |>
  filter(grepl("^SEX BY AGE", concept)) |>
  count(concept)

df <- vars10 |>
  filter(grepl("^SEX BY AGE$", concept))



vars20 <- tidycensus::load_variables(2020, "dhc", cache = TRUE)

df <- vars20 |>
  filter(grepl("^SEX BY AGE", concept)) |>
  count(concept)

df <- vars20 |>
  filter(grepl("^SEX BY AGE FOR SELECTED AGE CATEGORIES$", concept))



dec_dhc <- tidycensus::get_decennial(
  geography = "zcta",
  variables = vars1$name,
  # table = "ddhca",
  year = 2020,
  sumfile = "dhc",
  # state = 29,
  state = sf_zcta_2020$GEOID20,
  # county = "Jackson",
  # pop_group = "all",
  key = keyring::key_get("census-api-key")
)




