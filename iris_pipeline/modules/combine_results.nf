process COMBINE_RESULTS {
    publishDir "results"

    input:
    path("*")

    output:
    path("linear_regression_summary.csv")

    script:
    """
    # Concatenate files
    awk 'FNR==1 && NR!=1{next;}{print}' *.csv > linear_regression_summary.csv
    """
}