#' American Community Survey population data
#'
#' @description
#' These data sets contain population data for Kansas City, Missouri, sourced
#' from the US Census Bureau's American Community Survey (ACS). For 1-year ACS
#' data sets, the summary level is Kansas City only. For 5-year ACS data sets,
#' summary levels include city, county, census tract, census block group, and
#' ZIP code tabulation area (ZCTA).
#'
#' Data sets were downloaded from [data.census.gov][cen] using `get_kc_pop()`.
#' See [Guidance for Data Users][gdu] for information on how to use ACS data.
#'
#' [cen]:https://data.census.gov/
#' [gdu]:https://www.census.gov/programs-surveys/acs/guidance.html
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
#'       \item Variable code (ACS table and variable codes separated by an
#'       underscore)
#'       \item Data type: character
#'     }
#'   }
#'   \item{estimate}{
#'     \itemize{
#'       \item Estimated population count
#'       \item Data type: double
#'     }
#'   }
#'   \item{moe}{
#'     \itemize{
#'       \item Margin of error
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
#'       \item ACS table name
#'       \item Data type: character
#'     }
#'   }
#'   \item{geography}{
#'     \itemize{
#'       \item Smallest geography for which a variable is summarized
#'       \item Data type: character
#'       \item 5-year ACS tables only
#'     }
#'   }
#' }
#'
#' @source US Census Bureau American Community Survey 1-Year and 5-Year data
#' sets
#'
#' @name acs
#' @keywords datasets
#'
#' @examples
#' acs1_city_2023
#'
#' acs5_tract_2023
#'
#' @rdname acs
"acs1_city_2018"
#' @rdname acs
"acs1_city_2019"
#' @rdname acs
"acs1_city_2021"
#' @rdname acs
"acs1_city_2022"
#' @rdname acs
"acs1_city_2023"
#' @rdname acs
"acs5_city_2018"
#' @rdname acs
"acs5_city_2019"
#' @rdname acs
"acs5_city_2020"
#' @rdname acs
"acs5_city_2021"
#' @rdname acs
"acs5_city_2022"
#' @rdname acs
"acs5_city_2023"
#' @rdname acs
"acs5_county_2018"
#' @rdname acs
"acs5_county_2019"
#' @rdname acs
"acs5_county_2020"
#' @rdname acs
"acs5_county_2021"
#' @rdname acs
"acs5_county_2022"
#' @rdname acs
"acs5_county_2023"
#' @rdname acs
"acs5_tract_2018"
#' @rdname acs
"acs5_tract_2019"
#' @rdname acs
"acs5_tract_2020"
#' @rdname acs
"acs5_tract_2021"
#' @rdname acs
"acs5_tract_2022"
#' @rdname acs
"acs5_tract_2023"
#' @rdname acs
"acs5_blockgroup_2018"
#' @rdname acs
"acs5_blockgroup_2019"
#' @rdname acs
"acs5_blockgroup_2020"
#' @rdname acs
"acs5_blockgroup_2021"
#' @rdname acs
"acs5_blockgroup_2022"
#' @rdname acs
"acs5_blockgroup_2023"
#' @rdname acs
"acs5_zcta_2018"
#' @rdname acs
"acs5_zcta_2019"
#' @rdname acs
"acs5_zcta_2020"
#' @rdname acs
"acs5_zcta_2021"
#' @rdname acs
"acs5_zcta_2022"
#' @rdname acs
"acs5_zcta_2023"
