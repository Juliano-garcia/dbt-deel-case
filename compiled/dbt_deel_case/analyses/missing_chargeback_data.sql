WITH

transactions as ( SELECT * FROM `dev-jgarcia-deel-case`.`globepay`.`mrt_transactions` )

SELECT
    *
FROM
    transactions
WHERE chargeback IS NULL