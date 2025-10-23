#' Get population estimates
#'
#' @description
#' Create a table of population estimates using the intercensal population
#' estimates (`popest_ic`) and the most recent population estimate vintages
#' (`popest_v<YY>`).
#'
#'
#' @param years A numeric vector of years.
#'
#' @returns A dataframe.
#' @export
#'
#' @examples
#' return_popest_table(2015:2024)
#'
return_popest_table <- function(years) {
  yrs_avail <- c(
    colnames(popest_ic20)[grepl("^est_\\d{4}$", colnames(popest_ic20))],
    colnames(popest_v24)[grepl("^est_\\d{4}$", colnames(popest_v24))]
  )

  yrs_avail <- as.numeric(sub("est_", "", yrs_avail))

  if (!all(years %in% yrs_avail)) {
    stop(paste(
      "some years in `years` are unavailable",
      "in `popest_ic20` and `popest_v24`"
    ))
  }

  ic <- transpose_popest(popest_ic20)

  vnt <- transpose_popest(popest_v24)

  df <- rbind(ic, vnt)

  df <- df[df$year %in% years, ]

  rownames(df) <- NULL

  df
}

transpose_popest <- function(df) {
  df <- t(df[, grepl("^est_\\d{4}$", colnames(df))]) |>
    as.data.frame()

  df$year <- as.numeric(sub("est_", "", rownames(df)))

  rownames(df) <- NULL

  colnames(df) <- c("estimate", "year")

  df[, c("year", "estimate")]
}
