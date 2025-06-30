#' Decennial census population data
#'
#' @description
#' These data sets contain population data for Kansas City, Missouri, sourced
#' from the US Census Bureau's decennial census. Summary levels include city,
#' county, census tract, census block group, census block, and ZIP code
#' tabulation area (ZCTA).
#'
#' Data sets were downloaded from [data.census.gov][cen] using `get_kc_pop()`.
#' See [Guidance for Decennial Census of Population and Housing Data Users][gdu]
#' for information on how to use decennial census data.
#'
#' [cen]:https://data.census.gov/
#' [gdu]:https://www.census.gov/programs-surveys/decennial-census/guidance.html
#'
#' @format
#' \describe{
#'   \item{GEOID}{
#'     \itemize{
#'       \item Geographic identifier
#'       \item Data type: character
#'     }
#'   }
#'   \item{NAME}{
#'     \itemize{
#'       \item Geographic area name
#'       \item Data type: character
#'     }
#'   }
#'   \item{variable}{
#'     \itemize{
#'       \item Variable code
#'       \item Data type: character
#'     }
#'   }
#'   \item{value}{
#'     \itemize{
#'       \item Population count
#'       \item Data type: double
#'     }
#'   }
#'   \item{label}{
#'     \itemize{
#'       \item Descriptive variable label
#'       \item Data type: character
#'     }
#'   }
#'   \item{concept}{
#'     \itemize{
#'       \item Census table name
#'       \item Data type: character
#'     }
#'   }
#' }
#'
#' @source US Census Bureau decennial census
#'
#' @name dec
#' @keywords datasets
#'
#' @examples
#' dec_city_2010
#'
#' dec_tract_2020
#'
#' @rdname dec
"dec_city_2010"
#' @rdname dec
"dec_city_2020"
#' @rdname dec
"dec_county_2010"
#' @rdname dec
"dec_county_2020"
#' @rdname dec
"dec_tract_2010"
#' @rdname dec
"dec_tract_2020"
#' @rdname dec
"dec_blockgroup_2010"
#' @rdname dec
"dec_blockgroup_2020"
#' @rdname dec
"dec_block_2010"
#' @rdname dec
"dec_block_2020"
#' @rdname dec
"dec_zcta_2010"
#' @rdname dec
"dec_zcta_2020"
