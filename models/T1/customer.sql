-- customer.sql
{{
    config(
        materialized="incremental",
        snowflake_warehouse='COMPUTE_WH'
    )
}}

with source_orders as (
    select *
    from {{ source('T1', 'customer') }}
)
SELECT * FROM source_orders