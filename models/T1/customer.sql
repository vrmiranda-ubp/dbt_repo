-- customer.sql
-- database="",

-- pre-hook="",
-- post-hook="",
-- static_analysis: on | unsafe | off
-- grants={'select': ['reporter', 'viewer']}  
-- full_refresh="",
{{
    config(
        materialized="incremental",
        unique_key='ID',
        tags="CRM",
        alias="ALIAS_TEST",
        snowflake_warehouse='COMPUTE_WH'
    )
}}

with source_orders as (
    select *
    from {{ source('T1', 'customer') }}
)
SELECT * FROM source_orders