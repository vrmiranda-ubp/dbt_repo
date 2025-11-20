    -- lineitem_summary.sql
    {{ config(materialized='view') }} -- or 'table' for a materialized table

    WITH summary AS (
        SELECT *
        FROM {{ source('T1', 'lineitem') }}
    )
    SELECT L_ORDERKEY
        , COUNT(*) AS LINE_COUNT
    FROM summary
    GROUP BY L_ORDERKEY