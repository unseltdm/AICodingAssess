#!/bin/bash -ue
# Call Python with the script and input file
python3 /opt/pipeline/scripts/fit.py slice_1.csv
mv linear_regression_output.csv "slice_1_linear_regression_output.csv"
