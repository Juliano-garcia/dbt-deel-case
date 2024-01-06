
WITH

transactions as ( SELECT * FROM {{ ref('mrt_transactions') }} )

SELECT
    *
FROM
    transactions
WHERE chargeback IS NULL