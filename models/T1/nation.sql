-- nation.sql
{{ config(materialized='table') }} -- or 'table' for a materialized table

with source_nation as (
    select *
    from {{ source('T1', 'nation') }}
)
SELECT * FROM source_nation