{{ config(materialized='view') }}

select
    t.transaction_id,
    t.user_id,
    u.user_name,
    t.amount,
    p.payment_type,
    p.payment_status
from {{ ref('stg_transactions') }} t
left join {{ ref('stg_users') }} u
    on t.user_id = u.user_id
left join {{ ref('stg_payments_log') }} p
    on t.transaction_id = p.transaction_id