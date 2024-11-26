select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select total_claim_amount
from `healthcare-data-project-442109`.`dev_healthcare_data`.`claims_status_summary`
where total_claim_amount is null



      
    ) dbt_internal_test