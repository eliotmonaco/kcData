#' Intercensal population estimates, 2010-2020
#'
#' @description
#' Kansas City population estimates for 2010-2019. According to the [US Census
#' Bureau][ic1], "Once produced, the intercensal estimates become the preferred series
#' of data for the decade."
#'
#' [ic1]: https://www.census.gov/programs-surveys/popest/technical-documentation/research/intercensal-estimates.html
#'
#' @format
#' \describe{
#'   \item{geographic_area}{Area name}
#'   \item{est_base_apr_1_2010}{April 1, 2010, resident population estimates base}
#'   \item{est_\[year\]}{Resident population estimate as of July 1 of the year}
#'   \item{census_apr_1_2020}{April 1, 2020, census population count}
#' }
#'
#' @source [US Census Bureau, City and Town Intercensal Population Totals:
#' 2010-2020][ic2]
#'
#' [ic2]: https://www.census.gov/data/tables/time-series/demo/popest/intercensal-2010-2020-cities.html
#'
#' @name popest_ic20
#' @keywords datasets
"popest_ic20"
