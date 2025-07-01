#' ZIP code tabulation area (ZCTA) shapefiles
#'
#' @description
#' TIGER/Line shapefiles for ZCTAs in Kansas City, Missouri, downloaded from
#' [census.gov][cen] and modified using [get_kc_sf()].
#'
#' [cen]:https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html
#'
#' The US Census Bureau uses the Global Coordinate System North American Datum
#' of 1983 (GCS NAD83/EPSG: 4269).
#'
#' @format
#' Not all variables are present in all years. Some variable names end with the
#' 2-digit census decade (e.g., "GEOID20").
#' \describe{
#'   \item{ZCTA5CE}{
#'     \itemize{
#'       \item 5-digit ZCTA code
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
#'   \item{CLASSFP}{
#'     \itemize{
#'       \item FIPS class code
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
#'       \item Data type: double
#'     }
#'   }
#'   \item{AWATER}{
#'     \itemize{
#'       \item Water area
#'       \item Data type: double
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
#'   \item{area}{
#'     \itemize{
#'       \item Feature area
#'       \item Data type: double
#'     }
#'   }
#'   \item{kc_area}{
#'     \itemize{
#'       \item Feature area within Kansas City boundary
#'       \item Data type: double
#'     }
#'   }
#'   \item{kc_area_pct}{
#'     \itemize{
#'       \item Percentage of feature area within Kansas City boundary
#'       \item Data type: double
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
#' @name sf-zcta
#' @keywords datasets
#'
#' @rdname sf-zcta
"sf_zcta_2015"
#' @rdname sf-zcta
"sf_zcta_2016"
#' @rdname sf-zcta
"sf_zcta_2017"
#' @rdname sf-zcta
"sf_zcta_2018"
#' @rdname sf-zcta
"sf_zcta_2019"
#' @rdname sf-zcta
"sf_zcta_2020"
#' @rdname sf-zcta
"sf_zcta_2021"
#' @rdname sf-zcta
"sf_zcta_2022"
#' @rdname sf-zcta
"sf_zcta_2023"
#' @rdname sf-zcta
"sf_zcta_2024"
