# Create data to test `get_kc_sf()`

devtools::load_all()

options(tigris_use_cache = TRUE)

year <- 2020
geo <- c("place", "county", "tract", "block group", "block", "zcta")

# Create raw data
sf_raw <- list()

for (i in 1:length(year)) {
  for (j in 1:length(geo)) {
    geo2 <- ifelse(geo[j] == "place", "city", sub("\\s", "", geo[j]))
    nm <- paste("sf", geo2, year[i], sep = "_")
    sf_raw[[nm]] <- get_raw_sf(geo[j], year[i])
  }
}

kc_fips <- 38000
co_fips <- "047"
kc_zips <- c(
  64127, 64155, 64082, 64129, 64157, 64117, 64132, 64151, 64118, 64012, 64116,
  64068, 64128, 64153, 64163, 64138, 64106, 64120, 64123, 64152, 64079, 64124,
  64108, 64125, 64126, 64053, 64081, 64109, 64110, 64131, 64055, 64111, 64112,
  64130, 64113, 64114, 64133, 64134, 64136, 64064, 64137, 64139, 64145, 64146,
  64147, 64149, 64101, 64102, 64119, 64150, 64105, 64164, 64154, 64156, 64158,
  64161, 64165, 64166, 64167
)

rows <- list(
  place = which(sf_raw$sf_city_2020$PLACEFP == kc_fips),
  county = which(sf_raw$sf_county_2020$COUNTYFP %in% co_fips),
  tract = which(sf_raw$sf_tract_2020$COUNTYFP %in% co_fips),
  blockgroup = which(sf_raw$sf_blockgroup_2020$COUNTYFP %in% co_fips)[1:100],
  block = which(sf_raw$sf_block_2020$COUNTYFP %in% co_fips)[1:100],
  zcta = which(sf_raw$sf_zcta_2020$ZCTA5CE20 %in% kc_zips)
)

sf_raw2 <- purrr::map2(sf_raw, rows, \(x, y) x[y, ])

# Create output data
sf_output <- list()

nm <- names(sf_raw)

local_mocked_bindings(get_raw_sf1 = function(...) sf_raw2$sf_city_2020)
sf_output[[nm[1]]] <- get_kc_sf(geo = "place", year = 2020)

local_mocked_bindings(
  get_raw_sf1 = function(...) sf_raw2$sf_city_2020,
  get_raw_sf2 = function(...) sf_raw2$sf_county_2020
)
sf_output[[nm[2]]] <- get_kc_sf(geo = "county", year = 2020)

local_mocked_bindings(
  get_raw_sf1 = function(...) sf_raw2$sf_city_2020,
  get_raw_sf2 = function(...) sf_raw2$sf_tract_2020
)
sf_output[[nm[3]]] <- get_kc_sf(geo = "tract", year = 2020)

local_mocked_bindings(
  get_raw_sf1 = function(...) sf_raw2$sf_city_2020,
  get_raw_sf2 = function(...) sf_raw2$sf_blockgroup_2020
)
sf_output[[nm[4]]] <- get_kc_sf(geo = "block group", year = 2020)

local_mocked_bindings(
  get_raw_sf1 = function(...) sf_raw2$sf_city_2020,
  get_raw_sf2 = function(...) sf_raw2$sf_block_2020
)
sf_output[[nm[5]]] <- get_kc_sf(geo = "block", year = 2020)

local_mocked_bindings(
  get_raw_sf1 = function(...) sf_raw2$sf_city_2020,
  get_raw_sf2 = function(...) sf_raw2$sf_zcta_2020
)
sf_output[[nm[6]]] <- get_kc_sf(geo = "zcta", year = 2020)

# Plot
plots_raw <- list()
plots_output <- list()
for (i in 1:length(sf_output)) {
  plots_raw[[nm[i]]] <- ggplot2::ggplot(data = sf_raw2[[1]]) +
    ggplot2::geom_sf(color = "darkblue", fill = "lightblue", linewidth = 1) +
    ggplot2::geom_sf(data = sf_raw2[[i]], fill = "lightgreen", alpha = .5) +
    ggplot2::ggtitle(i)
  plots_output[[nm[i]]] <- ggplot2::ggplot(data = sf_output[[1]]) +
    ggplot2::geom_sf(color = "darkblue", fill = "lightblue", linewidth = 1) +
    ggplot2::geom_sf(data = sf_output[[i]], fill = "lightgreen", alpha = .5) +
    ggplot2::ggtitle(i)
  print(plots_raw[[i]])
  print(plots_output[[i]])
}

saveRDS(sf_raw2, "tests/testthat/fixtures/sf_raw.rds")
saveRDS(sf_output, "tests/testthat/fixtures/sf_output.rds")
