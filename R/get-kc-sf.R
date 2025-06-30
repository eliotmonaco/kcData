#' Get simple features objects for Kansas City
#'
#' @description
#' Download a TIGER/Line shapefile with boundaries for Kansas City or for a
#' geography intersecting with Kansas City: county, census tract, census block
#' group, census block, or zip code tabulation area (ZCTA). Files are downloaded
#' from the US Census Bureau using the [tigris][tig] package.
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
#' # Additional resources
#'
#' - [TIGER/Line Shapefiles and TIGER/Line Files Technical Documentation][tl]
#' - [Standard Hierarchy of Census Geographic Entities][geo]
#' - [tigris package][tig]
#'
#' [tl]:https://www.census.gov/programs-surveys/geography/technical-documentation/complete-technical-documentation/tiger-geo-line.html
#' [geo]:https://www2.census.gov/geo/pdfs/reference/geodiagram.pdf
#' [tig]:https://github.com/walkerke/tigris
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
#' get_kc_sf("tract", 2024)
#' }
#'
get_kc_sf <- function(
    geo = c("place", "county", "tract", "block group", "block", "zcta"),
    year) {
  requireNamespace("tigris")
  requireNamespace("sf")

  geo <- match.arg(geo)

  # Download the Missouri shapefile
  sf1 <- tryCatch(
    get_raw_sf1(year),
    error = function(e) {
      cat("tigris error:", conditionMessage(e), "\n")
      NULL
    }
  )

  if (is.null(sf1)) return(sf1)

  # Filter for the city boundary
  sf1 <- sf1[which(sf1$PLACEFP == "38000"), ]

  # Return the city boundary or download the shapefile for the specified
  # geography
  if (geo == "place") {
    sf1
  } else {
    sf2 <- tryCatch(
      get_raw_sf2(geo, year),
      error = function(e) {
        cat("tigris error:", conditionMessage(e), "\n")
        NULL
      }
    )

    if (is.null(sf2)) return(sf2)

    cols <- colnames(sf2)

    # Get the area of each geometry
    sf2$area <- sf::st_area(sf2)

    # Restrict each geometry to the area within the city
    sf2 <- sf::st_intersection(sf1[, "geometry"], sf2)

    # Keep only polygons
    sf2 <- sf::st_collection_extract(sf2, "POLYGON")

    sf2 <- sf::st_make_valid(sf2)

    sf2 <- sf2[!sf::st_is_empty(sf2), ]

    # Get the area of the intersecting portion
    sf2$kc_area <- sf::st_area(sf2)

    # Calculate the percentage of the area within the city
    sf2$kc_area_pct <- as.numeric(sf2$kc_area * 100 / sf2$area)

    cols <- c(
      cols[!cols %in% "geometry"],
      "area", "kc_area", "kc_area_pct", "geometry"
    )

    sf2[, cols]
  }
}

get_raw_sf1 <- function(year) {
  if (as.numeric(year) == 2010) {
    url <- "https://www2.census.gov/geo/tiger/TIGER2010/PLACE/2010/tl_2010_29_place10.zip"
    tigris:::load_tiger(url = url, tigris_type = "place")
  } else {
    tigris::places(state = 29, year = year)
  }
}

get_raw_sf2 <- function(geo, year) {
  counties <- c("037", "047", "095", "165") # Cass, Clay, Jackson, & Platte
  if (geo == "county") {
    tigris::counties(state = 29, year = year)
  } else if (geo == "tract") {
    tigris::tracts(state = 29, year = year)
  } else if (geo == "block group") {
    tigris::block_groups(state = 29, county = counties, year = year)
  } else if (geo == "block") {
    tigris::blocks(state = 29, county = counties, year = year)
  } else if (geo == "zcta") {
    tigris::zctas(starts_with = 64, year = year)
  }
}
