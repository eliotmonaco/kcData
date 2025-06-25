# Create data to test `get_kc_sf()`

devtools::load_all()

source("tests/testthat/fixtures/fn-test-get-kc-sf.R")

options(tigris_use_cache = TRUE)

geo <- c("place", "county", "tract", "block group", "block", "zcta")
year <- 2020

# Create input data
sf_input <- lapply(geo, \(x) {
  if (x == "place") {
    get_raw_sf1(year)
  } else {
    get_raw_sf2(x, year)
  }
})
names(sf_input) <- gsub("\\s", "", geo)

# Filter a subset of rows to reduce testing time
rows <- list(
  place = which(grepl("^38", sf_input$place$PLACEFP)),
  county = which(grepl("^04", sf_input$county$COUNTYFP)),
  tract = which(sf_input$tract$COUNTYFP == "047"),
  blockgroup = which(sf_input$blockgroup$COUNTYFP == "047")[1:100],
  block = which(sf_input$block$COUNTYFP == "047")[1:100],
  zcta = which(grepl("^64[01]", sf_input$zcta$ZCTA5CE20))
)

sf_input2 <- purrr::map2(sf_input, rows, \(x, y) x[y, ])

# Create output data
sf_output <- lapply(geo, \(x) test_get_kc_sf(geo = x, test_input = sf_input2))
names(sf_output) <- gsub("\\s", "", geo)

# Plot
sf_plots <- purrr::imap(sf_output, \(x, y) {
  ggplot2::ggplot() +
    ggplot2::geom_sf(
      data = sf_output$place,
      color = "darkblue",
      fill = "lightblue",
      linewidth = 1
    ) +
    ggplot2::geom_sf(
      data = x,
      color = "red",
      fill = "red",
      alpha = .5
    ) +
    ggplot2::ggtitle(y)
})

lapply(sf_plots, print)

saveRDS(sf_input2, "tests/testthat/fixtures/sf_input.rds")
saveRDS(sf_output, "tests/testthat/fixtures/sf_output.rds")
