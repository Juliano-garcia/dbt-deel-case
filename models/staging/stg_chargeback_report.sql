{{
    config (
        materialized = "view"
    )
}}

WITH

raw_table as ( SELECT * FROM {{ source('globepay_reports','chargeback_report') }} )

, final as (

    SELECT
        external_ref
        , CAST(status as BOOL) as status
        , source
        , CAST(chargeback as BOOL) as chargeback
    FROM
        raw_table

)

SELECT * FROM final