library(tidyverse)
devtools::load_all()

options(tigris_use_cache = TRUE)

# Find variables for 2010 census
vars10 <- tidycensus::load_variables(2010, "sf1", cache = TRUE)
df <- vars10 |>
  filter(grepl("^SEX BY AGE", concept)) |>
  count(concept)
df <- vars10 |>
  filter(grepl("^SEX BY AGE$", concept))

# Find variables for 2020 census
vars20 <- tidycensus::load_variables(2020, "dhc", cache = TRUE)
df <- vars20 |>
  filter(grepl("^SEX BY AGE", concept)) |>
  count(concept)
df <- vars20 |>
  filter(grepl("^SEX BY AGE FOR SELECTED AGE CATEGORIES$", concept))

# Get GEOIDs for 2010 data
geo <- c("place", "county", "tract", "block group", "block", "zcta")
sf2010 <- lapply(geo, \(x) get_kc_sf(x, 2010))
names(sf2010) <- c("city", "county", "tract", "blockgroup", "block", "zcta")

saveRDS(sf2010, "data-raw/data_sf_2010.rds")

geoid2010 <- lapply(sf2010, \(x) x$GEOID)

# Get census data
dec_data <- list()
srvy <- c("sf1", "dhc")
year <- c(2010, 2020)
vars <- c("P012001", "P12_001N")

for (i in 1:length(srvy)) {
  geo <- c("place", "county", "tract", "block group", "block", "zcta")

  for (j in 1:length(geo)) {
    geo_nm <- sub("place", "city", sub("\\s", "", geo[j]))
    nm <- paste("dec", geo_nm, year[i], sep = "_")

    if (year[i] == 2010) {
      id <- geoid2010[[geo_nm]]
    } else {
      id <- NULL
    }

    dec_data[[nm]] <- get_kc_pop(
      dataset = srvy[i],
      geo = geo[j],
      year = year[i],
      vars = vars[i],
      var_match = "fixed",
      geoid = id,
      key = keyring::key_get("census-api-key")
    )
  }
}

# Filter out rows with no data
dec_data <- lapply(dec_data, \(x) dplyr::filter(x, !is.na(value)))

# Save in `data/`
for (i in 1:length(dec_data)) {
  nm <- paste0("data/", names(dec_data)[i], ".rda")
  save(
    list = names(dec_data)[i],
    file = nm,
    envir = as.environment(dec_data)
  )
}

# Save in `data-raw/`
saveRDS(dec_data, "data-raw/data_dec_2010.rds")
