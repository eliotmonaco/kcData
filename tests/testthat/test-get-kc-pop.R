test_that("acs1 place regex", {
  pop_in <- readRDS(test_path("fixtures", "pop_input.rds"))
  pop_out <- readRDS(test_path("fixtures", "pop_output.rds"))
  local_mocked_bindings(get_pop_acs = function(...) pop_in$acs1_city_2021_regex)
  act <- get_kc_pop(
    dataset = "acs1",
    geo = "place",
    year = 2021,
    vars = "^B01002A",
    var_match = "regex"
  )
  exp <- pop_out$acs1_city_2021_regex
  expect_equal(act, exp)
})

test_that("acs1 place fixed", {
  pop_in <- readRDS(test_path("fixtures", "pop_input.rds"))
  pop_out <- readRDS(test_path("fixtures", "pop_output.rds"))
  local_mocked_bindings(get_pop_acs = function(...) pop_in$acs1_city_2021)
  act <- get_kc_pop(
    dataset = "acs1",
    geo = "place",
    year = 2021,
    vars = "B01003_001",
    var_match = "fixed"
  )
  exp <- pop_out$acs1_city_2021
  expect_equal(act, exp)
})

test_that("acs5 place", {
  pop_in <- readRDS(test_path("fixtures", "pop_input.rds"))
  pop_out <- readRDS(test_path("fixtures", "pop_output.rds"))
  local_mocked_bindings(get_pop_acs = function(...) pop_in$acs5_city_2021)
  act <- get_kc_pop(
    dataset = "acs5",
    geo = "place",
    year = 2021,
    vars = "B01003_001",
    var_match = "fixed"
  )
  exp <- pop_out$acs5_city_2021
  expect_equal(act, exp)
})

test_that("acs5 county", {
  pop_in <- readRDS(test_path("fixtures", "pop_input.rds"))
  pop_out <- readRDS(test_path("fixtures", "pop_output.rds"))
  local_mocked_bindings(get_pop_acs = function(...) pop_in$acs5_county_2021)
  act <- get_kc_pop(
    dataset = "acs5",
    geo = "county",
    year = 2021,
    vars = "B01003_001",
    var_match = "fixed"
  )
  exp <- pop_out$acs5_county_2021
  expect_equal(act, exp)
})

test_that("acs5 tract", {
  pop_in <- readRDS(test_path("fixtures", "pop_input.rds"))
  pop_out <- readRDS(test_path("fixtures", "pop_output.rds"))
  local_mocked_bindings(get_pop_acs = function(...) pop_in$acs5_tract_2021)
  act <- get_kc_pop(
    dataset = "acs5",
    geo = "tract",
    year = 2021,
    vars = "B01003_001",
    var_match = "fixed"
  )
  exp <- pop_out$acs5_tract_2021
  expect_equal(act, exp)
})

test_that("acs5 block group", {
  pop_in <- readRDS(test_path("fixtures", "pop_input.rds"))
  pop_out <- readRDS(test_path("fixtures", "pop_output.rds"))
  local_mocked_bindings(get_pop_acs = function(...) pop_in$acs5_blockgroup_2021)
  act <- get_kc_pop(
    dataset = "acs5",
    geo = "block group",
    year = 2021,
    vars = "B01003_001",
    var_match = "fixed"
  )
  exp <- pop_out$acs5_blockgroup_2021
  expect_equal(act, exp)
})

test_that("acs5 zcta", {
  pop_in <- readRDS(test_path("fixtures", "pop_input.rds"))
  pop_out <- readRDS(test_path("fixtures", "pop_output.rds"))
  local_mocked_bindings(get_pop_acs = function(...) pop_in$acs5_zcta_2021)
  act <- get_kc_pop(
    dataset = "acs5",
    geo = "zcta",
    year = 2021,
    vars = "B01003_001",
    var_match = "fixed"
  )
  exp <- pop_out$acs5_zcta_2021
  expect_equal(act, exp)
})

test_that("dec place", {
  pop_in <- readRDS(test_path("fixtures", "pop_input.rds"))
  pop_out <- readRDS(test_path("fixtures", "pop_output.rds"))
  local_mocked_bindings(get_pop_dec = function(...) pop_in$dhc_city_2020)
  act <- get_kc_pop(
    dataset = "dhc",
    geo = "place",
    year = 2020,
    vars = "P12_001N",
    var_match = "fixed"
  )
  exp <- pop_out$dhc_city_2020
  expect_equal(act, exp)
})

test_that("dec county", {
  pop_in <- readRDS(test_path("fixtures", "pop_input.rds"))
  pop_out <- readRDS(test_path("fixtures", "pop_output.rds"))
  local_mocked_bindings(get_pop_dec = function(...) pop_in$dhc_county_2020)
  act <- get_kc_pop(
    dataset = "dhc",
    geo = "county",
    year = 2020,
    vars = "P12_001N",
    var_match = "fixed"
  )
  exp <- pop_out$dhc_county_2020
  expect_equal(act, exp)
})

test_that("dec tract", {
  pop_in <- readRDS(test_path("fixtures", "pop_input.rds"))
  pop_out <- readRDS(test_path("fixtures", "pop_output.rds"))
  local_mocked_bindings(get_pop_dec = function(...) pop_in$dhc_tract_2020)
  act <- get_kc_pop(
    dataset = "dhc",
    geo = "tract",
    year = 2020,
    vars = "P12_001N",
    var_match = "fixed"
  )
  exp <- pop_out$dhc_tract_2020
  expect_equal(act, exp)
})

test_that("dec block group", {
  pop_in <- readRDS(test_path("fixtures", "pop_input.rds"))
  pop_out <- readRDS(test_path("fixtures", "pop_output.rds"))
  local_mocked_bindings(get_pop_dec = function(...) pop_in$dhc_blockgroup_2020)
  act <- get_kc_pop(
    dataset = "dhc",
    geo = "block group",
    year = 2020,
    vars = "P12_001N",
    var_match = "fixed"
  )
  exp <- pop_out$dhc_blockgroup_2020
  expect_equal(act, exp)
})

test_that("dec block", {
  pop_in <- readRDS(test_path("fixtures", "pop_input.rds"))
  pop_out <- readRDS(test_path("fixtures", "pop_output.rds"))
  local_mocked_bindings(get_pop_dec = function(...) pop_in$dhc_block_2020)
  act <- get_kc_pop(
    dataset = "dhc",
    geo = "block",
    year = 2020,
    vars = "P12_001N",
    var_match = "fixed"
  )
  exp <- pop_out$dhc_block_2020
  expect_equal(act, exp)
})

test_that("dec zcta", {
  pop_in <- readRDS(test_path("fixtures", "pop_input.rds"))
  pop_out <- readRDS(test_path("fixtures", "pop_output.rds"))
  local_mocked_bindings(get_pop_dec = function(...) pop_in$dhc_zcta_2020)
  act <- get_kc_pop(
    dataset = "dhc",
    geo = "zcta",
    year = 2020,
    vars = "P12_001N",
    var_match = "fixed"
  )
  exp <- pop_out$dhc_zcta_2020
  expect_equal(act, exp)
})

test_that("no GEOIDs error: tract", {
  expect_error(
    get_kc_pop(
      dataset = "acs5",
      geo = "tract",
      year = 2030,
      vars = "B01003_001",
      var_match = "fixed"
    ),
    "GEOIDs for tract in 2030 are unavailable because the shapefiles are not in kcData"
  )
})

test_that("no GEOIDs error: zcta", {
  expect_error(
    get_kc_pop(
      dataset = "acs5",
      geo = "zcta",
      year = 2012,
      vars = "B01003_001",
      var_match = "fixed"
    ),
    "GEOIDs for zcta in 2012 are unavailable because the shapefiles are not in kcData"
  )
})
