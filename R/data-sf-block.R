#' Census block shapefiles
#'
#' @description
#' TIGER/Line shapefiles for census blocks in Kansas City, Missouri, downloaded
#' from [census.gov][cen] and modified using [get_kc_sf()].
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
#'   \item{STATEFP}{
#'     \itemize{
#'       \item State FIPS code
#'       \item Data type: character
#'     }
#'   }
#'   \item{COUNTYFP}{
#'     \itemize{
#'       \item County FIPS code
#'       \item Data type: character
#'     }
#'   }
#'   \item{TRACTCE}{
#'     \itemize{
#'       \item Census tract code
#'       \item Data type: character
#'     }
#'   }
#'   \item{BLOCKCE}{
#'     \itemize{
#'       \item Census tabulation block number
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
#'   \item{MTFCC}{
#'     \itemize{
#'       \item MAF/TIGER feature class code
#'       \item Data type: character
#'     }
#'   }
#'   \item{UR}{
#'     \itemize{
#'       \item Urban/rural indicator
#'       \item Data type: character
#'     }
#'   }
#'   \item{UACE}{
#'     \itemize{
#'       \item Urban area code
#'       \item Data type: character
#'     }
#'   }
#'   \item{UATYPE}{
#'     \itemize{
#'       \item Urban area type
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
#'   \item{HOUSING}{
#'     \itemize{
#'       \item Housing unit count
#'       \item Data type: character
#'     }
#'   }
#'   \item{POP}{
#'     \itemize{
#'       \item Population count
#'       \item Data type: character
#'     }
#'   }
#'   \item{COUNTYFP}{
#'     \itemize{
#'       \item County FIPS code
#'       \item Data type: character
#'     }
#'   }
#'   \item{STATEFP}{
#'     \itemize{
#'       \item State FIPS code
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
#' @name sf-block
#' @keywords datasets
#'
#' @rdname sf-block
"sf_block_2015"
#' @rdname sf-block
"sf_block_2016"
#' @rdname sf-block
"sf_block_2017"
#' @rdname sf-block
"sf_block_2018"
#' @rdname sf-block
"sf_block_2019"
#' @rdname sf-block
"sf_block_2020"
#' @rdname sf-block
"sf_block_2021"
#' @rdname sf-block
"sf_block_2022"
#' @rdname sf-block
"sf_block_2023"
#' @rdname sf-block
"sf_block_2024"
