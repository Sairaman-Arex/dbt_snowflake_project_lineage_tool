{{ config(materialized='table') }}

SELECT
    o.order_id,
    o.customer_name,
    c.city,
    o.product,
    o.amount,

    CASE 
        WHEN o.amount >= 50000 THEN 'Premium'
        WHEN o.amount >= 10000 THEN 'High'
        WHEN o.amount >= 3000 THEN 'Medium'
        ELSE 'Low'
    END AS category,

    o.order_date

FROM {{ ref('stg_orders') }} o
LEFT JOIN {{ ref('stg_customers') }} c
    ON o.customer_name = c.customer_name