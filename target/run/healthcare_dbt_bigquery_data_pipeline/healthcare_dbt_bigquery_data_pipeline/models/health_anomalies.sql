-- back compat for old kwarg name
  
  
        
            
            
        
    

    

    merge into `healthcare-data-project-442109`.`dev_healthcare_data`.`health_anomalies` as DBT_INTERNAL_DEST
        using (

SELECT
    patient_id,
    visit_date,
    heart_rate,
    blood_pressure,
    temperature,
    CASE
        WHEN heart_rate > 150 THEN 'High Heart Rate'
        WHEN blood_pressure = '200/120' THEN 'High Blood Pressure'
        WHEN temperature > 99.5 THEN 'High Temperature'
        ELSE 'Normal'
    END AS anomaly_flag
FROM
    `healthcare-data-project-442109`.`dev_healthcare_data`.`ehr_data_external`
WHERE
    heart_rate > 150 OR blood_pressure = '200/120' OR temperature > 99.5
        ) as DBT_INTERNAL_SOURCE
        on (
                DBT_INTERNAL_SOURCE.patient_id = DBT_INTERNAL_DEST.patient_id
            )

    
    when matched then update set
        `patient_id` = DBT_INTERNAL_SOURCE.`patient_id`,`visit_date` = DBT_INTERNAL_SOURCE.`visit_date`,`heart_rate` = DBT_INTERNAL_SOURCE.`heart_rate`,`blood_pressure` = DBT_INTERNAL_SOURCE.`blood_pressure`,`temperature` = DBT_INTERNAL_SOURCE.`temperature`,`anomaly_flag` = DBT_INTERNAL_SOURCE.`anomaly_flag`
    

    when not matched then insert
        (`patient_id`, `visit_date`, `heart_rate`, `blood_pressure`, `temperature`, `anomaly_flag`)
    values
        (`patient_id`, `visit_date`, `heart_rate`, `blood_pressure`, `temperature`, `anomaly_flag`)


    