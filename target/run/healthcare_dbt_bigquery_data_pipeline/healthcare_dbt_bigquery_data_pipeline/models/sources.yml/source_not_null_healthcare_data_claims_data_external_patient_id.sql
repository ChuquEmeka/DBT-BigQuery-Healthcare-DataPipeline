select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select patient_id
from `healthcare-data-project-442109`.`dev_healthcare_data`.`claims_data_external`
where patient_id is null



      
    ) dbt_internal_test