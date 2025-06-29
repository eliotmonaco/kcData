library(openxlsx2)

sf_data <- readRDS("data-raw/sf_2018_2024.rds")

geo <- c("city", "county", "tract", "block group", "block", "zcta")

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

wb_save(wb, "data-raw/sf_colnames.xlsx")
