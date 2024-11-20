
  
    

    create or replace table `healthcare-data-project-442109`.`dev_healthcare_data`.`patient_claims_overview`
      
    partition by service_date
    

    OPTIONS()
    as (
      

WITH patient_info AS (
    SELECT
        p.patient_id,
        p.first_name,
        p.last_name,
        p.age,
        p.gender,
        p.insurance_type
    FROM
        `healthcare-data-project-442109`.`dev_healthcare_data`.`patient_data_external` p
),

claims_info AS (
    SELECT
        c.claim_id,
        c.patient_id,
        c.provider_id,
        MAX(c.service_date) AS service_date,  
        MAX(c.diagnosis_code) AS diagnosis_code,  
        SUM(c.claim_amount) AS total_claim_amount,  
        MAX(c.status) AS status  
    FROM
        `healthcare-data-project-442109`.`dev_healthcare_data`.`claims_data_external` c
    WHERE
        c.claim_id IS NOT NULL
    GROUP BY
        c.claim_id, c.patient_id, c.provider_id
)

SELECT
    pi.patient_id,
    pi.first_name,
    pi.last_name,
    pi.age,
    pi.gender,
    pi.insurance_type,
    ci.claim_id,
    ci.provider_id,
    ci.service_date,
    ci.diagnosis_code,
    ci.total_claim_amount AS claim_amount,
    ci.status
FROM
    patient_info pi
LEFT JOIN
    claims_info ci
ON
    pi.patient_id = ci.patient_id
    );
  