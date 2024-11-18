#!/bin/bash -ue
# Number of lines to include in each split file
lines_per_file=50

# Split the input file into smaller files
split -l $lines_per_file $input_file sliced_part_
