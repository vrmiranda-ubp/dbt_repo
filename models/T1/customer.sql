-- customer.sql
{{
    config(
        materialized="table",
        snowflake_warehouse='COMPUTE_WH'
    )
}}

with source_orders as (
    select *
    from {{ source('T1', 'customer') }}
)
SELECT * FROM source_orders