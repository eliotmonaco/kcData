% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data-sf-county.R
\docType{data}
\name{sf-county}
\alias{sf-county}
\alias{sf_county_2015}
\alias{sf_county_2016}
\alias{sf_county_2017}
\alias{sf_county_2018}
\alias{sf_county_2019}
\alias{sf_county_2020}
\alias{sf_county_2021}
\alias{sf_county_2022}
\alias{sf_county_2023}
\alias{sf_county_2024}
\title{County shapefiles}
\format{
Not all variables are present in all years.
\describe{
\item{STATEFP}{
\itemize{
\item State FIPS code
\item Data type: character
}
}
\item{COUNTYFP}{
\itemize{
\item County FIPS code
\item Data type: character
}
}
\item{COUNTYNS}{
\itemize{
\item County NS code
\item Data type: character
}
}
\item{GEOID}{
\itemize{
\item Geographic identifier
\item Data type: character
}
}
\item{GEOIDFQ}{
\itemize{
\item Fully qualified GEOID
\item Data type: character
}
}
\item{NAME}{
\itemize{
\item Geographic area name
\item Data type: character
}
}
\item{NAMELSAD}{
\itemize{
\item Geographic area name and legal/statistical area description
\item Data type: character
}
}
\item{LSAD}{
\itemize{
\item Legal/statistical area description
\item Data type: character
}
}
\item{CLASSFP}{
\itemize{
\item FIPS class code
\item Data type: character
}
}
\item{MTFCC}{
\itemize{
\item MAF/TIGER feature class code
\item Data type: character
}
}
\item{CSAFP}{
\itemize{
\item Combined statistical area code
\item Data type: character
}
}
\item{CBSAFP}{
\itemize{
\item Metropolitan statistical area/micropolitan statistical area code
\item Data type: character
}
}
\item{METDIVFP}{
\itemize{
\item Metropolitan division code
\item Data type: character
}
}
\item{FUNCSTAT}{
\itemize{
\item Legal functional status
\item Data type: character
}
}
\item{ALAND}{
\itemize{
\item Land area
\item Data type: numeric
}
}
\item{AWATER}{
\itemize{
\item Water area
\item Data type: numeric
}
}
\item{INTPTLAT}{
\itemize{
\item Latitude of the internal point
\item Data type: character
}
}
\item{INTPTLON}{
\itemize{
\item Longitude of the internal point
\item Data type: character
}
}
\item{area}{
\itemize{
\item Feature area
\item Data type: double
}
}
\item{kc_area}{
\itemize{
\item Feature area within Kansas City boundary
\item Data type: double
}
}
\item{kc_area_pct}{
\itemize{
\item Percentage of feature area within Kansas City boundary
\item Data type: double
}
}
\item{geometry}{
\itemize{
\item Feature geometry
\item Data type: list
}
}
}

An object of class \code{sf} (inherits from \code{data.frame}) with 4 rows and 21 columns.

An object of class \code{sf} (inherits from \code{data.frame}) with 4 rows and 21 columns.

An object of class \code{sf} (inherits from \code{data.frame}) with 4 rows and 21 columns.

An object of class \code{sf} (inherits from \code{data.frame}) with 4 rows and 21 columns.

An object of class \code{sf} (inherits from \code{data.frame}) with 4 rows and 21 columns.

An object of class \code{sf} (inherits from \code{data.frame}) with 4 rows and 21 columns.

An object of class \code{sf} (inherits from \code{data.frame}) with 4 rows and 21 columns.

An object of class \code{sf} (inherits from \code{data.frame}) with 4 rows and 22 columns.

An object of class \code{sf} (inherits from \code{data.frame}) with 4 rows and 22 columns.
}
\source{
US Census Bureau TIGER/Line Shapefiles
}
\usage{
sf_county_2015

sf_county_2016

sf_county_2017

sf_county_2018

sf_county_2019

sf_county_2020

sf_county_2021

sf_county_2022

sf_county_2023

sf_county_2024
}
\description{
TIGER/Line shapefiles for counties in Kansas City, Missouri, downloaded from
\href{https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html}{census.gov} and modified using \code{\link[=get_kc_sf]{get_kc_sf()}}.

The US Census Bureau uses the Global Coordinate System North American Datum
of 1983 (GCS NAD83/EPSG: 4269).
}
\keyword{datasets}
