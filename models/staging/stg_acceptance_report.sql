{{
    config (
        materialized = "view"
    )
}}

WITH

raw_table as ( SELECT * FROM {{ source('globepay_reports','acceptance_report') }} )

, final as (

    SELECT
        external_ref
        , CAST(status as BOOL) as status
        , source
        , ref
        , DATETIME(PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%E*S%Ez', date_time)) as date_time
        , state
        , CAST(cvv_provided as BOOL) as cvv_provided
        , CAST(amount as FLOAT64) as amount
        , country
        , currency
        , PARSE_JSON(rates, wide_number_mode=>'round') as rates
    FROM
        raw_table

)

SELECT * FROM final