# Get simple features objects for Kansas City

Download a TIGER/Line shapefile containing

- the Kansas City city boundary

- the Kansas City metro region boundary

- a set of smaller geographies intersecting with one of the above:
  county, census tract, census block group, census block, or ZIP code
  tabulation area (ZCTA)

Shapefiles are downloaded from the US Census Bureau using the
[tigris](https://github.com/walkerke/tigris) package.

## Usage

``` r
get_kc_sf(
  geo = c("cbsa", "place", "county", "tract", "blockgroup", "block", "zcta"),
  year,
  intersect = c("city", "metro"),
  geometry = c("clipped", "full")
)
```

## Arguments

- geo:

  The shapefile geography. `"place"` returns the city boundary and
  `"cbsa"` returns the metro region boundary.

- year:

  The shapefile year.

- intersect:

  If `geo` is not `"place"` or `"cbsa"`, this is the larger geography
  that determines the intersection for the geography selected in `geo`.
  If `"metro"` is selected, geographies in both Kansas and Missouri will
  be returned.

- geometry:

  If `geo` is not `"place"` or `"cbsa"`, return either the full
  geometries or geometries clipped to the geography indicated in
  `intersect`.

## Value

A dataframe of class `sf` containing a simple feature list column.

## Details

Geographies smaller than the city or metro region can contain the full
geometry or geometries clipped to the city or metro region boundary. For
these geographies, when `geometry = "clipped"` two additional variables
are added for the feature's full area and the area within the city or
metro region boundary.

## Additional resources

- [TIGER/Line Shapefiles and TIGER/Line Files Technical
  Documentation](https://www.census.gov/programs-surveys/geography/technical-documentation/complete-technical-documentation/tiger-geo-line.html)

- [Standard Hierarchy of Census Geographic
  Entities](https://www2.census.gov/geo/pdfs/reference/geodiagram.pdf)

- [tigris package](https://github.com/walkerke/tigris)

## Examples

``` r
if (FALSE) { # \dontrun{
# Get the 2024 city boundary
city <- get_kc_sf(geo = "place", year = 2024)

# Get 2024 census tracts clipped to the city boundary
tracts <- get_kc_sf(geo = "tract", year = 2024)

# Get full 2024 ZCTAs that intersect with the KC metro region
zctas <- get_kc_sf(
  geo = "zcta",
  year = 2024,
  intersect = "metro",
  geometry = "full"
)
} # }
```
