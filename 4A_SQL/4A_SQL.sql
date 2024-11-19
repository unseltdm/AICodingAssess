-- Create Variant table
CREATE TABLE variants
(variant_id VARCHAR(25) PRIMARY KEY, 
chromosome VARCHAR(25),
position INT,
reference_allele CHAR(1),
alternate_allele CHAR(1)
);

COPY variants
FROM '/Users/dmunselt/Documents/AICodingAssess/variant_data.csv'
DELIMITER ','
CSV HEADER;

-- Create Patient table
CREATE TABLE patients
(patient_id VARCHAR(25), 
variant_id VARCHAR(25),
FOREIGN KEY (variant_id) REFERENCES variants(variant_id), 
disease_status VARCHAR(25)
);

COPY patients
FROM '/Users/dmunselt/Documents/AICodingAssess/patient_data.csv'
DELIMITER ','
CSV HEADER;

/* Write a SQL query to identify the top 5 genetic variants that are most 
strongly associated with the disease. The association is measured by the 
difference in the frequency of the variant between diseased and healthy 
patients. */

-- Calculate the frequency of each variant in diseased patients.
-- Calculate the frequency of each variant in healthy patients.
-- Compute the absolute difference in frequencies for each variant.
-- Return the top 5 variants with the highest absolute difference in frequencies.
WITH VariantFrequencies AS (
	SELECT variant_id, disease_status, COUNT(*) AS frequency
	FROM patients
	GROUP BY variant_id, disease_status
),
TotalCounts AS (
	SELECT variant_id, COUNT(*) AS total_count
	FROM patients
	GROUP BY variant_id
),
VariantDifferences AS (
	SELECT vf1.variant_id,
	MAX(COALESCE(CASE WHEN vf1.disease_status = 'diseased' THEN vf1.frequency ELSE 0 END,0) * 1.0 / tc1.total_count) AS diseased_frequency,
	MAX(COALESCE(CASE WHEN vf1.disease_status = 'healthy' THEN vf1.frequency ELSE 0 END,0) * 1.0 / tc1.total_count) AS healthy_frequency,
	ABS(MAX(COALESCE(CASE WHEN vf1.disease_status = 'diseased' THEN vf1.frequency ELSE 0 END,0) * 1.0 / tc1.total_count) - MAX(COALESCE(CASE WHEN vf1.disease_status = 'healthy' THEN vf1.frequency ELSE 0 END,0)* 1.0 / tc1.total_count)) AS frequency_difference
		
	FROM VariantFrequencies vf1
	LEFT JOIN TotalCounts tc1
		ON tc1.variant_id = vf1.variant_id
	GROUP BY vf1.variant_id
)
SELECT variants.variant_id, VariantDifferences.diseased_frequency,VariantDifferences.healthy_frequency, VariantDifferences.frequency_difference
FROM VariantDifferences
JOIN variants ON VariantDifferences.variant_id = variants.variant_id
ORDER BY frequency_difference DESC
LIMIT 5;
