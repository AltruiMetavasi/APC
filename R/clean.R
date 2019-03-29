rm(list = ls())

library(tidyverse)

rawdata <- read_csv("data/master.csv")

fulldata <- rawdata %>%
  mutate(
    age = str_replace_all(age, " years", "") %>%
      str_replace_all("\\+", "\\-75") # seperate "years" and "+" from age
  )  %>% 
  separate(age, into = c("age_lower", "age_upper"), sep = "-") %>% # divide age range
  mutate_at(vars(matches("age")), funs(as.numeric(.))) %>% # change to numeric
  mutate(
    age = round((age_lower + age_upper) / 2),
    period = year,
    cohort = period - age
  ) %>% # create APC
  mutate_at(vars(age, period, cohort), funs(as.factor(.))) %>% # turn it to factor
  select(suicides = suicides_no, age, period, cohort, sex, country) 


write_csv(fulldata, "data/suicides.csv")
