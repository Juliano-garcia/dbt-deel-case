WITH

transactions as ( SELECT * FROM {{ ref('mrt_transactions') }} )

SELECT
    country
    , SUM(IF(state = "DECLINED", amount_usd, 0)) as amount_usd
FROM
    transactions
GROUP BY 1
HAVING amount_usd > 25000000
ORDER BY 2 DESC