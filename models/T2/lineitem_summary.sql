    -- order_summary.sql
    {{ config(materialized='view') }} -- or 'table' for a materialized table

    WITH summary AS (
        SELECT *
        FROM {{ source('T1', 'orders') }}
    )
    SELECT O_CUSTKEY
        , SUM(O_TOTALPRICE) AS TOTAL_PRICE
    FROM summary
    GROUP BY O_CUSTKEY