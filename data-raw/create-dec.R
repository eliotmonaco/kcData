devtools::load_all()

# debugonce(get_kc_pop)
df <- get_kc_pop(
  dataset = "dhc",
  geo = "block",
  year = 2020,
  vars = "^P1[23]",
  var_match = "regex",
  key = keyring::key_get("census-api-key")
)


# 2020 census: P12 & P13 tables (Sex by Age) from DHC file?




vars <- tidycensus::load_variables(2021, "acs1", cache = TRUE)
# vars1 <- vars_dhc[grepl("^P1[23]", vars_dhc$name), ]




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




