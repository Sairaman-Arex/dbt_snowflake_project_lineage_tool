{{ config(materialized='view') }}

select
    payment_id,
    transaction_id,
    payment_type,
    payment_status
from {{ source('raw', 'raw_payments_log') }}