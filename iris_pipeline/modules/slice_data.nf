process SLICE_DATA {
    input:
    path input_file

    output:
    path "sliced*"

    script:
    """
    
    split -l 50 $input_file sliced_part_
    """
}