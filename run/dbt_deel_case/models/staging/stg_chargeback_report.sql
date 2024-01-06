

  create or replace view `dev-jgarcia-deel-case`.`globepay`.`stg_chargeback_report`
  OPTIONS()
  as 

WITH

raw_table as ( SELECT * FROM `dev-jgarcia-deel-case`.`globepay`.`chargeback_report` )

, final as (

    SELECT
        external_ref
        , CAST(status as BOOL) as status
        , source
        , CAST(chargeback as BOOL) as chargeback
    FROM
        raw_table

)

SELECT * FROM final;

