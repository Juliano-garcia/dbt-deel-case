select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select ref
from `dev-jgarcia-deel-case`.`globepay`.`stg_acceptance_report`
where ref is null



      
    ) dbt_internal_test