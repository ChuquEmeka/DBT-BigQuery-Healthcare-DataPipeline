select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select gender
from `healthcare-data-project-442109`.`dev_healthcare_data`.`patient_demographics`
where gender is null



      
    ) dbt_internal_test