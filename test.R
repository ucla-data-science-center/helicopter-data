library(tidyverse)
library(elevatr)
library(sf)
library(readr)
library(dplyr)
dat = read_csv('~/Personal/DataSquad/helicopter-data/truncate_tracts_50k.csv') # this file is also located in the server

crs_dd <- 4326

sf_dat <- sf::st_as_sf(dat, coords = c("longitude", "latitude"), crs = crs_dd)

# The switch to AWS is to efficiently process it, EPQS is very accurate but doesn't work very well on >500 data points. z=10 is the sweet spot on how
# accurate you want the AWS server to be
df_elev_aws <- get_elev_point(sf_dat, prj = crs_dd, src = "aws", z=10)

