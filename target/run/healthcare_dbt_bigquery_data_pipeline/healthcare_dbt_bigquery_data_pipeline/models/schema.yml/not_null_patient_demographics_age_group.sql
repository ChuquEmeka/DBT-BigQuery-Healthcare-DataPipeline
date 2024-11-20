select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select age_group
from `healthcare-data-project-442109`.`dev_healthcare_data`.`patient_demographics`
where age_group is null



      
    ) dbt_internal_test