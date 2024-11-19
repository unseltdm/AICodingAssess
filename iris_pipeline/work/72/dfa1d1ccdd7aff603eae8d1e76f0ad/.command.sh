#!/bin/bash -ue
# Concatenate files
awk 'FNR==1 && NR!=1{next;}{print}' *.csv > linear_regression_summary.csv
