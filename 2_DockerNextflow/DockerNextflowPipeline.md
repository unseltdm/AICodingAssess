**Write a Dockerized pipeline in Nextflow** 

with DSL2 syntax that takes a stock data set (e.g. iris, mtcars, palmer penguins), slices it by 
some relevant variable, fits a simple regression model on each slice, and then combines these 
models into a single table. The slicing, fitting, and combining should be distinct Nextflow 
processes, and fitting the regression should be done on each slice in parallel. We are 
primarily interested in seeing how you approach building a pipeline that could scale beyond 
a toy data set.
