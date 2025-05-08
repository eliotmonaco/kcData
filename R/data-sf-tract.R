#' Census tract shapefiles
#'
#' @description
#' TIGER/Line shapefiles for census tracts in Kansas City, Missouri, downloaded
#' from [census.gov][cen] and modified using [get_kc_sf()].
#'
#' [cen]:https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html
#'
#' The US Census Bureau uses the Global Coordinate System North American Datum
#' of 1983 (GCS NAD83/EPSG: 4269).
#'
#' @format
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
#'       \item 2023 table only
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
#'   \item{MTFCC}{
#'     \itemize{
#'       \item MAF/TIGER Feature Class Code
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
#' @source US Census Bureau TIGER/Line Shapefiles (2018-2024)
#'
#' @name sf-tract
#' @keywords datasets
#'
#' @rdname sf-tract
"sf_tract_2018"
#' @rdname sf-tract
"sf_tract_2019"
#' @rdname sf-tract
"sf_tract_2020"
#' @rdname sf-tract
"sf_tract_2021"
#' @rdname sf-tract
"sf_tract_2022"
#' @rdname sf-tract
"sf_tract_2023"
#' @rdname sf-tract
"sf_tract_2024"
