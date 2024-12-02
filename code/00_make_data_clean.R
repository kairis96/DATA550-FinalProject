#load dataset and necessary packages 
install.packages("dplyr")
library("dplyr")

#download data from git repository 
dia_url <- getURL("")
dia = read.csv(dia_url)

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
saveRDS(dia_clean, here::here("dataset", "dia_clean.RDS"))

