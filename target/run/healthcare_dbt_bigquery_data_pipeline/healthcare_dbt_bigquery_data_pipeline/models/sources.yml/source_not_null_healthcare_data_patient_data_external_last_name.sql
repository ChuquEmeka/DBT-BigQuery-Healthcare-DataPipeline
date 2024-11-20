select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select last_name
from `healthcare-data-project-442109`.`dev_healthcare_data`.`patient_data_external`
where last_name is null



      
    ) dbt_internal_test