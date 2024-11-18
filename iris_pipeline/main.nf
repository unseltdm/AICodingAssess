#!/usr/bin/env nextflow

nextflow.enable.dsl=2

// Include the process module
include { SLICE_DATA } from './modules/slice_data_final'
// include { FIT_MODEL } from './modules/fit_model'
// include { COMBINE_RESULTS } from './modules/combine_results'

// Create a channel from the input file
input_file = Channel.fromPath(params.input_file)

python_script = Channel.fromPath(params.python_script)

// Define the workflow
workflow {

    // Run the Python script using the input file
    result = SLICE_DATA(input_file, python_script)
    
    // FIT_MODEL(SLICE_DATA.out)

    // Print the output of the Python script (number of lines)
    result.view()

    // Step 1: Sort the file
    // slice_file = SLICE_DATA(input_file)

    // Step 2: Count the lines in the sorted file
    // line_count = COUNT_LINES(sorted_file)

    // Step 3: Reverse the sorted file
    // reversed_file = REVERSE_FILE(sorted_file)

    // Print results
    // slice_file.view()    // Print the sorted file path
    // line_count.view()     // Print the line count
    // reversed_file.view()  // Print the reversed file path
}