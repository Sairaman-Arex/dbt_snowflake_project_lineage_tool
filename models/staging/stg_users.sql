{{ config(materialized='view') }}

select
    user_id,
    user_name,
    lower(email) as email,
    created_date
from {{ source('raw', 'raw_users') }}