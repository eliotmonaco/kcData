test_that("get estimates", {
  act <- return_popest_table(2018:2022)
  exp <- data.frame(
    year = 2018:2022,
    estimate = c(501763, 506398, 508096, 508995, 508913)
  )
  expect_equal(act, exp)
})

test_that("unavailable years", {
  expect_error(
    return_popest_table(2009:2011),
    paste(
      "some years in `years` are unavailable",
      "in `popest_ic20` and `popest_v24`"
    )
  )
})
