-- lineitem.sql
{{ config(materialized='table') }} -- or 'table' for a materialized table

with source_lineitem as (
    select *
    from {{ source('T1', 'lineitem') }}
)
SELECT * FROM source_lineitem