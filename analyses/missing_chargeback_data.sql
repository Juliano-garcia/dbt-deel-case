
WITH

acceptance_report as ( SELECT * FROM {{ ref('stg_acceptance_report') }} )

, chargeback_report as ( SELECT * FROM {{ ref('stg_chargeback_report') }} )

SELECT
    ar.*
    , cr.chargeback
FROM
    acceptance_report as ar
LEFT JOIN
    chargeback_report as cr
    USING (external_ref)
WHERE cr.chargeback IS NULL