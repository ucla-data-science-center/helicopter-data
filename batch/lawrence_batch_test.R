library(tidyverse)
library(elevatr)
library(sf)
library(readr)
library(dplyr)
dat = read_csv('~/Personal/DataSquad/R-Code-Refactorization/test.csv') # this file is also located in the server

crs_dd <- 4326

sf_dat <- sf::st_as_sf(dat, coords = c("longitude", "latitude"), crs = crs_dd)

data <- data.frame()

f <- function(x, pos) {
  #print(x)
  df_elev_epqs <- get_elev_point(sf_dat, prj = crs_dd, src = "epqs")

  rbind(data, df_elev_epqs)
}

#read_csv_chunked('~/Personal/DataSquad/R-Code-Refactorization/test.csv', DataFrameCallback$new(f), chunk_size = 5)

read_delim_chunked('~/Personal/DataSquad/R-Code-Refactorization/test.csv', delim = ',', skip = 0, DataFrameCallback$new(f),)
