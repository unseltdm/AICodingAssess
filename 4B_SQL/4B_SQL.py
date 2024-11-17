###############################################################################

# Author: Desiree Unselt
# Date: 17NOV2024

# Analyzing Genomic Data for Gene Expression

# You are working on a bioinformatics platform that analyzes genomic data 
# # and you wish to find gene-level expression values in log2(TPM+1) from 
# transcript-level count data (TPM), where TPM = Transcript per Million.

# Subset of data taken from Expression Atlas and modified for this exercise.
# https://www.ebi.ac.uk/gxa/experiments/E-ENAD-41/Downloads
# Alasoo K. (2017) Regulation of gene expression in macrophage immune response

import random
import pandas as pd
import pyensembl

ensembl = pyensembl.EnsemblRelease(104)
###############################################################################
# Set seed for reproducibility
random.seed(3)

# Read in the data
data = pd.read_csv('TPM_data_10.csv')

# Ensembl Gene Map Table
# gene_symbol (STRING; e.g., RIMOC1)
# chromosome (VCHAR; e.g., 5p13.1)
# ensembl_gene_id (STRING; e.g., ENSG00000205765)
# Create a table with 10 genes
def get_locus_from_gene(gene_id):
    locus = ensembl.locus_of_gene_id(gene_id)
    chromosome = locus.contig
    return chromosome

# Apply the function to each gene ID in the DataFrame
data['chromosome'] = data['Gene ID'].apply(get_locus_from_gene)

# Create table with gene_id and transcript_id only
ensembl_gene_map = data[['Gene ID', 'Gene Name', 'chromosome']]
ensembl_gene_map.columns = ['ensembl_gene_id', 'gene_symbol', 'chromosome']

# Save the table to a CSV file
ensembl_gene_map.to_csv('ensembl_gene_map.csv', index=False)

# Transcript Gene Map Table
# ensembl_gene_id (STRING; e.g., ENSG00000205765)
# trasnscript_code (STRING; e.g, ENST00000505931)

# Function to get transcript IDs from Ensembl gene ID
def get_transcripts_from_gene(gene_id):
    transcripts = ensembl.transcript_ids_of_gene_id(gene_id)
    # Return a list of tuples (gene_id, transcript_id)
    return transcripts

# Apply the function to each gene ID in the DataFrame
data['Transcript IDs'] = data['Gene ID'].apply(get_transcripts_from_gene)

# Flatten the list of tuples into individual rows
data = data.explode('Transcript IDs')

# Create table with gene_id and transcript_id only
transcript_gene_map = data[['Gene ID', 'Transcript IDs']]
transcript_gene_map.columns = ['ensembl_gene_id', 'transcript_code']

# Save the table to a CSV file
transcript_gene_map.to_csv('transcript_gene_map.csv', index=False)

# Transcript Table
# patient_id (STRING)
# transcript_code (STRING; e.g., ENST00000505931).
# transcript_tpm (NUMERIC/FLOAT/DECIMAL): Transcript per million (TPM) value
# Transpose the data so that each row is a patient and each column is a transcript
data = pd.melt(data, value_vars=['Patient1', 'Patient2', 'Patient3', 'Patient4', 'Patient5', 'Patient6', 'Patient7', 'Patient8', 'Patient9', 'Patient10', ], id_vars=['Transcript IDs'],var_name='patient_id', value_name='transcript_tpm')

# Create table with gene_id and transcript_id only
transcript_table = data
transcript_table.columns=['transcript_code','patient_id','transcript_tpm']

# Save the table to a CSV file
transcript_table.to_csv('transcript_table.csv', index=False)




