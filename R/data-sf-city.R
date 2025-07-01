#' City boundary shapefiles
#'
#' @description
#' TIGER/Line shapefiles for the city of Kansas City, Missouri, downloaded from
#' [census.gov][cen] and modified using [get_kc_sf()].
#'
#' [cen]:https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html
#'
#' The US Census Bureau uses the Global Coordinate System North American Datum
#' of 1983 (GCS NAD83/EPSG: 4269).
#'
#' @format
#' Not all variables are present in all years.
#' \describe{
#'   \item{STATEFP}{
#'     \itemize{
#'       \item State FIPS code
#'       \item Data type: character
#'     }
#'   }
#'   \item{PLACEFP}{
#'     \itemize{
#'       \item Place FIPS code
#'       \item Data type: character
#'     }
#'   }
#'   \item{PLACENS}{
#'     \itemize{
#'       \item Place NS code
#'       \item Data type: character
#'     }
#'   }
#'   \item{GEOID}{
#'     \itemize{
#'       \item Geographic identifier
#'       \item Data type: character
#'     }
#'   }
#'   \item{GEOIDFQ}{
#'     \itemize{
#'       \item Fully qualified GEOID
#'       \item Data type: character
#'     }
#'   }
#'   \item{NAME}{
#'     \itemize{
#'       \item Geographic area name
#'       \item Data type: character
#'     }
#'   }
#'   \item{NAMELSAD}{
#'     \itemize{
#'       \item Geographic area name and legal/statistical area description
#'       \item Data type: character
#'     }
#'   }
#'   \item{LSAD}{
#'     \itemize{
#'       \item Legal/statistical area description
#'       \item Data type: character
#'     }
#'   }
#'   \item{CLASSFP}{
#'     \itemize{
#'       \item FIPS class code
#'       \item Data type: character
#'     }
#'   }
#'   \item{PCICBSA}{
#'     \itemize{
#'       \item Core based statistical area principal city indicator
#'       \item Data type: character
#'     }
#'   }
#'   \item{PCINECTA}{
#'     \itemize{
#'       \item New England city and town area principal city indicator
#'       \item Data type: character
#'     }
#'   }
#'   \item{MTFCC}{
#'     \itemize{
#'       \item MAF/TIGER feature class code
#'       \item Data type: character
#'     }
#'   }
#'   \item{FUNCSTAT}{
#'     \itemize{
#'       \item Legal functional status
#'       \item Data type: character
#'     }
#'   }
#'   \item{ALAND}{
#'     \itemize{
#'       \item Land area
#'       \item Data type: numeric
#'     }
#'   }
#'   \item{AWATER}{
#'     \itemize{
#'       \item Water area
#'       \item Data type: numeric
#'     }
#'   }
#'   \item{INTPTLAT}{
#'     \itemize{
#'       \item Latitude of the internal point
#'       \item Data type: character
#'     }
#'   }
#'   \item{INTPTLON}{
#'     \itemize{
#'       \item Longitude of the internal point
#'       \item Data type: character
#'     }
#'   }
#'   \item{geometry}{
#'     \itemize{
#'       \item Feature geometry
#'       \item Data type: list
#'     }
#'   }
#' }
#'
#' @source US Census Bureau TIGER/Line Shapefiles
#'
#' @name sf-city
#' @keywords datasets
#'
#' @rdname sf-city
"sf_city_2015"
#' @rdname sf-city
"sf_city_2016"
#' @rdname sf-city
"sf_city_2017"
#' @rdname sf-city
"sf_city_2018"
#' @rdname sf-city
"sf_city_2019"
#' @rdname sf-city
"sf_city_2020"
#' @rdname sf-city
"sf_city_2021"
#' @rdname sf-city
"sf_city_2022"
#' @rdname sf-city
"sf_city_2023"
#' @rdname sf-city
"sf_city_2024"
