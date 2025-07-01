test_get_kc_sf <- function(
    geo = c("place", "county", "tract", "block group", "block", "zcta"),
    test_input) {
  requireNamespace("tigris", quietly = TRUE)
  requireNamespace("sf", quietly = TRUE)

  geo <- match.arg(geo)

  # Download the Missouri shapefile
  sf1 <- tryCatch(
    test_get_raw_sf1(test_input),
    error = function(e) {
      cat("tigris error:", conditionMessage(e), "\n")
      NULL
    }
  )

  if (is.null(sf1)) return(sf1)

  # Filter for the city boundary
  sf1 <- sf1[which(sf1$NAME == "Kansas City"), ]

  # Return the city boundary or download the shapefile for the specified
  # geography
  if (geo == "place") {
    sf1
  } else {
    sf2 <- tryCatch(
      test_get_raw_sf2(geo, test_input),
      error = function(e) {
        cat("tigris error:", conditionMessage(e), "\n")
        NULL
      }
    )

    if (is.null(sf2)) return(sf2)

    cols <- colnames(sf2)

    # Get the area of each geometry
    sf2$area <- sf::st_area(sf2)

    # Restrict each geometry to the area within the city
    sf2 <- sf::st_intersection(sf1[, "geometry"], sf2)

    # Keep only polygons
    sf2 <- sf::st_collection_extract(sf2, "POLYGON")

    sf2 <- sf::st_make_valid(sf2)

    sf2 <- sf2[!sf::st_is_empty(sf2), ]

    # Get the area of the intersecting portion
    sf2$kc_area <- sf::st_area(sf2)

    # Calculate the percentage of the area within the city
    sf2$kc_area_pct <- as.numeric(sf2$kc_area * 100 / sf2$area)

    cols <- c(
      cols[!cols %in% "geometry"],
      "area", "kc_area", "kc_area_pct", "geometry"
    )

    sf2[, cols]
  }
}

test_get_raw_sf1 <- function(input) {
  input$place
}

test_get_raw_sf2 <- function(geo, input) {
  if (geo == "county") {
    input$county
  } else if (geo == "tract") {
    input$tract
  } else if (geo == "block group") {
    input$blockgroup
  } else if (geo == "block") {
    input$block
  } else if (geo == "zcta") {
    input$zcta
  }
}
