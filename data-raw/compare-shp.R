# Compare spatial data sets

shp <- readRDS("data-raw/shp_2014_2023.rds")

shp_v_shp <- function(data, geo) {
  data2 <- data[grepl(geo, names(data))]
  comp <- list(
    vars = list(),
    data = list(),
    allvars = list()
  )
  vars_city <- list()
  for (i in 1:length(data2)) {
    comp$allvars[[i]] <- colnames(data2[[i]])
    if (i < length(data2)) {
      nm <- paste(names(data2)[i], "vs", names(data2)[i + 1], sep = "_")
      v1 <- colnames(data2[[i]])
      v2 <- colnames(data2[[i + 1]])
      comp$vars[[nm]] <- list(
        v1_unq = v1[!v1 %in% v2],
        v2_unq = v2[!v2 %in% v1]
      )
      comp$data[[nm]] <- all.equal(
        data2[[i]],
        data2[[i + 1]]
      )
    }
  }
  comp
}

# Compare city shapefiles
comp_city <- shp_v_shp(shp, "city")

# Compare tract shapefiles
comp_tract <- shp_v_shp(shp, "tract")

# Compare ZCTA shapefiles
comp_zcta <- shp_v_shp(shp, "zcta")

# Print results
comp <- comp_city$vars
comp <- comp_tract$vars
comp <- comp_zcta$vars
for (i in 1:length(comp)) {
  print(names(comp)[i])
  print(comp[[i]])
  cat("\n")
}
