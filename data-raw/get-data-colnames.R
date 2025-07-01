library(openxlsx2)

# Shapefiles --------------------------------------------------------------

sf_data <- readRDS("data-raw/data_sf_2015_2024.rds")

geo <- c("city", "county", "tract", "blockgroup", "block", "zcta")

ls <- lapply(geo, \(x) {
  p <- paste0("_", x, "_")
  nms <- lapply(sf_data[grepl(p, names(sf_data))], colnames)
  len <- max(lengths(nms))
  as.data.frame(lapply(nms, `length<-`, len))
})

wb <- wb_workbook()

for (i in 1:length(ls)) {
  wb <- wb |>
    wb_add_worksheet(sheet = geo[i]) |>
    wb_add_data(x = ls[[i]])
}

wb_save(wb, "data-raw/get-sf-colnames.xlsx")


# ACS data ----------------------------------------------------------------

acs_data <- readRDS("data-raw/data_acs_2018_2023.rds")

geo <- c("city", "county", "tract", "blockgroup", "zcta")

ls <- lapply(geo, \(x) {
  p <- paste0("_", x, "_")
  nms <- lapply(acs_data[grepl(p, names(acs_data))], colnames)
  len <- max(lengths(nms))
  as.data.frame(lapply(nms, `length<-`, len))
})


# Census data -------------------------------------------------------------

dec_data <- readRDS("data-raw/data_dec_2010.rds")

geo <- c("city", "county", "tract", "blockgroup", "block", "zcta")

ls <- lapply(geo, \(x) {
  p <- paste0("_", x, "_")
  nms <- lapply(dec_data[grepl(p, names(dec_data))], colnames)
  len <- max(lengths(nms))
  as.data.frame(lapply(nms, `length<-`, len))
})

