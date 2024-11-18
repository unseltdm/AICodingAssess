#!/usr/bin/env nextflow

nextflow.enable.dsl=2

// Include the process module
include { SORT_FILE } from './modules/sort_file'
include { COUNT_LINES } from './modules/count_lines'
include { REVERSE_FILE } from './modules/reverse_file'

// Define the workflow
workflow {
    // Create a channel from the input file
    input_file = Channel.fromPath(params.input_file)

    // Step 1: Sort the file
    sorted_file = SORT_FILE(input_file)

    // Step 2: Count the lines in the sorted file
    line_count = COUNT_LINES(sorted_file)

    // Step 3: Reverse the sorted file
    reversed_file = REVERSE_FILE(sorted_file)

    // Print results
    sorted_file.view()    // Print the sorted file path
    line_count.view()     // Print the line count
    reversed_file.view()  // Print the reversed file path
}