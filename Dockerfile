FROM rocker/rstudio AS base

RUN apt-get update && apt-get install -y pandoc

RUN mkdir /finalproject
WORKDIR /finalproject

RUN mkdir dataset
RUN mkdir code
RUN mkdir output

#Copying all relevant files
COPY dataset/dia_clean.RDS \
     dataset/diabetes_012_health_indicators_BRFSS2015.csv \
     /finalproject/dataset/
     
COPY code/00_make_data_clean.R \
     code/01_make_output1.R \
     code/02_make_output2.R \
     code/03_make_output3.R \
     code/04_make_model.R \
     code/05_render_report.R \
     /finalproject/code/
     
COPY output/bargraph.png \
     output/scatterplot.png \
     output/stackbargraph.png \
     output/multinomial.rds \ 
     /finalproject/output
COPY Makefile . 
COPY Report.Rmd .

RUN mkdir -p renv
COPY renv.lock renv.lock 
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CASH=renv/.cache

RUN R -e "renv::restore(prompt=FALSE)"

RUN mkdir final_report

CMD make && mv Report.html final_report
