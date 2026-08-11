/* Categorical Data Profiling */

SELECT
country,
COUNT(*) AS total_customer
FROM db_customer
GROUP BY country
ORDER BY total_customer DESC;

SELECT
state,
COUNT(*) AS total
FROM db_customer
GROUP BY state
ORDER BY total DESC;

SELECT
gender,
COUNT(*) AS total
FROM db_customer
GROUP BY gender;

SELECT
plan_type,
COUNT(*) AS total
FROM db_subscription
GROUP BY plan_type;

SELECT
contract_type,
COUNT(*) AS total
FROM db_subscription
GROUP BY contract_type;

SELECT
subscription_type,
COUNT(*) AS total
FROM db_subscription
GROUP BY subscription_type;

SELECT
col_1,
COUNT(*) AS total
FROM db_support
GROUP BY col_1
ORDER BY total DESC;














