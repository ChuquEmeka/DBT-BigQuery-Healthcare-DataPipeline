{{ config(
    materialized='incremental',
    unique_key='claim_id',
    incremental_strategy='insert_overwrite'
) }}

WITH patient_info AS (
    SELECT
        p.patient_id,
        p.first_name,
        p.last_name,
        p.age,
        p.gender,
        p.insurance_type,
        e.visit_date,
        e.diagnosis_code,
        e.diagnosis_desc
    FROM
        {{ source('healthcare_data', 'patient_data_external') }} p
    LEFT JOIN
        {{ source('healthcare_data', 'ehr_data_external') }} e
    ON
        p.patient_id = e.patient_id
),

claims_info AS (
    SELECT
        c.claim_id,
        c.patient_id,
        c.provider_id,
        c.service_date,
        c.diagnosis_code,
        c.claim_amount,
        c.status
    FROM
        {{ source('healthcare_data', 'claims_data_external') }} c
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
    ci.claim_amount,
    ci.status
FROM
    patient_info pi
LEFT JOIN
    claims_info ci
ON
    pi.patient_id = ci.patient_id
