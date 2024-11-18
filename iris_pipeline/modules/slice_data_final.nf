process SLICE_DATA {
    input:
    path input_file  // Input file path
    path python_script // Python script path

    output:
    path("*.csv")

    script:
    """
    # Call Python with the script and input file
    python3 $python_script $input_file
    """
}