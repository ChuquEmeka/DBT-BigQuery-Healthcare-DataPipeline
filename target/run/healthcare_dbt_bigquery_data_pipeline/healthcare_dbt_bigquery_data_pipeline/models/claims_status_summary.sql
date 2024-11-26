-- back compat for old kwarg name
  
  
        
            
            
        
    

    

    merge into `healthcare-data-project-442109`.`dev_healthcare_data`.`claims_status_summary` as DBT_INTERNAL_DEST
        using (

SELECT
    claim_id,
    status,
    COUNT(*) AS claim_count,
    SUM(claim_amount) AS total_claim_amount,
    AVG(claim_amount) AS avg_claim_amount
FROM
    `healthcare-data-project-442109`.`dev_healthcare_data`.`claims_data_external`
GROUP BY
    claim_id, status
        ) as DBT_INTERNAL_SOURCE
        on (
                DBT_INTERNAL_SOURCE.claim_id = DBT_INTERNAL_DEST.claim_id
            )

    
    when matched then update set
        `claim_id` = DBT_INTERNAL_SOURCE.`claim_id`,`status` = DBT_INTERNAL_SOURCE.`status`,`claim_count` = DBT_INTERNAL_SOURCE.`claim_count`,`total_claim_amount` = DBT_INTERNAL_SOURCE.`total_claim_amount`,`avg_claim_amount` = DBT_INTERNAL_SOURCE.`avg_claim_amount`
    

    when not matched then insert
        (`claim_id`, `status`, `claim_count`, `total_claim_amount`, `avg_claim_amount`)
    values
        (`claim_id`, `status`, `claim_count`, `total_claim_amount`, `avg_claim_amount`)


    