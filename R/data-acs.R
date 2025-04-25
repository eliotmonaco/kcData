#' American Community Survey population data
#'
#' @description
#' These data sets contain population data for Kansas City, Missouri, sourced
#' from the US Census Bureau's American Community Survey (ACS). In 1-year ACS
#' data sets, the summary level is Kansas City only. In 5-year ACS data sets,
#' available summary levels include city, census tract, and ZIP code tabulation
#' area (ZCTA).
#'
#' Data sets were downloaded from [data.census.gov][cen] using the
#' [tidycensus][tc] package. All data variables from the full and collapsed Age
#' and Sex, Race, and Hispanic Origin tables are included (i.e., tables
#' beginning with B01, B02, B03, C01, C02, and C03).
#'
#' See [Guidance for Data Users][gdu] for information on how to use ACS data.
#'
#' [cen]:https://data.census.gov/
#' [tc]:https://walker-data.com/tidycensus/index.html
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
#' sets (2014-2023)
#'
#' @name acs
#' @keywords datasets
#'
#' @examples
#' acs1_2023
#'
#' acs5_tract_2023
#'
#' @rdname acs
"acs1_2014"
#' @rdname acs
"acs1_2015"
#' @rdname acs
"acs1_2016"
#' @rdname acs
"acs1_2017"
#' @rdname acs
"acs1_2018"
#' @rdname acs
"acs1_2019"
#' @rdname acs
"acs1_2021"
#' @rdname acs
"acs1_2022"
#' @rdname acs
"acs1_2023"
#' @rdname acs
"acs5_city_2014"
#' @rdname acs
"acs5_city_2015"
#' @rdname acs
"acs5_city_2016"
#' @rdname acs
"acs5_city_2017"
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
"acs5_tract_2014"
#' @rdname acs
"acs5_tract_2015"
#' @rdname acs
"acs5_tract_2016"
#' @rdname acs
"acs5_tract_2017"
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
"acs5_zcta_2014"
#' @rdname acs
"acs5_zcta_2015"
#' @rdname acs
"acs5_zcta_2016"
#' @rdname acs
"acs5_zcta_2017"
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
