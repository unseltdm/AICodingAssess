process COUNT_LINES {
    input:
    path input_file

    output:
    stdout

    script:
    """
    wc -l $input_file
    """
}