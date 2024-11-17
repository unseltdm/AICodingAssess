nextflow.enable.dsl=2

process COUNT_LINES {
    input:
    path file

    output
    tuple path(file), val(lines)

    script:
    """
    lines=\$(cat $file | wc -l)
    echo \$lines
    """
}

workflow {
    main:
    Channel.fromPath('*.txt').set { txt_files }
    COUNT_LINES(txt_files)
}