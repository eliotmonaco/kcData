#' Kansas City population data sets
#'
#' @description
#' These data sets contain population data for Kansas City, Missouri, sourced
#' from the US Census Bureau's American Community Survey (ACS). In 1-year ACS
#' data sets, the summary level is Kansas City only. In 5-year ACS data sets,
#' available summary levels include city, census tract, and ZIP code tabulation
#' area (ZCTA).
#'
#' Data sets were obtained from [data.census.gov][cen] using the
#' [tidycensus][tc] package.
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
#'       \item The unique numeric identifier for a geography.
#'       \item Data type: text
#'     }
#'   }
#'   \item{NAME}{
#'     \itemize{
#'       \item The name of a geography.
#'       \item Data type: text
#'     }
#'   }
#'   \item{variable}{
#'     \itemize{
#'       \item The source table ID and variable code, separated by an underscore, of the estimate.
#'       \item Data type: text
#'     }
#'   }
#'   \item{estimate}{
#'     \itemize{
#'       \item The estimated population count.
#'       \item Data type: integer
#'     }
#'   }
#'   \item{moe}{
#'     \itemize{
#'       \item The margin of error for the estimate.
#'       \item Data type: integer
#'     }
#'   }
#'   \item{label}{
#'     \itemize{
#'       \item The nested sequence of column labels for the estimate from the source table.
#'       \item Data type: text
#'     }
#'   }
#'   \item{concept}{
#'     \itemize{
#'       \item The name of the source table containing the estimate.
#'       \item Data type: text
#'     }
#'   }
#'   \item{geography}{
#'     \itemize{
#'       \item The smallest geography for which a variable is summarized (5-year ACS only).
#'       \item Data type: text
#'     }
#'   }
#' }
#'
#' @source American Community Survey 1-Year and 5-year data (2014-2023)
#'
#' @name population
#' @keywords datasets
#'
#' @examples
#' pop_2023_acs1
#'
#' pop_2023_acs5_tract
#'
#' @rdname population
"pop_2023_acs1"

#' @rdname population
"pop_2023_acs5_city"

#' @rdname population
"pop_2023_acs5_tract"

#' @rdname population
"pop_2023_acs5_zcta"

#' @rdname population
"pop_2022_acs1"

#' @rdname population
"pop_2022_acs5_city"

#' @rdname population
"pop_2022_acs5_tract"

#' @rdname population
"pop_2022_acs5_zcta"

#' @rdname population
"pop_2021_acs1"

#' @rdname population
"pop_2021_acs5_city"

#' @rdname population
"pop_2021_acs5_tract"

#' @rdname population
"pop_2021_acs5_zcta"

#' @rdname population
"pop_2020_acs1"

#' @rdname population
"pop_2020_acs5_city"

#' @rdname population
"pop_2020_acs5_tract"

#' @rdname population
"pop_2020_acs5_zcta"

#' @rdname population
"pop_2019_acs1"

#' @rdname population
"pop_2019_acs5_city"

#' @rdname population
"pop_2019_acs5_tract"

#' @rdname population
"pop_2019_acs5_zcta"

#' @rdname population
"pop_2018_acs1"

#' @rdname population
"pop_2018_acs5_city"

#' @rdname population
"pop_2018_acs5_tract"

#' @rdname population
"pop_2018_acs5_zcta"

#' @rdname population
"pop_2017_acs1"

#' @rdname population
"pop_2017_acs5_city"

#' @rdname population
"pop_2017_acs5_tract"

#' @rdname population
"pop_2017_acs5_zcta"

#' @rdname population
"pop_2016_acs1"

#' @rdname population
"pop_2016_acs5_city"

#' @rdname population
"pop_2016_acs5_tract"

#' @rdname population
"pop_2016_acs5_zcta"

#' @rdname population
"pop_2015_acs1"

#' @rdname population
"pop_2015_acs5_city"

#' @rdname population
"pop_2015_acs5_tract"

#' @rdname population
"pop_2015_acs5_zcta"

#' @rdname population
"pop_2014_acs1"

#' @rdname population
"pop_2014_acs5_city"

#' @rdname population
"pop_2014_acs5_tract"

#' @rdname population
"pop_2014_acs5_zcta"
