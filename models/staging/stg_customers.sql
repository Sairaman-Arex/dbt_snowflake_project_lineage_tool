{{ config(materialized='view') }}

SELECT
    customer_id,
    customer_name,
    city
FROM LINEAGE.PUBLIC.raw_customers