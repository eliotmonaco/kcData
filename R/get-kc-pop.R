#' Get population data for Kansas City
#'
#' @description
#' Download population data for Kansas City from the decennial census or the
#' American Community Survey (ACS). Summary levels are place, county, census
#' tract, census block group, census block (decennial census only), and ZIP code
#' tabulation area (ZCTA). Data sets are downloaded from the US Census Bureau
#' using the [tidycensus][tc] package.
#'
#' [tc]:https://walker-data.com/tidycensus/index.html
#'
#' @details
#' Data sets for geographies other than "place" are filtered for geographic
#' units that intersect with the city boundary. These geographic units are
#' determined by the shapefile downloaded for the specified year. If no
#' shapefile has been downloaded for that year, an error is returned.
#'
#' # Additional resources
#'
#' - [Decennial census website][dc]
#' - [American Community Survey website][acs]
#' - [List of US Census Bureau data sets available via API][api]
#' - [Census Reporter][cr] (ACS tables and variables reference)
#'
#' [dc]:https://www.census.gov/programs-surveys/decennial-census.html
#' [acs]:https://www.census.gov/programs-surveys/acs.html
#' [api]:https://api.census.gov/data.html
#' [cr]:https://censusreporter.org/
#'
#' @param dataset The data set to download. Passed to the `dataset` argument in
#' [tidycensus::load_variables()] and either `survey` in [tidycensus::get_acs()]
#' or `sumfile` in [tidycensus::get_decennial()].
#' @param geo The geography (summary level) of the data set to download.
#' `"place"` is the summary level for Kansas City.
#' @param year The year of the data set to download.
#' @param vars A vector of variable names or a regular expression to match
#' variable names for download.
#' @param var_match The type of matching to perform on variable names. `"fixed"`
#' matches the values in `vars` exactly, and `"regex"` matches to a regular
#' expression pattern in `vars`.
#' @param ... Additional arguments passed to [tidycensus::get_acs()] or
#' [tidycensus::get_decennial()].
#'
#' @returns A dataframe.
#' @export
#'
#' @examples
#' \dontrun{
#' acs5_2023 <- get_kc_pop(
#'   dataset = "acs5",
#'   geo = "place",
#'   year = 2023,
#'   vars = "^B01",
#'   var_match = "regex"
#' )
#'
#' dec_2020 <- get_kc_pop(
#'   dataset = "dhc",
#'   geo = "block",
#'   year = 2020,
#'   vars = "^P1[23]",
#'   var_match = "regex"
#' )
#' }
#'
get_kc_pop <- function(
    dataset,
    geo = c("place", "county", "tract", "block group", "block", "zcta"),
    year,
    vars,
    var_match = c("fixed", "regex"),
    ...) {
  requireNamespace("tidycensus")

  geo <- match.arg(geo)
  var_match <- match.arg(var_match)

  # Get GEOIDs from the shapefile for the specified year to filter data
  if (geo == "place") {
    id <- "2938000"
  } else {
    geo_nm <- paste0("^", sub("\\s", "", geo), "$")
    id <- geoids[[which(grepl(geo_nm, names(geoids)))]]
    i <- which(grepl(year, names(id)))

    if (length(i) == 0) {
      stop(paste(geo, "shapefiles for", year, "have not been downloaded"))
    }

    id <- id[[i]]
  }

  # Get variable table
  vtbl <- tryCatch(
    get_pop_vars(year, dataset),
    error = function(e) {
      cat("tidycensus error:", conditionMessage(e), "\n")
      NULL
    }
  )
  if (is.null(vtbl)) return(NULL)

  # Filter table using `vars`
  if (var_match == "fixed") {
    vtbl <- vtbl[which(vtbl$name %in% vars), ]
  } else if (var_match == "regex") {
    vtbl <- vtbl[grepl(vars, vtbl$name), ]
  }

  # Rename column in `vtbl`
  names(vtbl) <- sub("name", "variable", names(vtbl))

  if (grepl("acs", dataset)) {
    # Create arg list for `get_pop_acs()`
    args <- list(
      survey = dataset,
      geography = geo,
      year = year,
      variables = vtbl$variable,
      state = 29,
      ...
    )

    if (geo == "zcta") {
      # Add `zcta` argument to `args`
      args <- append(args, list(zcta = id))

      # Remove `state` argument conditionally
      if (year > 2019) {
        args <- args[!grepl("state", names(args))]
      }
    }

    # Get ACS data
    df <- tryCatch(
      get_pop_acs(args),
      error = function(e) {
        cat("tidycensus error:", conditionMessage(e), "\n")
        NULL
      }
    )
    if (is.null(df)) return(NULL)

    if (geo != "zcta") {
      # Filter data by GEOID
      df <- df[df$GEOID %in% id, ]
    }
  } else {
    # Create arg list for `get_pop_dec()`
    args <- list(
      sumfile = dataset,
      geography = geo,
      year = year,
      variables = vtbl$variable,
      state = 29,
      ...
    )

    if (geo == "block") {
      # Add `county` argument to `args`
      args <- append(args, list(county = c(037, 047, 095, 165)))
    }

    # Get decennial census data
    df <- tryCatch(
      get_pop_dec(args),
      error = function(e) {
        cat("tidycensus error:", conditionMessage(e), "\n")
        NULL
      }
    )

    if (is.null(df)) return(NULL)

    # Filter data by GEOID
    df <- df[df$GEOID %in% id, ]
  }

  # Join variable details from `vtbl`
  df$row_order <- 1:nrow(df)
  df <- merge(df, vtbl, by = "variable")
  cols <- colnames(vtbl)[2:ncol(vtbl)]
  if (grepl("acs", dataset)) {
    cols <- c("GEOID", "NAME", "variable", "estimate", "moe", cols)
  } else {
    cols <- c("GEOID", "NAME", "variable", "value", cols)
  }
  df <- df[order(df$row_order), cols]
  rownames(df) <- NULL

  df
}

get_pop_vars <- function(year, dataset) {
  tidycensus::load_variables(year = year, dataset = dataset, cache = TRUE)
}

get_pop_acs <- function(arg_list) {
  do.call(tidycensus::get_acs, arg_list)
}

get_pop_dec <- function(arg_list) {
  do.call(tidycensus::get_decennial, arg_list)
}
