    -- nation_summary.sql
    {{ config(materialized='view') }} -- or 'table' for a materialized table

    WITH summary AS (
        SELECT *
        FROM {{ source('T1', 'nation') }}
    )
    SELECT *
    FROM summary