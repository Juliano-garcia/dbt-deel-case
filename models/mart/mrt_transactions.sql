{{
    config (
        materialized = "view"
    )
}}

WITH

acceptance_report as ( SELECT * FROM {{ ref('stg_acceptance_report') }} )

, chargeback_report as ( SELECT * FROM {{ ref('stg_chargeback_report') }} )

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

SELECT * FROM final