# Diabetes Health Indicator

## Project Overview
-This project aims to analyze and predict the risk of diabetes among individuals
based on various health indicators. 

## Data
* The dataset features the collections of health data such as BMI, blood pressure, glucose levels, etc.
* Analysis of the risk of diabetes based on the collected data
* Generates a report that indicates the likelihood of diabetes and recommendations for prevention

## Repository Directory
This repository includes the following folders and files:
- `data/`: Contains the original dataset (`diabetes_012_health_indicators_BRFSS2015.csv`) and clean RDS file.
- `output/`: Stores the generated analysis files, such as `.rds` files for tables and `.png` files for figures.
- `code/`: Contains R scripts for generating figures and model.
- `Report.Rmd`: The R Markdown file for generating the project report.
- `Makefile`: Automates the process of generating the final report.
- `README.md`: Documentation for the final project.

## Run the Project
1. Clone the repository:
  In the bash:
     git clone https://github.com/kairis96/DATA550-FinalProject
     
2. Generate the Final Report:
  In the bash:
     make Report.html
