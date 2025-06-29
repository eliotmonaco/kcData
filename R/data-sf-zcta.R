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
#' \describe{
#'   \item{ZCTA5CE10/ZCTA5CE20}{
#'     \itemize{
#'       \item 5-digit ZCTA code
#'       \item Data type: character
#'     }
#'   }
#'   \item{GEOID10/GEOID20}{
#'     \itemize{
#'       \item Geographic identifier
#'       \item Data type: character
#'     }
#'   }
#'   \item{GEOIDFQ20}{
#'     \itemize{
#'       \item Fully qualified GEOID
#'       \item Data type: character
#'       \item 2023 table only
#'     }
#'   }
#'   \item{CLASSFP10/CLASSFP20}{
#'     \itemize{
#'       \item FIPS class code
#'       \item Data type: character
#'     }
#'   }
#'   \item{MTFCC10/MTFCC20}{
#'     \itemize{
#'       \item MAF/TIGER Feature Class Code
#'       \item Data type: character
#'     }
#'   }
#'   \item{FUNCSTAT10/FUNCSTAT20}{
#'     \itemize{
#'       \item Legal functional status
#'       \item Data type: character
#'     }
#'   }
#'   \item{ALAND10/ALAND20}{
#'     \itemize{
#'       \item Land area
#'       \item Data type: double
#'     }
#'   }
#'   \item{AWATER10/AWATER20}{
#'     \itemize{
#'       \item Water area
#'       \item Data type: double
#'     }
#'   }
#'   \item{INTPTLAT10/INTPTLAT20}{
#'     \itemize{
#'       \item Latitude of the internal point
#'       \item Data type: character
#'     }
#'   }
#'   \item{INTPTLON10/INTPTLON20}{
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
#' }
#'
#' @source US Census Bureau TIGER/Line Shapefiles
#'
#' @name sf-zcta
#' @keywords datasets
#'
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
