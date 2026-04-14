# Get population estimates

Create a table of population estimates using the intercensal population
estimates (`popest_ic`) and the most recent population estimate vintages
(`popest_v<YY>`).

## Usage

``` r
return_popest_table(years)
```

## Arguments

- years:

  A numeric vector of years.

## Value

A dataframe.

## Examples

``` r
return_popest_table(2015:2024)
#>    year estimate
#> 1  2015   481099
#> 2  2016   488838
#> 3  2017   496715
#> 4  2018   501763
#> 5  2019   506398
#> 6  2020   508096
#> 7  2021   508995
#> 8  2022   508913
#> 9  2023   511300
#> 10 2024   516032
```
