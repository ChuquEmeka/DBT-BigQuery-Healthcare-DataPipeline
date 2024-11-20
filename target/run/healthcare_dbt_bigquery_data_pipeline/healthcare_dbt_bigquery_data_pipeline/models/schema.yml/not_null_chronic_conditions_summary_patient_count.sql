select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select patient_count
from `healthcare-data-project-442109`.`dev_healthcare_data`.`chronic_conditions_summary`
where patient_count is null



      
    ) dbt_internal_test