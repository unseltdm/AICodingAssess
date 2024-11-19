#!/usr/bin/env nextflow
nextflow.enable.dsl=2

// Include the process module
include { SLICE_DATA } from './modules/slice_data_final'
// include { FIT_MODEL } from './modules/fit_model'
// include { COMBINE_RESULTS } from './modules/combine_results'

// Create a channel from the input file
input_file = Channel.fromPath(params.input_file)

// python_script = Channel.fromPath(params.python_script)
// python_script2 = Channel.fromPath(params.python_script2)

// Define the workflow
workflow {

    // Run the Python script using the input file
    result = SLICE_DATA(input_file)
    result.view()
    // Print the output of the Python script (number of lines)
    // model_input_ch = result
    //                    .flatten()
    //                    .map{tuple it.getSimpleName(),it}.combine(python_script2)
    // model_input_ch.view()

    // FIT_MODEL(model_input_ch)

    // combine_input_ch = FIT_MODEL.out.collect()

    // COMBINE_RESULTS(combine_input_ch)
}