test_that("acs1 place regex", {
  data1 <- readRDS(test_path("fixtures", "pop_raw.rds"))
  data2 <- readRDS(test_path("fixtures", "pop_output.rds"))
  local_mocked_bindings(get_pop_acs = function(...) data1$acs1_city_2021_regex)
  act <- data2$acs1_city_2021_regex
  exp <- get_kc_pop(
    dataset = "acs1",
    geo = "place",
    year = 2021,
    vars = "^B01002A",
    var_match = "regex"
  )
  expect_equal(act, exp)
})

test_that("acs1 place fixed", {
  data1 <- readRDS(test_path("fixtures", "pop_raw.rds"))
  data2 <- readRDS(test_path("fixtures", "pop_output.rds"))
  local_mocked_bindings(get_pop_acs = function(...) data1$acs1_city_2021)
  act <- data2$acs1_city_2021
  exp <- get_kc_pop(
    dataset = "acs1",
    geo = "place",
    year = 2021,
    vars = "B01003_001",
    var_match = "fixed"
  )
  expect_equal(act, exp)
})

test_that("acs5 place", {
  data1 <- readRDS(test_path("fixtures", "pop_raw.rds"))
  data2 <- readRDS(test_path("fixtures", "pop_output.rds"))
  local_mocked_bindings(get_pop_acs = function(...) data1$acs5_city_2021)
  act <- data2$acs5_city_2021
  exp <- get_kc_pop(
    dataset = "acs5",
    geo = "place",
    year = 2021,
    vars = "B01003_001",
    var_match = "fixed"
  )
  expect_equal(act, exp)
})

test_that("acs5 county", {
  data1 <- readRDS(test_path("fixtures", "pop_raw.rds"))
  data2 <- readRDS(test_path("fixtures", "pop_output.rds"))
  local_mocked_bindings(get_pop_acs = function(...) data1$acs5_county_2021)
  act <- data2$acs5_county_2021
  exp <- get_kc_pop(
    dataset = "acs5",
    geo = "county",
    year = 2021,
    vars = "B01003_001",
    var_match = "fixed"
  )
  expect_equal(act, exp)
})

test_that("acs5 tract", {
  data1 <- readRDS(test_path("fixtures", "pop_raw.rds"))
  data2 <- readRDS(test_path("fixtures", "pop_output.rds"))
  local_mocked_bindings(get_pop_acs = function(...) data1$acs5_tract_2021)
  act <- data2$acs5_tract_2021
  exp <- get_kc_pop(
    dataset = "acs5",
    geo = "tract",
    year = 2021,
    vars = "B01003_001",
    var_match = "fixed"
  )
  expect_equal(act, exp)
})

test_that("acs5 block group", {
  data1 <- readRDS(test_path("fixtures", "pop_raw.rds"))
  data2 <- readRDS(test_path("fixtures", "pop_output.rds"))
  local_mocked_bindings(get_pop_acs = function(...) data1$acs5_blockgroup_2021)
  act <- data2$acs5_blockgroup_2021
  exp <- get_kc_pop(
    dataset = "acs5",
    geo = "block group",
    year = 2021,
    vars = "B01003_001",
    var_match = "fixed"
  )
  expect_equal(act, exp)
})

test_that("acs5 zcta", {
  data1 <- readRDS(test_path("fixtures", "pop_raw.rds"))
  data2 <- readRDS(test_path("fixtures", "pop_output.rds"))
  local_mocked_bindings(get_pop_acs = function(...) data1$acs5_zcta_2021)
  act <- data2$acs5_zcta_2021
  exp <- get_kc_pop(
    dataset = "acs5",
    geo = "zcta",
    year = 2021,
    vars = "B01003_001",
    var_match = "fixed"
  )
  expect_equal(act, exp)
})

test_that("dec place", {
  data1 <- readRDS(test_path("fixtures", "pop_raw.rds"))
  data2 <- readRDS(test_path("fixtures", "pop_output.rds"))
  local_mocked_bindings(get_pop_dec = function(...) data1$dhc_city_2020)
  act <- data2$dhc_city_2020
  exp <- get_kc_pop(
    dataset = "dhc",
    geo = "place",
    year = 2020,
    vars = "P12_001N",
    var_match = "fixed"
  )
  expect_equal(act, exp)
})

test_that("dec county", {
  data1 <- readRDS(test_path("fixtures", "pop_raw.rds"))
  data2 <- readRDS(test_path("fixtures", "pop_output.rds"))
  local_mocked_bindings(get_pop_dec = function(...) data1$dhc_county_2020)
  act <- data2$dhc_county_2020
  exp <- get_kc_pop(
    dataset = "dhc",
    geo = "county",
    year = 2020,
    vars = "P12_001N",
    var_match = "fixed"
  )
  expect_equal(act, exp)
})

test_that("dec tract", {
  data1 <- readRDS(test_path("fixtures", "pop_raw.rds"))
  data2 <- readRDS(test_path("fixtures", "pop_output.rds"))
  local_mocked_bindings(get_pop_dec = function(...) data1$dhc_tract_2020)
  act <- data2$dhc_tract_2020
  exp <- get_kc_pop(
    dataset = "dhc",
    geo = "tract",
    year = 2020,
    vars = "P12_001N",
    var_match = "fixed"
  )
  expect_equal(act, exp)
})

test_that("dec block group", {
  data1 <- readRDS(test_path("fixtures", "pop_raw.rds"))
  data2 <- readRDS(test_path("fixtures", "pop_output.rds"))
  local_mocked_bindings(get_pop_dec = function(...) data1$dhc_blockgroup_2020)
  act <- data2$dhc_blockgroup_2020
  exp <- get_kc_pop(
    dataset = "dhc",
    geo = "block group",
    year = 2020,
    vars = "P12_001N",
    var_match = "fixed"
  )
  expect_equal(act, exp)
})

test_that("dec block", {
  data1 <- readRDS(test_path("fixtures", "pop_raw.rds"))
  data2 <- readRDS(test_path("fixtures", "pop_output.rds"))
  local_mocked_bindings(get_pop_dec = function(...) data1$dhc_block_2020)
  act <- data2$dhc_block_2020
  exp <- get_kc_pop(
    dataset = "dhc",
    geo = "block",
    year = 2020,
    vars = "P12_001N",
    var_match = "fixed"
  )
  expect_equal(act, exp)
})

test_that("dec zcta", {
  data1 <- readRDS(test_path("fixtures", "pop_raw.rds"))
  data2 <- readRDS(test_path("fixtures", "pop_output.rds"))
  local_mocked_bindings(get_pop_dec = function(...) data1$dhc_zcta_2020)
  act <- data2$dhc_zcta_2020
  exp <- get_kc_pop(
    dataset = "dhc",
    geo = "zcta",
    year = 2020,
    vars = "P12_001N",
    var_match = "fixed"
  )
  expect_equal(act, exp)
})
