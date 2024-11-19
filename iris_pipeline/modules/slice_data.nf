process SLICE_DATA {
    container 'iris_pipeline:1.0.0'
    publishDir "results"

    input:
    path(input_file)

    output:
    path("*.csv")

    script:
    """
    # Call Python with the script and input file
    python3 /opt/pipeline/scripts/slice_data.py $input_file
    """
}