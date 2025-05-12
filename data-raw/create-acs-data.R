devtools::load_all()

acs_data <- list()
surv <- c("acs1", "acs5")
year <- 2018:2023

for (i in 1:length(surv)) {
  for (j in 1:length(year)) {
    if (surv[i] == "acs1") {
      geo <- "place"
    } else if (surv[i] == "acs5") {
      geo <- c("place", "county", "tract", "block group", "zcta")
    }
    for (k in 1:length(geo)) {
      geo_nm <- sub("\\s", "", geo[k])
      geo_nm <- sub("place", "city", geo_nm)
      nm <- paste(surv[i], geo_nm, year[j], sep = "_")
      acs_data[[nm]] <- get_kc_pop(
        dataset = surv[i],
        geo = geo[k],
        year = year[j],
        vars = "^B01",
        var_match = "regex",
        key = keyring::key_get("census-api-key")
      )
    }
  }
}

# Save in `data/`
for (i in 1:length(acs_data)) {
  nm <- paste0("data/", names(acs_data)[i], ".rda")
  save(
    list = names(acs_data)[i],
    file = nm,
    envir = as.environment(acs_data)
  )
}

# Save in `data-raw/`
saveRDS(acs_data, "data-raw/acs_2018_2023.rds")
