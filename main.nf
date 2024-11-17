nextflow.enable.dsl=2

process splice {

    script:
    """
    docker run -v ~/Git/AICodingAssess/output:/output/ $EA_DC_DOCKER_REGISTRY/du_test:latest python /scripts/splice.py
    """
}

process fit {
    script:
    """
    
    """
}

workflow {
    splice()
}