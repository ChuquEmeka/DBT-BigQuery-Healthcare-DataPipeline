select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select heart_rate
from `healthcare-data-project-442109`.`dev_healthcare_data`.`ehr_data_external`
where heart_rate is null



      
    ) dbt_internal_test