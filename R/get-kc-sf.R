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
#' These columns are added to the shapefiles for geographies intersecting with
#' the city boundary:
#' - `area`: the total area of the geographic unit
#' - `kc_area`: the area of the geographic unit within the city boundary
#' - `kc_area_pct`: the percentage of the geographic unit within the city
#' boundary
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
  requireNamespace("tigris", quietly = TRUE)
  requireNamespace("sf", quietly = TRUE)

  geo <- match.arg(geo)

  df <- tigris::places(state = 29, year = year)

  df <- df[which(df$NAME == "Kansas City"), ]

  if (geo == "place") {
    df
  } else {
    if (geo == "county") {
      df2 <- tigris::counties(
        state = 29,
        year = year
      )
    } else if (geo == "tract") {
      df2 <- tigris::tracts(
        state = 29,
        year = year
      )
    } else if (geo == "block group") {
      df2 <- tigris::block_groups(
        state = 29,
        county = c("Cass", "Clay", "Jackson", "Platte"),
        year = year
      )
    } else if (geo == "block") {
      df2 <- tigris::blocks(
        state = 29,
        county = c("Cass", "Clay", "Jackson", "Platte"),
        year = year
      )
    } else if (geo == "zcta") {
      df2 <- tigris::zctas(
        starts_with = c("64", "66"),
        year = year
      )
    }

    cols <- colnames(df2)

    df2$area <- sf::st_area(df2)

    df2 <- sf::st_intersection(df2, df[, "geometry"])

    df2$kc_area <- sf::st_area(df2)

    df2$kc_area_pct <- as.numeric(df2$kc_area * 100 / df2$area)

    df2[, c(cols, "area", "kc_area", "kc_area_pct")]
  }
}
