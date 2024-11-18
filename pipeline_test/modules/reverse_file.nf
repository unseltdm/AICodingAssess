process REVERSE_FILE {
    input:
    path input_file

    output:
    path "reversed_output.txt"

    script:
    """
    gtac $input_file > reversed_output.txt
    """
}