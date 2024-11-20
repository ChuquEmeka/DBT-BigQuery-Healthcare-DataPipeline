-- back compat for old kwarg name
  
  
        
            
            
        
    

    

    merge into `healthcare-data-project-442109`.`dev_healthcare_data`.`chronic_conditions_summary` as DBT_INTERNAL_DEST
        using (

SELECT
    diagnosis_code,
    diagnosis_desc,
    COUNT(DISTINCT patient_id) AS patient_count
FROM
    `healthcare-data-project-442109`.`dev_healthcare_data`.`ehr_data_external`
WHERE
    diagnosis_code IN ('E11.9', 'I10', 'J45', 'N18.9')
GROUP BY
    diagnosis_code, diagnosis_desc
ORDER BY
    patient_count DESC
        ) as DBT_INTERNAL_SOURCE
        on (
                DBT_INTERNAL_SOURCE.diagnosis_code = DBT_INTERNAL_DEST.diagnosis_code
            )

    
    when matched then update set
        `diagnosis_code` = DBT_INTERNAL_SOURCE.`diagnosis_code`,`diagnosis_desc` = DBT_INTERNAL_SOURCE.`diagnosis_desc`,`patient_count` = DBT_INTERNAL_SOURCE.`patient_count`
    

    when not matched then insert
        (`diagnosis_code`, `diagnosis_desc`, `patient_count`)
    values
        (`diagnosis_code`, `diagnosis_desc`, `patient_count`)


    