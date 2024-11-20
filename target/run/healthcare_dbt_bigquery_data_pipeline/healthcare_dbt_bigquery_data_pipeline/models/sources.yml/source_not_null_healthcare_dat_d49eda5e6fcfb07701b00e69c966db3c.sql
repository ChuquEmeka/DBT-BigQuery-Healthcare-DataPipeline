select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select diagnosis_code
from `healthcare-data-project-442109`.`dev_healthcare_data`.`ehr_data_external`
where diagnosis_code is null



      
    ) dbt_internal_test