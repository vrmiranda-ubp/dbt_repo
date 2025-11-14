-- my_sample_model.sql
{{ config(materialized='view') }} -- or 'table' for a materialized table

with source_orders as (
    select *
    from {{ source('T1', 'customer') }}
)
SELECT * FROM source_orders