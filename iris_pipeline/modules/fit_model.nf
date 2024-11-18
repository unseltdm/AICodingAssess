process FIT_MODEL {
    publishDir "results"
    input:
    tuple val(ID), path(input_file), path(python_script2)

    output:
    path("*linear_regression_output.csv")

    script:
    """
    # Call Python with the script and input file
    python3 $python_script2 $input_file
    mv linear_regression_output.csv "${ID}_linear_regression_output.csv"
    """
}