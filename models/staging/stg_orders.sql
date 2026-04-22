{{ config(materialized='view') }}

select
    order_id,
    customer_name,
    product,
    amount,
    order_date
from {{ source('raw_public', 'raw_orders') }}