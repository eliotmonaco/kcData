#' Get simple features objects for Kansas City
#'
#' @description
#' Download a TIGER/Line shapefile from the US Census Bureau with boundaries for
#' Kansas City or for a geography intersecting with Kansas City (counties,
#' census tracts, census block groups, census blocks, or zip code tabulation
#' areas (ZCTAs)). Files are downloaded using the [tigris][tig] package.
#'
#' [tig]:https://github.com/walkerke/tigris
#'
#' @details
#' Geographies that intersect with the city boundary are circumscribed to the
#' city boundary if they are not fully within the city.
#'
#' These columns are added to the shapefiles for all geographies other than
#' "place":
#'
#' - `area`: the total area of the feature
#' - `kc_area`: the area of the feature contained within the city boundary
#' - `kc_area_pct`: the percentage of the feature within the city boundary
#'
#' Area is calculated by [sf::st_area()].
#'
#' @param geo The geography of the data set to download. `"place"` returns the
#' city boundary geometry. All others return geometries that intersect with the
#' city boundary.
#' @param year The year of the data set to download.
#'
#' @returns A dataframe of class `sf` containing a simple feature list column.
#' @export
#'
#' @examples
#' \dontrun{
#' get_kc_sf(2024, "tract")
#' }
#'
get_kc_sf <- function(
    geo = c("place", "county", "tract", "block group", "block", "zcta"),
    year) {
  requireNamespace("tigris")
  requireNamespace("sf")

  geo <- match.arg(geo)

  # Download the Missouri shapefile
  pl <- tryCatch(
    get_raw_sf1(year),
    error = function(e) NULL
  )

  if (is.null(pl)) return(pl)

  # Filter for the city boundary
  pl <- pl[which(pl$NAME == "Kansas City"), ]

  # Return the city boundary or download the shapefile for the specified
  # geography
  if (geo == "place") {
    pl
  } else {
    alt <- tryCatch(
      get_raw_sf2(geo, year),
      error = function(e) NULL
    )

    if (is.null(alt)) return(alt)

    cols <- colnames(alt)

    # Get the area of the full geographic unit
    alt$area <- sf::st_area(alt)

    # Restrict each unit to the portion within the city
    alt <- sf::st_intersection(pl[, "geometry"], alt)

    # Check validity of geometry
    valid <- sf::st_is_valid(alt)

    if (!all(valid)) {
      alt <- sf::st_make_valid(alt)
      message("Invalid geometry found in source data")
    }

    # Get the area of the intersecting portion
    alt$kc_area <- sf::st_area(alt)

    # Remove geometries with area of 0
    if (any(as.numeric(alt$kc_area) == 0)) {
      alt <- alt[as.numeric(alt$kc_area) != 0, ]
      message("Geometries with area of 0 removed")
    }

    # Calculate the percentage of the area within the city
    alt$kc_area_pct <- as.numeric(alt$kc_area * 100 / alt$area)

    alt[, c(cols, "area", "kc_area", "kc_area_pct")]
  }
}

get_raw_sf1 <- function(year) {
  tigris::places(state = 29, year = year)
}

get_raw_sf2 <- function(geo, year) {
  counties <- c(037, 047, 095, 165) # Cass, Clay, Jackson, & Platte
  if (geo == "county") {
    tigris::counties(state = 29, year = year)
  } else if (geo == "tract") {
    tigris::tracts(state = 29, year = year)
  } else if (geo == "block group") {
    tigris::block_groups(state = 29, county = counties, year = year)
  } else if (geo == "block") {
    tigris::blocks(state = 29, county = counties, year = year)
  } else if (geo == "zcta") {
    tigris::zctas(starts_with = 64:66, year = year)
  }
}

get_raw_sf <- function(geo, year) {
  if (geo == "place") {
    get_raw_sf1(year)
  } else {
    get_raw_sf2(geo, year)
  }
}
