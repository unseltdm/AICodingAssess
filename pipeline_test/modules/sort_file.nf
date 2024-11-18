process SORT_FILE {
    input:
    path input_file

    output:
    path "sorted_output.txt"

    script:
    """
    sort $input_file > sorted_output.txt
    """
}