process SLICE_DATA {
    container 'iris_pipeline:latest'
    publishDir "results_test"

    input:
    path(input_file)

    output:
    path("*.csv")

    script:
    """
    # Call Python with the script and input file
    python3 /opt/pipeline/scripts/slice_data_final.py $input_file
    """
}