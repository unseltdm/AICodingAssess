#!/bin/bash -ue
lines_per_file=50

split -l $lines_per_file $input_file sliced_part_
