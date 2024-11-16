###############################################################################

# Author: Desiree Unselt
# Date: 13NOV2024

# Analyzing genomic data for disease associations

# You are working on a bioinformatics platform that analyzes genomic data to 
# find associations between genetic variants and diseases. You have access to a 
# dataset containing information about genetic variants, patients, and their 
# disease status.

import pandas as pd
import random
import string

###############################################################################

# Generate a dataset with 1000 records

# List of chromosome names (1-22, X, Y)
chromosomes = [str(i) for i in range(1, 23)] + ['X', 'Y']

data = {
    # patient_id (STRING): Unique identifier for the patient.
    "patient_id": [str(i) for i in range(101,1101)],
    # variant_id (STRING): Unique identifier for the genetic variant.
    "variant_id": [str(i) for i in range(1,1001)],
    # chromosome (STRING): Chromosome where the variant is located.
    "chromosome": [random.choice(chromosomes) for _ in range(1000)],
    # position (INTEGER): Position on the chromosome.
    "position": [random.randint(1, 250_000_000) for _ in range(1000)],
    # reference_allele (STRING): Reference allele.
    "reference_allele": [random.choice(['A', 'T', 'C', 'G']) for _ in range(1000)],
    # alternate_allele (STRING): Alternate allele.
    "alternate_allele": [random.choice(['A', 'T', 'C', 'G']) for _ in range(1000)],
    # disease_status (STRING): Disease status of the patient ('diseased' or
    # 'healthy').
    "disease_status": [random.choice(['diseased', 'healthy']) for _ in range(1000)],
}

# Create a Variant DataFrame
df = pd.DataFrame(data)

# Create Variant Table
variant_df = df[['variant_id','chromosome','position','reference_allele','alternate_allele']]
# Display the DataFrame
print(variant_df)

# Create a Patient Table
patient_df = df[['patient_id','variant_id','disease_status']]
# Display the DataFrame
print(patient_df)

# Create a DataFrame
patient_df = pd.DataFrame(pdata)
# Display the DataFrame
print(patient_df)

duplicates = df[df.duplicated()]
print(duplicates['variant_id','chromosome','position','reference_allele','alternate_allele'])