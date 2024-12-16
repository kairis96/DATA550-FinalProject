# Diabetes Health Indicator

## Project Overview

This project aims to analyze and predict the risk of diabetes among individuals based on various health indicators. 
The project uses a dataset featuring health metrics such as BMI, blood pressure, glucose levels, and more. 

### Outputs include:
- Exploratory data analysis through visualizations.
- Predictive modeling to assess diabetes risk.
- A comprehensive report with insights and recommendations for prevention.

## Data
The dataset used in this project includes the following:

- Original Source: data/diabetes_012_health_indicators_BRFSS2015.csv
- Cleaned Dataset: Saved as an RDS file (data/dia_clean.rds) after preprocessing.

## Repository Structure

The repository is organized as follows:

*`dataset`/: Contains the original dataset and the cleaned dataset used for analysis.

*`output`/: Stores generated analysis outputs:
- Figures: .png files (e.g., bar graphs, scatterplots).
- Model objects: .rds files.

*`code`/: Includes R scripts for:
- Data cleaning (00_make_data_clean.R)
- Generating analysis outputs (01_make_output1.R, 02_make_output2.R, 03_make_output3.R)
- Building the multinomial model (04_make_model.R)
- Rendering the final report (05_render_report.R).

*`Report.Rmd`: The R Markdown file used to generate the project report.

*`Makefile`: Automates the process of generating the outputs and the final report.

*`README.md`: Documentation for the project, including setup instructions.

## Synchronizing the Package Repository

To ensure consistency across environments, the project uses renv for package management. The package environment can be restored using the command included in the Makefile:

`.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"`
# How to Run the Project

## Clone the Repository

### Open a terminal and run:
  ```bash
  git clone https://github.com/kairis96/DATA550-FinalProject
  cd DATA550-FinalProject

### Install Required Packages
Ensure all required packages are installed by restoring the renv environment:
  ```bash
  make install
  
### Generate the Final Report
- Use the Makefile to create the final report:
  ```bash
  make Report.html
  
- To open the report, For MacOS:
  ```bash
  open Report.html

- For Windows:
  ```bash
  start Report.html 

### Output Files
The generated report (Report.html) and outputs (e.g., .png figures and .rds files) will be available in the respective directories.

## Outputs

The project generates the following outputs:

### Visualizations:
Bar graphs, stacked bar graphs, and scatterplots illustrating trends and relationships in the dataset.
### Model:
A multinomial logistic regression model (output/multinomial.rds).
### Report:
A comprehensive report (Report.html) detailing the analysis and findings.

# Final Project (Creating a report folder with complied report)

## Prerequisites
- Ensure Docker is installed and running.
- The image `kairis96/finalproject5:latest` is hosted on Docker Hub and will be pulled automatically.

## Generating the Report
To generate the report:
- Run:
   ```bash
   make report
