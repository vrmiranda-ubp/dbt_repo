-- customer.sql
-- database="",
-- alias="",
-- tags="",
-- pre-hook="",
-- post-hook="",

-- grants={'select': ['reporter', 'viewer']}  
-- full_refresh="",
{{
    config(
        materialized="incremental",
        unique_key='C_CUSTKEY',
        snowflake_warehouse='COMPUTE_WH'
    )
}}

with source_orders as (
    select *
    from {{ source('T1', 'customer') }}
)
SELECT * FROM source_orders