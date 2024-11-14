## Bioinformatics Scientist - Pipeline Development
## Tempus AI Coding Assessment
_Please commit your notes, code blocks, explanation/demos, notebooks, etc. to a public github
repo and submit the url for review. The support of various AI tools will be tempting, but we would
prefer that you minimize using such resources in this assessment. Recommended time spent on
the entire list is less than three or four hours to help us evaluate core skills and interests. Good
luck, and happy coding!_

################################################################

**1. Design a Scalable Twitter Clone in the Cloud**

Imagine you are tasked with building a basic Twitter clone in the cloud (using GCP or another
cloud platform).
- Define a Minimum Viable Product (MVP): Start by outlining a basic set of features that
you would include in a minimal version of the application. What core functionality must
be supported?
- Identify Required Cloud Resources: Describe the cloud resources you would use to build
and deploy this MVP. How would you connect and configure them?
- Scaling Strategy: After launching the MVP, explain how you would scale the system to
handle growing user traffic. What resources or architectural changes would be
necessary for scaling?
- Additional Features & Considerations: As the application grows, new features might be
added. Discuss any potential additional features and the cloud resources you would
need to support them.
- Key Questions: What critical questions would you need to address as you plan the
system’s architecture and scaling strategy?

################################################################

**2. Write a Dockerized pipeline in Nextflow** with DSL2 syntax that takes a stock data set (e.g.
iris, mtcars, palmer penguins), slices it by some relevant variable, fits a simple regression model
on each slice, and then combines these models into a single table. The slicing, fitting, and
combining should be distinct Nextflow processes, and fitting the regression should be done on
each slice in parallel. We are primarily interested in seeing how you approach building a pipeline
that could scale beyond a toy data set.

################################################################

**3. Describe a Python package that you use regularly.** What are the most useful
class/methods/functions? What are the limitations, gotchas, bugs in the package? Can you
white-board a strategy that might work to improve the package? We are interested in how well
you know your tools and how interested you are in improving stuff you use.

################################################################

**4A. SQL/GBQ Challenge 1:** Analyzing Genomic Data for Disease Association

_Background:_

You are working on a bioinformatics platform that analyzes genomic data to find associations
between genetic variants and diseases. You have access to a dataset containing information
about genetic variants, patients, and their disease status.

_Dataset:_

You have two tables in your BigQuery dataset:
- variants:
  - variant_id (STRING): Unique identifier for the genetic variant.
  - chromosome (STRING): Chromosome where the variant is located.
  - position (INTEGER): Position on the chromosome.
  - reference_allele (STRING): Reference allele.
  - alternate_allele (STRING): Alternate allele.
- patients:
  - patient_id (STRING): Unique identifier for the patient.
  - variant_id (STRING): Identifier for the genetic variant (foreign key to
variants.variant_id).
  - disease_status (STRING): Disease status of the patient ('diseased' or
'healthy').

_Task:_

Write a SQL query to identify the top 5 genetic variants that are most strongly associated with
the disease. The association is measured by the difference in the frequency of the variant
between diseased and healthy patients.

_Steps:_

- Calculate the frequency of each variant in diseased patients.
- Calculate the frequency of each variant in healthy patients.
- Compute the absolute difference in frequencies for each variant.
- Return the top 5 variants with the highest absolute difference in frequencies.

_Expected Output:_

The query should return the following columns:
- variant_id: The unique identifier for the genetic variant.
- diseased_frequency: The frequency of the variant in diseased patients.
- healthy_frequency: The frequency of the variant in healthy patients.
- frequency_difference: The absolute difference in frequencies between diseased and
healthy patients.

_Notes:_

- Ensure that your query handles cases where a variant might be present in only diseased
or only healthy patients.
- Consider edge cases where the number of patients is very small or where variants are
extremely rare.

################################################################

**4B. SQL/GBQ Challenge 2:** Analyzing Genomic Data for Gene Expression

_Background:_

You are working on a bioinformatics platform that analyzes genomic data and you wish to find
gene-level expression values in log2(TPM+1) from transcript-level count data (TPM), where
TPM = Transcript per Million.

_Dataset:_

You have three target tables in your BigQuery dataset:
- transcripts:
  - patient_id (STRING): Unique identifier for the patient.
  - transcript_code (STRING): Unique Ensembl identifier for a given transcript (of
type ENST00000505931).
  - transcript_tpm (NUMERIC/FLOAT/DECIMAL): Transcript per million (TPM) value
for a given transcript.
- transcript_gene_map:
  - ensembl_gene_id (STRING): Unique Ensembl identifier for a given transcript (of
type ENSG00000205765).
  - trasnscript_code (STRING): Unique Ensembl identifier for a given transcript (of
type ENST00000505931).
- ensembl_gene_map:
  - gene_symbol (STRING): Unique identifier for HUGO gene name (of type
RIMOC1)
  - chromosome (VCHAR): Chromosome location of gene (of type 5p13.1)
  - ensembl_gene_id (STRING): Unique Ensembl identifier for a given transcript (of
type ENSG00000205765).

_Task:_

Write a SQL query to aggregate all transcript TPM values to a gene-level log2(TPM+1) output
for every unique gene in every unique patient.
The query should return the following columns:
- patient_id: The unique identifier for each patient.
- gene_symbol: The Hugo symbol for each gene.
- log2(TPM+1): The log2(TPM+1) expression level for each gene.

_Notes:_

- Ensure that your query handles cases where there may be a single transcript for a given
gene.
- Ensure that your query handles cases where there may be a null value(s) for
transcript_tpm.
