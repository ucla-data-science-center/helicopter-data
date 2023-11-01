library(tidyverse)
library(elevatr)
library(sf)
dat = read_csv('./truncate_tracts.csv') # this file is also located in the server
head(dat)

colnames(dat)[which(names(dat) == "geometry")] <-"latitude"
colnames(dat)[which(names(dat) == "GEOID")] <-"longitude"

dat$longitude<-gsub(")","",as.character(dat$longitude))
dat$latitude<-gsub('c\\(',"",as.character(dat$latitude))


crs_dd <- 4326

sf_dat <- sf::st_as_sf(dat, coords = c("longitude", "latitude"), crs = crs_dd)

df_elev_epqs <- get_elev_point(sf_dat, prj = crs_dd, src = "aws", z=10)
summary(df_elev_epqs)


# The input into this function needs to be a file, we are inputting a variable so I don't think it'll work
read_delim_chunked(df_elev_epqs)
