#' Census tract shapefiles
#'
#' @description
#' TIGER/Line shapefiles for census tracts in Kansas City, Missouri, downloaded
#' from [census.gov][cen] using the [tigris][tig] package.
#'
#' [cen]:https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html
#' [tig]:https://github.com/walkerke/tigris
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
#'       \item TBD
#'       \item Data type: character
#'     }
#'   }
#' }
#'
#' @source US Census Bureau TIGER/Line Shapefiles (2014-2023)
#'
#' @name shp-tract
#' @keywords datasets
#'
#' @rdname shp-tract
"shp_tract_2014"
#' @rdname shp-tract
"shp_tract_2015"
#' @rdname shp-tract
"shp_tract_2016"
#' @rdname shp-tract
"shp_tract_2017"
#' @rdname shp-tract
"shp_tract_2018"
#' @rdname shp-tract
"shp_tract_2019"
#' @rdname shp-tract
"shp_tract_2020"
#' @rdname shp-tract
"shp_tract_2021"
#' @rdname shp-tract
"shp_tract_2022"
#' @rdname shp-tract
"shp_tract_2023"
