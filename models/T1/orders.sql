-- my_sample_model.sql
{{ config(materialized='table') }} -- or 'table' for a materialized table

with source_orders as (
    select *
    from {{ source('T1', 'orders') }}
)
SELECT * FROM source_orders