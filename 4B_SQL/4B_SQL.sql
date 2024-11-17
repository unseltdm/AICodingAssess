-- Create Transcripts table
CREATE TABLE transcripts
(transcript_code VARCHAR(25),
patient_id VARCHAR(25), 
transcript_tpm FLOAT
);

COPY transcripts
FROM './transcript_table.csv'
DELIMITER ','
CSV HEADER;

-- Create Ensembl Gene Map table
CREATE TABLE ensembl_map
(ensembl_gene_id VARCHAR(25),
gene_symbol VARCHAR(25), 
chromosome VARCHAR(25)
);

COPY ensembl_map
FROM './ensembl_gene_map.csv'
DELIMITER ','
CSV HEADER;

-- Create Transcript Gene Map table
CREATE TABLE transcript_map
(ensembl_gene_id VARCHAR(25),
transcript_code VARCHAR(25) PRIMARY KEY
);

COPY transcript_map
FROM './transcript_gene_map.csv'
DELIMITER ','
CSV HEADER;

/* Write a SQL query to aggregate all transcript TPM values to a gene-level 
log2(TPM+1) output for every unique gene in every unique patient.
The query should return the following columns:
- patient_id: The unique identifier for each patient.
- gene_symbol: The Hugo symbol for each gene.
- log2(TPM+1): The log2(TPM+1) expression level for each gene. */

SELECT 
    tt.patient_id,
    em.gene_symbol,
    SUM(LN(COALESCE(tt.transcript_tpm,0)+1) / LN(2)) AS log2_tpm
FROM 
    transcripts tt
JOIN 
    transcript_map tm
ON 
    tt.transcript_code = tm.transcript_code
JOIN 
    ensembl_map em
ON 
    tm.ensembl_gene_id = em.ensembl_gene_id
GROUP BY 
    	tt.patient_id, em.gene_symbol
ORDER BY 
    tt.patient_id, em.gene_symbol;	