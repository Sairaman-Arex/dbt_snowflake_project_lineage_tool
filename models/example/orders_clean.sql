{{ config(materialized='table') }}

select
    order_id,
    customer_name,
    product,
    amount,

    case 
        when amount >= 50000 then 'Premium'
        when amount >= 10000 then 'High'
        when amount >= 3000 then 'Medium'
        else 'Low'
    end as category,

    order_date
from {{ ref('stg_orders') }}