#' Population data sets
#'
#' @description
#' These data sets contain population data for Kansas City, Missouri, sourced
#' from the US Census Bureau's American Community Survey (ACS). In 1-year ACS
#' data sets, the summary level is Kansas City only. In 5-year ACS data sets,
#' available summary levels include city, census tract, and ZIP code tabulation
#' area (ZCTA).
#'
#' Data sets were downloaded from [data.census.gov][cen] using the
#' [tidycensus][tc] package. Tables... variables...
#'
#' See [Guidance for Data Users][gdu] for information from census.gov on how to
#' use ACS data.
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
#'       \item Variable ID consisting of the source table ID and variable code separated by an underscore
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
#'       \item Margin of error for estimate
#'       \item Data type: double
#'     }
#'   }
#'   \item{label}{
#'     \itemize{
#'       \item Variable label consisting of the nested sequence of column labels from the source table
#'       \item Data type: character
#'     }
#'   }
#'   \item{concept}{
#'     \itemize{
#'       \item Source table name
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
#' @source American Community Survey 1-Year and 5-Year data sets (2014-2023)
#'
#' @name population
#' @keywords datasets
#'
#' @examples
#' acs1_2023
#'
#' acs5_tract_2023
#'
#' @rdname population
"acs1_2014"
#' @rdname population
"acs1_2015"
#' @rdname population
"acs1_2016"
#' @rdname population
"acs1_2017"
#' @rdname population
"acs1_2018"
#' @rdname population
"acs1_2019"
#' @rdname population
"acs1_2021"
#' @rdname population
"acs1_2022"
#' @rdname population
"acs1_2023"
#' @rdname population
"acs5_city_2014"
#' @rdname population
"acs5_city_2015"
#' @rdname population
"acs5_city_2016"
#' @rdname population
"acs5_city_2017"
#' @rdname population
"acs5_city_2018"
#' @rdname population
"acs5_city_2019"
#' @rdname population
"acs5_city_2020"
#' @rdname population
"acs5_city_2021"
#' @rdname population
"acs5_city_2022"
#' @rdname population
"acs5_city_2023"
#' @rdname population
"acs5_tract_2014"
#' @rdname population
"acs5_tract_2015"
#' @rdname population
"acs5_tract_2016"
#' @rdname population
"acs5_tract_2017"
#' @rdname population
"acs5_tract_2018"
#' @rdname population
"acs5_tract_2019"
#' @rdname population
"acs5_tract_2020"
#' @rdname population
"acs5_tract_2021"
#' @rdname population
"acs5_tract_2022"
#' @rdname population
"acs5_tract_2023"
#' @rdname population
"acs5_zcta_2014"
#' @rdname population
"acs5_zcta_2015"
#' @rdname population
"acs5_zcta_2016"
#' @rdname population
"acs5_zcta_2017"
#' @rdname population
"acs5_zcta_2018"
#' @rdname population
"acs5_zcta_2019"
#' @rdname population
"acs5_zcta_2020"
#' @rdname population
"acs5_zcta_2021"
#' @rdname population
"acs5_zcta_2022"
#' @rdname population
"acs5_zcta_2023"
