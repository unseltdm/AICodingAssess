###############################################################################

# Author: Desiree Unselt
# Date: 16NOV2024

# Analyzing genomic data for disease associations

# You are working on a bioinformatics platform that analyzes genomic data to 
# find associations between genetic variants and diseases. You have access to a 
# dataset containing information about genetic variants, patients, and their 
# disease status.

import pandas as pd
import random
import string

###############################################################################
# Set seed for reproducibility
random.seed(3)

# Create a DataFrame of 100 variants. The columns should be variant_id (STRING), 
# chromosome (STRING), position (INTEGER), reference_allele (STRING), 
# and alternate_allele (STRING).
chromosomes = [str(i) for i in range(1, 23)] + ['X', 'Y']

# Initialize empty lists
reference_allele = []
alternate_allele = []

# Generate allele columns ensuring they are not the same
for _ in range(100):
    ref = random.choice(["A", "T", "C", "G"])
    alt = random.choice([allele for allele in ["A", "T", "C", "G"] if allele != ref])
    reference_allele.append(ref)
    alternate_allele.append(alt)

# Combine the two columns with remaining columns
data = {
    "variant_id": ['VAR_' + str(i) for i in range(1, 101)],
    "chromosome": [random.choice(chromosomes) for _ in range(100)],
    "position": [random.randint(1, 250_000) for _ in range(100)],
    "reference_allele": reference_allele,
    "alternate_allele": alternate_allele
}

# Create dataframe
df = pd.DataFrame(data)
# Save the df to a CSV file
df.to_csv("variant_data.csv", index=False)

# Create a DataFrame of 1000 patients. The columns should be patient_id (STRING) and
# disease_status (STRING)
pdata = {
    # patient_id (STRING): Unique identifier for the patient. PAT_00001, PAT_00002, ...
    "patient_id": ['PAT_' + str(i).zfill(5) for i in range(1, 1001)],
    "disease_status": [random.choice(["diseased", "healthy"]) for _ in range(1000)],
}

patient_df = pd.DataFrame(pdata)

# Create a DataFrame where each patient has between 5 and 10 variants. A variant can be repeated.
# The columns should be patient_id (STRING) and variant_id (STRING)
patient_variants = {
    "patient_id": [],
    "variant_id": [],
}

for patient in pdata["patient_id"]:
    num_variants = random.randint(5, 10)
    variants = random.choices(df["variant_id"], k=num_variants)
    patient_variants["patient_id"].extend([patient] * num_variants)
    patient_variants["variant_id"].extend(variants)

patient_variants_df = pd.DataFrame(patient_variants)

# Merge the patient_variants_df with the patient_df
merged_df = pd.merge(patient_variants_df, patient_df, on="patient_id")
# Save the final_df to a CSV file
merged_df.to_csv("patient_data.csv", index=False)

# Merge the merged_df with the df DataFrame
final_df = pd.merge(merged_df, df, on="variant_id")
# Save the final_df to a CSV file
final_df.to_csv("genomic_data.csv", index=False)

