    -- customer_summary.sql
    {{ config(materialized='table') }} -- or 'table' for a materialized table

    WITH ord AS (
        SELECT *
        FROM {{ source('T1', 'orders') }} 
    ),
    cust AS (
        SELECT *
        FROM {{ source('T1', 'customer') }}
    )
    SELECT C_CUSTKEY
        , COUNT(DISTINCT ord.O_CUSTKEY) AS ORDER_COUNT
    FROM ord
    JOIN cust
    ON ord.O_CUSTKEY = cust.C_CUSTKEY
    GROUP BY C_CUSTKEY