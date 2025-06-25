test_that("place", {
  sf_in <- readRDS(test_path("fixtures", "sf_input.rds"))
  sf_out <- readRDS(test_path("fixtures", "sf_output.rds"))
  local_mocked_bindings(get_raw_sf1 = function(...) sf_in$place)
  act <- get_kc_sf(geo = "place", year = 2020)
  exp <- sf_out$place
  expect_equal(act, exp)
})

test_that("county", {
  sf_in <- readRDS(test_path("fixtures", "sf_input.rds"))
  sf_out <- readRDS(test_path("fixtures", "sf_output.rds"))
  local_mocked_bindings(
    get_raw_sf1 = function(...) sf_in$place,
    get_raw_sf2 = function(...) sf_in$county
  )
  act <- suppressWarnings(
    get_kc_sf(geo = "county", year = 2020)
  )
  exp <- sf_out$county
  expect_equal(act, exp)
})

test_that("tract", {
  sf_in <- readRDS(test_path("fixtures", "sf_input.rds"))
  sf_out <- readRDS(test_path("fixtures", "sf_output.rds"))
  local_mocked_bindings(
    get_raw_sf1 = function(...) sf_in$place,
    get_raw_sf2 = function(...) sf_in$tract
  )
  act <- suppressWarnings(
    get_kc_sf(geo = "tract", year = 2020)
  )
  exp <- sf_out$tract
  expect_equal(act, exp)
})

test_that("block group", {
  sf_in <- readRDS(test_path("fixtures", "sf_input.rds"))
  sf_out <- readRDS(test_path("fixtures", "sf_output.rds"))
  local_mocked_bindings(
    get_raw_sf1 = function(...) sf_in$place,
    get_raw_sf2 = function(...) sf_in$blockgroup
  )
  act <- suppressWarnings(
    get_kc_sf(geo = "block group", year = 2020)
  )
  exp <- sf_out$blockgroup
  expect_equal(act, exp)
})

test_that("block", {
  sf_in <- readRDS(test_path("fixtures", "sf_input.rds"))
  sf_out <- readRDS(test_path("fixtures", "sf_output.rds"))
  local_mocked_bindings(
    get_raw_sf1 = function(...) sf_in$place,
    get_raw_sf2 = function(...) sf_in$block
  )
  act <- suppressMessages(suppressWarnings(
    get_kc_sf(geo = "block", year = 2020)
  ))
  exp <- sf_out$block
  expect_equal(act, exp)
})

test_that("zcta", {
  sf_in <- readRDS(test_path("fixtures", "sf_input.rds"))
  sf_out <- readRDS(test_path("fixtures", "sf_output.rds"))
  local_mocked_bindings(
    get_raw_sf1 = function(...) sf_in$place,
    get_raw_sf2 = function(...) sf_in$zcta
  )
  act <- suppressMessages(suppressWarnings(
    get_kc_sf(geo = "zcta", year = 2020)
  ))
  exp <- sf_out$zcta
  expect_equal(act, exp)
})
