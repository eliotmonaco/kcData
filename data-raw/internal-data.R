SOMEDATA <- readRDS("data-raw/SOMEDATA.rds")

usethis::use_data(
  SOMEDATA,
  internal = TRUE,
  overwrite = TRUE
)
