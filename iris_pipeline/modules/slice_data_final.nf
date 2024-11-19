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
    docker run iris_pipeline python3 /scripts/slice_data_final.py /data/Iris.csv
    """
}