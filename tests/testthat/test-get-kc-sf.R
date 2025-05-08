test_that("place", {
  data1 <- readRDS(test_path("fixtures", "sf_raw.rds"))
  data2 <- readRDS(test_path("fixtures", "sf_output.rds"))
  local_mocked_bindings(get_raw_sf1 = function(...) data1$sf_city_2020)
  act <- data2$sf_city_2020
  exp <- get_kc_sf(geo = "place", year = 2020)
  expect_equal(act, exp)
})

test_that("county", {
  data1 <- readRDS(test_path("fixtures", "sf_raw.rds"))
  data2 <- readRDS(test_path("fixtures", "sf_output.rds"))
  local_mocked_bindings(
    get_raw_sf1 = function(...) data1$sf_city_2020,
    get_raw_sf2 = function(...) data1$sf_county_2020
  )
  act <- data2$sf_county_2020
  exp <- suppressWarnings(
    get_kc_sf(geo = "county", year = 2020)
  )
  expect_equal(act, exp)
})

test_that("tract", {
  data1 <- readRDS(test_path("fixtures", "sf_raw.rds"))
  data2 <- readRDS(test_path("fixtures", "sf_output.rds"))
  local_mocked_bindings(
    get_raw_sf1 = function(...) data1$sf_city_2020,
    get_raw_sf2 = function(...) data1$sf_tract_2020
  )
  act <- data2$sf_tract_2020
  exp <- suppressWarnings(
    get_kc_sf(geo = "tract", year = 2020)
  )
  expect_equal(act, exp)
})

test_that("block group", {
  data1 <- readRDS(test_path("fixtures", "sf_raw.rds"))
  data2 <- readRDS(test_path("fixtures", "sf_output.rds"))
  local_mocked_bindings(
    get_raw_sf1 = function(...) data1$sf_city_2020,
    get_raw_sf2 = function(...) data1$sf_blockgroup_2020
  )
  act <- data2$sf_blockgroup_2020
  exp <- suppressWarnings(
    get_kc_sf(geo = "block group", year = 2020)
  )
  expect_equal(act, exp)
})

test_that("block", {
  data1 <- readRDS(test_path("fixtures", "sf_raw.rds"))
  data2 <- readRDS(test_path("fixtures", "sf_output.rds"))
  local_mocked_bindings(
    get_raw_sf1 = function(...) data1$sf_city_2020,
    get_raw_sf2 = function(...) data1$sf_block_2020
  )
  act <- data2$sf_block_2020
  exp <- suppressMessages(suppressWarnings(
    get_kc_sf(geo = "block", year = 2020)
  ))
  expect_equal(act, exp)
})

test_that("zcta", {
  data1 <- readRDS(test_path("fixtures", "sf_raw.rds"))
  data2 <- readRDS(test_path("fixtures", "sf_output.rds"))
  local_mocked_bindings(
    get_raw_sf1 = function(...) data1$sf_city_2020,
    get_raw_sf2 = function(...) data1$sf_zcta_2020
  )
  act <- data2$sf_zcta_2020
  exp <- suppressMessages(suppressWarnings(
    get_kc_sf(geo = "zcta", year = 2020)
  ))
  expect_equal(act, exp)
})
