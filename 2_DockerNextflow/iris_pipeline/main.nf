#!/usr/bin/env nextflow
nextflow.enable.dsl=2

// Include the process module
include { SLICE_DATA } from './modules/slice_data'
include { FIT_MODEL } from './modules/fit_model'
include { COMBINE_RESULTS } from './modules/combine_results'

// Create a channel from the input file
input_file = Channel.fromPath(params.input_file)

// Define the workflow
workflow {

    // Run the Python script using the input file
    result = SLICE_DATA(input_file)
    
    // Print the output of the Python script (number of lines)
    model_input_ch = result
                        .flatten()
                         .map{tuple it.getSimpleName(),it}

    FIT_MODEL(model_input_ch)

    combine_input_ch = FIT_MODEL.out.collect()

    COMBINE_RESULTS(combine_input_ch)
}
