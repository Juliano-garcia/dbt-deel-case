
    
    

with dbt_test__target as (

  select external_ref as unique_field
  from `dev-jgarcia-deel-case`.`globepay`.`mrt_transactions`
  where external_ref is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


