{{ config(materialized='view') }}

select
    customer_id,
    customer_name,
    city
from {{ source('raw_public', 'raw_customers') }}