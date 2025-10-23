load("data/popest_ic20.rda")
load("data/popest_v24.rda")

usethis::use_data(
  popest_ic20,
  popest_v24,
  internal = TRUE,
  overwrite = TRUE
)
