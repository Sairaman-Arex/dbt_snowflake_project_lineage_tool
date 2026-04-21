{{ config(materialized='view') }}

SELECT
    order_id,
    customer_name,
    product,
    amount,
    order_date
FROM LINEAGE.PUBLIC.raw_orders