-- my_sample_model.sql
{{ config(materialized='table') }} -- or 'table' for a materialized table

with source_supplier as (
    select *
    from {{ source('T1', 'supplier') }}
)
SELECT * FROM source_supplier