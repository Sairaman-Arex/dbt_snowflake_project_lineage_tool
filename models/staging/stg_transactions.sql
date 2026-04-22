{{ config(materialized='view') }}

select
    transaction_id,
    user_id,
    amount,
    transaction_date
from {{ source('raw', 'raw_transactions') }}