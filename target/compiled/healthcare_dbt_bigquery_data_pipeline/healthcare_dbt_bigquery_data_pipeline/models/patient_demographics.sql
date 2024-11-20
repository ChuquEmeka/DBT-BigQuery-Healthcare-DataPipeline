

WITH age_groups AS (
    SELECT
        patient_id,  -- Include patient_id here
        CASE
            WHEN age < 18 THEN 'Child'
            WHEN age BETWEEN 18 AND 34 THEN 'Young Adult'
            WHEN age BETWEEN 35 AND 64 THEN 'Adult'
            ELSE 'Senior'
        END AS age_group,
        gender,
        insurance_type
    FROM
        `healthcare-data-project-442109`.`dev_healthcare_data`.`patient_data_external`
)

SELECT
    patient_id,  -- Include patient_id in the final SELECT if required
    age_group,
    gender,
    insurance_type,
    COUNT(*) AS patient_count
FROM
    age_groups
GROUP BY
    patient_id, age_group, gender, insurance_type  -- Include patient_id in GROUP BY
ORDER BY
    age_group