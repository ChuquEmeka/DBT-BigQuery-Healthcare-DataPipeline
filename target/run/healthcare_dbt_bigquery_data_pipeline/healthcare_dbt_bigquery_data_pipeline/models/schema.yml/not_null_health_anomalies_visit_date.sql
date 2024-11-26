select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select visit_date
from `healthcare-data-project-442109`.`dev_healthcare_data`.`health_anomalies`
where visit_date is null



      
    ) dbt_internal_test