select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select anomaly_flag
from `healthcare-data-project-442109`.`dev_healthcare_data`.`health_anomalies`
where anomaly_flag is null



      
    ) dbt_internal_test