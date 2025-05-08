# Create sf data sets

devtools::load_all()

options(tigris_use_cache = TRUE)

year <- 2018:2024
geo <- c("place", "tract", "zcta")
sf_data <- list()

for (i in 1:length(year)) {
  for (j in 1:length(geo)) {
    geo2 <- ifelse(geo[j] == "place", "city", sub("\\s", "", geo[j]))
    nm <- paste("sf", geo2, year[i], sep = "_")
    sf_data[[nm]] <- get_kc_sf(geo[j], year[i])
  }
}

# Save in `data/`
for (i in 1:length(sf_data)) {
  nm <- paste0("data/", names(sf_data)[i], ".rda")
  save(
    list = names(sf_data)[i],
    file = nm,
    envir = as.environment(sf_data)
  )
}

# Save in `data-raw/`
saveRDS(sf_data, "data-raw/sf_2018_2024.rds")
