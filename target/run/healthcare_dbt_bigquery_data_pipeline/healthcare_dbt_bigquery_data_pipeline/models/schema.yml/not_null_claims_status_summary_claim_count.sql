select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select claim_count
from `healthcare-data-project-442109`.`dev_healthcare_data`.`claims_status_summary`
where claim_count is null



      
    ) dbt_internal_test