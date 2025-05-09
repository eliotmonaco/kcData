geoids <- readRDS("data-raw/geoids.rds")

usethis::use_data(
  geoids,
  internal = TRUE,
  overwrite = TRUE
)
