# Shapefiles --------------------------------------------------------------

devtools::load_all()

options(tigris_use_cache = TRUE)

year <- 2015:2024
geo <- c("place", "county", "tract", "block group", "block", "zcta")
sf_data <- list()

for (i in 1:length(year)) {
  for (j in 1:length(geo)) {
    geo_nm <- ifelse(geo[j] == "place", "city", sub("\\s", "", geo[j]))
    nm <- paste("sf", geo_nm, year[i], sep = "_")
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
saveRDS(sf_data, "data-raw/data_sf_2015_2024.rds")


# GEOIDs ------------------------------------------------------------------

geo <- c("city", "county", "tract", "blockgroup", "block", "zcta")

geoids <- lapply(geo, \(x) {
  ls <- lapply(
    sf_data[grepl(paste0("_", x, "_"), names(sf_data))],
    \(y) {
      col <- colnames(y)[grepl("^GEOID([12]0)?$", colnames(y))]
      sort(y[[col]])
    }
  )
  names(ls) <- sub("sf_.*_", "ids", names(ls))
  ls
})

names(geoids) <- geo

geoids <- lapply(geoids, \(x) {
  c <- setmeup::batch_compare(lapply(x, \(y) sort(unlist(y))))
  if (all(c)) {
    unique(unlist(x))
  } else {
    x
  }
})

# Save data for export
usethis::use_data(geoids, overwrite = T)
