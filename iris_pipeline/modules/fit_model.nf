process FIT_MODEL {
    container 'iris_pipeline:latest'
    publishDir "results"
    input:
    tuple val(ID), path(input_file)

    output:
    path("*linear_regression_output.csv")

    script:
    """
    # Call Python with the script and input file
    python3 /opt/pipeline/scripts/fit.py $input_file
    mv linear_regression_output.csv "${ID}_linear_regression_output.csv"
    """
}