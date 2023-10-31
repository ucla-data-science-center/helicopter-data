library(tidyverse)
library(elevatr)
library(sf)
dat = read_csv('/Users/hzy/Desktop/23fall/DSC/R code refactorization/truncate_tracts_updated.csv') # this file is also located in the server 
head(dat)

colnames(dat)[which(names(dat) == "geometry")] <-"latitude"
colnames(dat)[which(names(dat) == "GEOID")] <-"longitude"

crs_dd <- 4326

sf_dat <- sf::st_as_sf(dat, coords = c("longitude", "latitude"), crs = crs_dd)

df_elev_epqs <- get_elev_point(sf_dat, prj = crs_dd, src = "aws", z=10)


read_delim_chunked(dat)
