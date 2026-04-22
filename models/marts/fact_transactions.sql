{{ config(materialized='table') }}

select
    transaction_id,
    user_id,
    user_name,
    amount,
    payment_type,
    payment_status,

    case 
        when payment_status = 'SUCCESS' then 'COMPLETED'
        else 'FAILED'
    end as final_status

from {{ ref('int_transactions_summary') }}