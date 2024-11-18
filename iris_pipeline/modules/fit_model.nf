process FIT_MODEL {
    input:
    path "*csv"
    // path python_script2 // Python script path

    output:
    "linear_regression_output.csv"

    script:
    """
    # Call Python with the script and input file
    python3 $python_script $input_file
    """
}