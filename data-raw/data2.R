# This script downloads the following files from the US Census TIGERweb ...

# library(httr2)
library(rvest)
library(tidyverse)



# TIGERweb Decennial State-Based Data Files
# https://tigerweb.geo.census.gov/tigerwebmain/TIGERweb2020_state_based_files.html

url <- list(
  glossary = "https://tigerweb.geo.census.gov/tigerwebmain/TIGERweb_attribute_glossary.html",
  co2010 = "https://tigerweb.geo.census.gov/tigerwebmain/Files/tab20/tigerweb_tab20_county_2010_mo.html",
  co2020 = "https://tigerweb.geo.census.gov/tigerwebmain/Files/tab20/tigerweb_tab20_county_2020_mo.html",
  tr2010 = "https://tigerweb.geo.census.gov/tigerwebmain/Files/tab20/tigerweb_tab20_tract_2010_mo.html",
  tr2020 = "https://tigerweb.geo.census.gov/tigerwebmain/Files/tab20/tigerweb_tab20_tract_2020_mo.html"
)

data <- lapply(
  url,
  function(x) x |>
    read_html() |>
    html_element(css = "table") |>
    html_table(convert = FALSE) # read data as character
)

# Check if all var names are present in glossary
check <- lapply(
  data[2:length(data)],
  function(x) which(!colnames(x) %in% data$glossary$`Map Service Field Name`)
)

# Function to rename vars
rename_vars <- function(x) {
  x |>
    gsub(pattern = "\\s+", replacement = "_") |>
    tolower()
}

# Rename variables
data <- lapply(
  data,
  function(x) {
    colnames(x) <- rename_vars(colnames(x))
    x
  }
)

# Rename variables in glossary
data$glossary <- data$glossary |>
  mutate(map_service_field_name = rename_vars(map_service_field_name))

# Replace empty strings with NA
data <- lapply(
  data,
  function(x) {
    x[x == ""] <- NA
    x
  }
)









# mo_counties <- data[2:3]
# mo_tracts <- data[4:5]

# saveRDS(mo_counties, "mo_counties.rds")
# saveRDS(mo_tracts, "mo_tracts.rds")

# Code or table to determine which tracts are within KC city limits
# Census block groups or blocks?







