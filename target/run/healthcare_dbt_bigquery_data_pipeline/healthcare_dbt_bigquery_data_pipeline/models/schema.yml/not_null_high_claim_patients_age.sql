select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select age
from `healthcare-data-project-442109`.`dev_healthcare_data`.`high_claim_patients`
where age is null



      
    ) dbt_internal_test