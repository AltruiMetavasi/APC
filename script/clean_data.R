# prepare environment
#--------------------

options(scipen = 9999)

# clear environment
rm(list = ls())


# load libs
library(tidyverse)
library(magrittr)


# prepare datasets
#--------------------

data <- read_csv("data/Academy_Student_Database - Sheet1.csv")

glimpse(data)


data %>% pull(Age) %>% table()
