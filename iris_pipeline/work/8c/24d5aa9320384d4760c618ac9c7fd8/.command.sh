#!/bin/bash -ue
# Call Python with the script and input file
python3 /opt/pipeline/scripts/fit.py slice_3.csv
mv linear_regression_output.csv "slice_3_linear_regression_output.csv"
