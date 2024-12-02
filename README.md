# Diabetes Health Indicator

## Project Overview
-This project aims to analyze and predict the risk of diabetes among individuals
based on various health indicators. 

## Data
* The dataset features the collections of health data such as BMI, blood pressure, glucose levels, etc.
* Analysis of the risk of diabetes based on the collected data
* Generates a report that indicates the likelihood of diabetes and recommendations for prevention

## Repository Structure
This repository includes the following folders and files:
- `data/`: Contains the dataset (`diabetes_012_health_indicators_BRFSS2015.csv`).
- `output/`: Stores the generated analysis files, such as `.rds` files for tables and `.png` files for figures.
- `scripts/`: Contains R scripts for generating tables and figures.
- `final_project.Rmd`: The main R Markdown file for generating the project report.
- `Makefile`: Automates the process of generating the final report and associated outputs.
- `README.md`: Documentation for the project, including instructions for running the analysis.

## How to Run the Project
1. Clone the repository:
  In the bash:
     git clone https://github.com/kairis96/
     
2. Navigate to the project directory:
  In the bash:
     cd final_report
3. Generate the Final Report:
  In the bash:
     make final_report.html
