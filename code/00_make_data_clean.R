#load dataset and necessary packages 
library(dplyr)
library(tidyverse)
library(here)
library(ggplot2)
library(nnet)
library(caret)
library(renv)

#download data from project directory
here::i_am("code/00_make_data_clean.R")
absolute_path_to_data <- here::here("dataset", "diabetes_012_health_indicators_BRFSS2015.csv")
dia <- read.csv(absolute_path_to_data, header = TRUE)


#summary statistics 
str(dia)
summary(dia)

#clean and convert into factor variables 
dia_clean = dia
dia_clean$Diabetes_012 = as.factor(ifelse(dia_clean$Diabetes_012 == 0,0,1))
dia_clean = dia_clean |>
  rename(isDiabetic = Diabetes_012)
dia_clean = dia_clean %>% mutate(across(!c("BMI","MentHlth","PhysHlth"), as.factor))

#check for missing values or duplicates 
sum(is.na(dia))
sum(duplicated(dia_clean))

#remove duplicates 
dia_clean = dia_clean |>
  distinct()

#save data into RDS file
saveRDS(dia_clean, file = here::here("dataset/dia_clean.RDS"))

