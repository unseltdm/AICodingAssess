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

-- Current Answer, need to figure out percentage and only include variants contributing to disease
WITH VariantFrequencies AS (
	SELECT variant_id, disease_status, COUNT(*) AS frequency
	FROM patients
	GROUP BY variant_id, disease_status
),
VariantDifferences AS (
	SELECT vf1.variant_id,
	COALESCE(vf1.frequency, 0) AS diseased_frequency,
    COALESCE(vf2.frequency, 0) AS healthy_frequency,
	ABS(COALESCE(vf1.frequency,0) - COALESCE(vf2.frequency,0)) AS frequency_difference
	FROM VariantFrequencies vf1
	LEFT JOIN VariantFrequencies vf2
		ON vf1.variant_id = vf2.variant_id AND vf2.disease_status = 'healthy'
	LEFT JOIN VariantFrequencies vf3
		ON vf1.variant_id = vf3.variant_id AND vf3.disease_status = 'diseased'
	WHERE vf1.disease_status = 'diseased'
)
SELECT variants.*, VariantDifferences.frequency_difference
FROM VariantDifferences
JOIN variants ON VariantDifferences.variant_id = variants.variant_id
ORDER BY frequency_difference DESC
LIMIT 5;

/* Expected Output:
The query should return the following columns:
variant_id: The unique identifier for the genetic variant.
diseased_frequency: The frequency of the variant in diseased patients.
healthy_frequency: The frequency of the variant in healthy patients.
frequency_difference: The absolute difference in frequencies between diseased 
and healthy patients. */

/* Notes:
Ensure that your query handles cases where a variant might be present in only 
diseased or only healthy patients.
Consider edge cases where the number of patients is very small or where 
variants are extremely rare. */

