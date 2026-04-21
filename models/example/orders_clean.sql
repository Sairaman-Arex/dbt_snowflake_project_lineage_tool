{{ config(materialized='table') }}

SELECT
    order_id,
    customer_name,
    product,
    amount,

    CASE 
        WHEN amount >= 50000 THEN 'Premium'
        WHEN amount >= 10000 THEN 'High'
        WHEN amount >= 3000 THEN 'Medium'
        ELSE 'Low'
    END AS category,

    order_date
FROM LINEAGE.PUBLIC.raw_orders

