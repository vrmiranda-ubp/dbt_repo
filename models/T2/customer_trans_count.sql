    -- customer_summary.sql
    {{ config(materialized='view') }} -- or 'table' for a materialized table

    WITH ord AS (
        SELECT *
        FROM {{ source('T1', 'orders') }} 
    ),
    cust AS (
        SELECT *
        FROM {{ source('T1', 'customer') }}
    )
    SELECT C_NAME, C_CUSTKEY
        , COUNT(DISTINCT O_ORDERKEY) AS TRAN_COUNT
    FROM ord
    JOIN cust
    ON ord.O_CUSTKEY = cust.C_CUSTKEY
    GROUP BY C_NAME, C_CUSTKEY