# Create data to test `get_kc_pop()`

devtools::load_all()

# Create raw data
pop_raw <- list()
surv <- c("acs1", "acs5")
year <- 2021

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
      args <- list(
        survey = surv[i],
        geography = geo[k],
        year = year[j],
        variables = "B01003_001",
        state = 29,
        key = keyring::key_get("census-api-key")
      )
      if (geo[k] == "zcta") {
        args <- append(args, list(zcta = geoids$zcta$ids_2021))
        args <- args[!grepl("state", names(args))]
      }
      pop_raw[[nm]] <- get_pop_acs(args)
    }
  }
}

surv <- "dhc"
year <- 2020

for (i in 1:length(surv)) {
  for (j in 1:length(year)) {
    geo <- c("place", "county", "tract", "block group", "block", "zcta")
    for (k in 1:length(geo)) {
      geo_nm <- sub("\\s", "", geo[k])
      geo_nm <- sub("place", "city", geo_nm)
      nm <- paste(surv[i], geo_nm, year[j], sep = "_")
      args <- list(
        sumfile = surv[i],
        geography = geo[k],
        year = year[j],
        variables = "P12_001N",
        state = 29,
        key = keyring::key_get("census-api-key")
      )
      if (geo[k] == "block") {
        args <- append(args, list(county = c(037, 047, 095, 165)))
      }
      pop_raw[[nm]] <- get_pop_dec(args)
    }
  }
}

# Create output data
pop_output <- list()
surv <- c("acs1", "acs5")
year <- 2021

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
      pop_output[[nm]] <- get_kc_pop(
        dataset = surv[i],
        geo = geo[k],
        year = year[j],
        vars = "B01003_001",
        var_match = "regex",
        key = keyring::key_get("census-api-key")
      )
    }
  }
}

surv <- "dhc"
year <- 2020

for (i in 1:length(surv)) {
  for (j in 1:length(year)) {
    geo <- c("place", "county", "tract", "block group", "block", "zcta")
    for (k in 1:length(geo)) {
      geo_nm <- sub("\\s", "", geo[k])
      geo_nm <- sub("place", "city", geo_nm)
      nm <- paste(surv[i], geo_nm, year[j], sep = "_")
      pop_output[[nm]] <- get_kc_pop(
        dataset = surv[i],
        geo = geo[k],
        year = year[j],
        vars = "P12_001N",
        var_match = "regex",
        key = keyring::key_get("census-api-key")
      )
    }
  }
}

saveRDS(pop_raw, "tests/testthat/fixtures/pop_raw.rds")
saveRDS(pop_output, "tests/testthat/fixtures/pop_output.rds")
