

  create or replace view `dev-jgarcia-deel-case`.`globepay`.`mrt_transactions`
  OPTIONS()
  as 

WITH

acceptance_report as ( SELECT * FROM `dev-jgarcia-deel-case`.`globepay`.`stg_acceptance_report` )

, chargeback_report as ( SELECT * FROM `dev-jgarcia-deel-case`.`globepay`.`stg_chargeback_report` )

, final as (

    SELECT
        ar.external_ref
        , ar.status
        , ar.source
        , ar.ref
        , ar.date_time
        , ar.state
        , cr.chargeback
        , ar.cvv_provided
        , ar.country
        , ar.currency
        , ar.amount as amount_local_currency
        , ar.amount / FLOAT64(ar.rates[ar.currency]) as amount_usd
    FROM
        acceptance_report as ar
    LEFT JOIN
        chargeback_report as cr
        USING (external_ref)

)

SELECT * FROM final;

