#! rules to build the report
Report.html: output/bargraph.png \ 
	output/stackbargraph.png \
	output/scatterplot.png \
	output/multinomial.rds \
	Report.Rmd code/05_render_report.R
	Rscript code/05_render_report.R
	
#! rule to load in the data
dataset/dia_clean.rds: Rscript 00_make_data_clean.R
	
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

.PHONY: clean
clean:
	rm -f dataset/dia_clean.rds output/*.rds && \
	rm -f Report.html
	
.PHONY: install
install:
Rscript -e "renv::restore(prompt = FALSE)"
	