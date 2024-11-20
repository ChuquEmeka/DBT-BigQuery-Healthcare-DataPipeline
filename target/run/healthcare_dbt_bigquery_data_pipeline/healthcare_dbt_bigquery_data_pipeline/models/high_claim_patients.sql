-- back compat for old kwarg name
  
  
        
            
            
        
    

    

    merge into `healthcare-data-project-442109`.`dev_healthcare_data`.`high_claim_patients` as DBT_INTERNAL_DEST
        using (

WITH patient_claim_totals AS (
    SELECT
        patient_id,
        SUM(claim_amount) AS total_claim_amount
    FROM
        `healthcare-data-project-442109`.`dev_healthcare_data`.`claims_data_external`
    GROUP BY
        patient_id
),

high_claims AS (
    SELECT
        patient_id,
        total_claim_amount
    FROM
        patient_claim_totals
    WHERE
        total_claim_amount > 10000  
)

SELECT
    hc.patient_id,
    hc.total_claim_amount,
    pd.first_name,
    pd.last_name,
    pd.age,
    pd.gender,
    pd.insurance_type
FROM
    high_claims hc
LEFT JOIN
    `healthcare-data-project-442109`.`dev_healthcare_data`.`patient_data_external` pd
ON
    hc.patient_id = pd.patient_id
        ) as DBT_INTERNAL_SOURCE
        on (
                DBT_INTERNAL_SOURCE.patient_id = DBT_INTERNAL_DEST.patient_id
            )

    
    when matched then update set
        `patient_id` = DBT_INTERNAL_SOURCE.`patient_id`,`total_claim_amount` = DBT_INTERNAL_SOURCE.`total_claim_amount`,`first_name` = DBT_INTERNAL_SOURCE.`first_name`,`last_name` = DBT_INTERNAL_SOURCE.`last_name`,`age` = DBT_INTERNAL_SOURCE.`age`,`gender` = DBT_INTERNAL_SOURCE.`gender`,`insurance_type` = DBT_INTERNAL_SOURCE.`insurance_type`
    

    when not matched then insert
        (`patient_id`, `total_claim_amount`, `first_name`, `last_name`, `age`, `gender`, `insurance_type`)
    values
        (`patient_id`, `total_claim_amount`, `first_name`, `last_name`, `age`, `gender`, `insurance_type`)


    