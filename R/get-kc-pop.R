#' Get population data for Kansas City
#'
#' @param dataset The data set to download. Passed to the `dataset` argument in
#' [tidycensus::load_variables()] and either `survey` in [tidycensus::get_acs()]
#' or `sumfile` in [tidycensus::get_decennial()].
#' @param geo The geography of the data set to download. `"place"` returns the
#' city data.
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
#' get_kc_pop(
#'   dataset = "acs5",
#'   geo = "place",
#'   year = 2023,
#'   vars = "^B01",
#'   var_match = "regex",
#'   show_call = TRUE
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

  # Get GEOIDs to filter data
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
    error = function(e) NULL
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
    # Create arg list for `get_pop1()`
    args <- list(
      survey = dataset,
      geography = geo,
      year = year,
      variables = vtbl$variable,
      state = 29,
      ...
    )
    if (geo %in% c("place", "county", "tract", "block group")) {
      df <- tryCatch(
        get_pop1(args),
        error = function(e) NULL
      )
      if (is.null(df)) return(NULL)
      df <- df[df$GEOID %in% id, ]
    } else if (geo == "zcta") {
      # Add `zcta` argument to `args`
      args <- append(args, list(zcta = id))

      # Remove `state` argument conditionally
      if (year > 2019) {
        args <- args[!grepl("state", names(args))]
      }

      df <- tryCatch(
        get_pop1(args),
        error = function(e) NULL
      )
      if (is.null(df)) return(NULL)
    }
  } else {
    df <- tryCatch(
      get_pop2(args),
      error = function(e) NULL
    )
    if (is.null(df)) return(NULL)
  }

  # Join variable details from `vtbl`
  df$row_order <- 1:nrow(df)
  df <- merge(df, vtbl, by = "variable")
  cols <- colnames(vtbl)[2:ncol(vtbl)]
  cols <- c("GEOID", "NAME", "variable", "estimate", "moe", cols)
  df <- df[order(df$row_order), cols]
  rownames(df) <- NULL

  df
}

get_pop_vars <- function(year, dataset) {
  tidycensus::load_variables(year = year, dataset = dataset, cache = TRUE)
}

get_pop1 <- function(arg_list) {
  do.call(tidycensus::get_acs, arg_list)
}

get_pop2 <- function(variables) {
  tidycensus::get_decennial()
}
