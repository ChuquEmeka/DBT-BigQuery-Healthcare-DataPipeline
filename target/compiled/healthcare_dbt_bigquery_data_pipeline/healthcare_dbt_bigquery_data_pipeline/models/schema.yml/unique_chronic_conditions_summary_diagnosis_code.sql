
    
    

with dbt_test__target as (

  select diagnosis_code as unique_field
  from `healthcare-data-project-442109`.`dev_healthcare_data`.`chronic_conditions_summary`
  where diagnosis_code is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


