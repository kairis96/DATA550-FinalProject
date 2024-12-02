#relative file path
here::i_am("code/04_make_model.R")

#load data
dia_clean <- readRDS(
  file = here::here("dataset/dia_clean.RDS")
)

# Load necessary libraries
library(nnet)
library(caret)
library(gtsummary)

# Split the data into training and testing sets
set.seed(123)
trainIndex <- createDataPartition(dia_clean$isDiabetic, p = .8, 
                                  list = FALSE, 
                                  times = 1)
diaTrain <- dia_clean[ trainIndex,]
diaTest  <- dia_clean[-trainIndex,]

# Check the structure of the training data
str(diaTrain)

# Fit the multinomial logistic regression model
multinom_model <- multinom(isDiabetic ~ ., data = diaTrain)

summary(multinom_model)

#save output to output folder

saveRDS(
  multinom_model,
  file = here::here("output/multinomial.rds")
)

