# Create `geoid`

# Get GEOIDs for regions of Kansas City. For census tracts and ZCTAs, GEOIDs are
# included if 10% or more of their area is within the Kansas City boundary.

# tigris package website showing the availability of datasets by year:
# https://github.com/walkerke/tigris

get_geoids <- function(sf) {
  var <- colnames(sf)[grepl("^GEOID(10|20)?$", colnames(sf))]

  sf |>
    sf::st_drop_geometry() |>
    dplyr::mutate(frac = as.numeric(city_area / area)) |>
    dplyr::filter(frac >= .1) |>
    dplyr::pull(.data[[var]]) |>
    sort()
}

geoid <- list()

# State
geoid$state <- c("Missouri" = "29")

# CBSA
geoid$cbsa <- c("Kansas City, MO-KS Metro Area" = "28140")

# Place
geoid$place <- c("Kansas City" = "2938000")

# County
geoid$county <- c(
  "Cass" = "29037",
  "Clay" = "29047",
  "Jackson" = "29095",
  "Platte" = "29165"
)

# Tract
yr <- 2011:2024

sftract <- lapply(yr, \(x) {
  sf <- get_kc_sf("tract", x, "city", "clipped")
})
names(sftract) <- paste0("tract", yr)

idtract <- lapply(sftract, get_geoids)

df <- setmeup::batch_compare(idtract)

geoid$tract2010 <- idtract$tract2011

geoid$tract2020 <- idtract$tract2020

# ZCTA
yr <- 2012:2024

sfzcta <- lapply(yr, \(x) {
  sf <- get_kc_sf("zcta", x, "city", "clipped")
})
names(sfzcta) <- paste0("zcta", yr)

idzcta <- lapply(sfzcta, get_geoids)

df <- setmeup::batch_compare(idzcta)

geoid$zcta2010 <- idzcta$zcta2012

geoid$zcta2020 <- idzcta$zcta2020

# Save
usethis::use_data(geoid, overwrite = T)

