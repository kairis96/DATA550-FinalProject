#! rules to build the report
Report.html: output/bargraph.png \
	output/stackbargraph.png \
	output/scatterplot.png \
	output/multinomial.rds \
	Report.Rmd code/05_render_report.R
	Rscript code/05_render_report.R

#! rule to load in the data
dataset/dia_clean.rds: code/00_make_data_clean.R
	Rscript code/00_make_data_clean.R

#! code/01_make_output1.R
output/bargraph.png: dataset/dia_clean.rds 
	Rscript code/01_make_output1.R

#! code/02_make_output2.R
output/stackbargraph.png: dataset/dia_clean.rds 
	Rscript code/02_make_output2.R

#! code/03_make_output3.R
output/scatterplot.png: dataset/dia_clean.rds 
	Rscript code/03_make_output3.R

#! Rule to create model
output/multinomial.rds: dataset/dia_clean.rds
	Rscript code/04_make_model.R

.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"

# DOCKER-ASSOCIATED RULES (Run on local machine)
PROJECTFILES = output/bargraph.png \
	output/stackbargraph.png \
	output/scatterplot.png \
	output/multinomial.rds \
	Report.Rmd code/05_render_report.R

RENVFILES = renv.lock renv/activate.R renv/settings.json

#! rules to build image
finalproject5: Dockerfile $(PROJECTFILES) $(RENVFILES)
	docker build -t finalproject5 .
	touch $@
	
#! rules to build the report automatically 
final_report/Report.html: finalproject5 
	docker run -v "$$(pwd)"/final_report:/finalproject/final_report finalproject5

#! rules to build the report via make 
DOCKER_IMAGE = kairis96/finalproject5:latest
REPORT_DIR = report
CONTAINER_DIR = /finalproject/final_report

.PHONY: report
report:
	mkdir -p $(REPORT_DIR)
	docker run --rm \
		-v "$$(pwd)/$(REPORT_DIR):$(CONTAINER_DIR)" \
		$(DOCKER_IMAGE) \
		Rscript -e "rmarkdown::render('Report.Rmd', output_dir='$(CONTAINER_DIR)')"

.PHONY: clean
clean:
	rm -f dataset/dia_clean.rds output/*.rds output/*.png && \
	rm -f Report.html && \
	rm -rf $(REPORT_DIR)

