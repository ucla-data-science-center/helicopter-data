library(tidyverse)
library(elevatr)
library(sf)
library(readr)
library(dplyr)
dat = read_csv('~/Personal/DataSquad/helicopter-data/test.csv') # this file is also located in the server

crs_dd <- 4326

sf_dat <- sf::st_as_sf(dat, coords = c("longitude", "latitude"), crs = crs_dd)

data <- data.frame()

data_env <- new.env()

f <- function(x, pos) {
  #print(x)
  df_elev_aws <- get_elev_point(sf_dat, prj = crs_dd, src = "aws", z=10)

  #print(df_elev_aws)

  data_env$data <- rbind(data, df_elev_aws)
}

read_csv_chunked('~/Personal/DataSquad/helicopter-data/test.csv', DataFrameCallback$new(f), chunk_size = 500)

data <- data_env$data


#read_delim_chunked('~/Personal/DataSquad/helicopter-data/test.csv', delim = ',', skip = 0, DataFrameCallback$new(f),)
