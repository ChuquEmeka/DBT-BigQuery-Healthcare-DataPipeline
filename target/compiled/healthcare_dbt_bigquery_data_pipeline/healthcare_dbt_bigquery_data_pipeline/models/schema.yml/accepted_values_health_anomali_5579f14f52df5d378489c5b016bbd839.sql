
    
    

with all_values as (

    select
        anomaly_flag as value_field,
        count(*) as n_records

    from `healthcare-data-project-442109`.`dev_healthcare_data`.`health_anomalies`
    group by anomaly_flag

)

select *
from all_values
where value_field not in (
    'High Heart Rate','High Blood Pressure','High Temperature','Normal'
)


