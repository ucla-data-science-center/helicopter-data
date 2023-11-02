library(tidyverse)
library(elevatr)
library(sf)
library(readr)
library(dplyr)
library(here)
# ORIGINAL CODE
# dat = read_csv('~/Personal/DataSquad/R-Code-Refactorization/test.csv') # this file is also located in the server
# crs_dd <- 4326
# sf_dat <- sf::st_as_sf(dat, coords = c("longitude", "latitude"), crs = crs_dd)
# df_elev_epqs <- get_elev_point(sf_dat, prj = crs_dd, src = "aws", z=10)


# ALTERED CODE
<<<<<<< HEAD:batch/lawrence_batch_test.R
filePath = "~/Personal/DataSquad/helicopter-data/truncate_tracts_50k.csv"
=======
args <- commandArgs(trailingOnly = TRUE)

dataset <- "5k"
chunk <- 1000

if(length(args) == 0){
    dataset <- "5k"
} else {
   dataset <- args[1]
   if (dataset == '10k') chunk <- 5000
   else if (dataset == '50k') chunk <- 10000
   else if (dataset == '150k') chunk <- 50000
}
filePath <- here(paste("data/truncate_tracts_", dataset, ".csv", sep = ""))
>>>>>>> main:batch/elevatr_trial_batch.R
crs_dd <- 4326
data <- data.frame()
data_env <- new.env()

# Callback Function, its gonna process the chunked data
f <- function(x, pos) {
  test_dat <- sf::st_as_sf(x, coords = c("longitude", "latitude"), crs = crs_dd)

  df_elev_aws <- get_elev_point(test_dat, prj = crs_dd, src = "aws", z=10)
  data_env$data <- rbind(data_env$data, df_elev_aws)

  #df_elev_epqs <- get_elev_point(x, prj = crs_dd, src = "epqs")
  #data_env$data <- rbind(data, df_elev_epqs)
}

<<<<<<< HEAD:batch/lawrence_batch_test.R
read_csv_chunked(filePath, DataFrameCallback$new(f), chunk_size = 10000)
=======
read_csv_chunked(filePath, DataFrameCallback$new(f), chunk_size = chunk)
>>>>>>> main:batch/elevatr_trial_batch.R
# read_delim_chunked('~/Personal/DataSquad/helicopter-data/test.csv', delim = ',', skip = 0, DataFrameCallback$new(f),)

data <- data_env$data
