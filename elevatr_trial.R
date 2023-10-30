library(tidyverse)
library(elevatr)
library(sf)
dat = read_csv('/Users/jacobopereira-pacheco/Desktop/positions_tracts.csv') # this file is also located in the server 

crs_dd <- 4326

sf_dat <- sf::st_as_sf(dat, coords = c("longitude", "latitude"), crs = crs_dd)

df_elev_epqs <- get_elev_point(sf_dat, prj = crs_dd, src = "epqs")
