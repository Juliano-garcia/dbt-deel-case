WITH

transactions as ( SELECT * FROM {{ ref('mrt_transactions') }} )

SELECT
    DATE(date_time) as date
    , COUNTIF(state = 'ACCEPTED') / COUNT(*) as acceptance_rate
FROM
    transactions
GROUP BY 1
ORDER BY 1 ASC