-- customer.sql
-- database="",
-- pre_hook="SQL-statement" | ["SQL-statement"],
-- post_hook="SQL-statement" | ["SQL-statement"],
-- static_analysis: on | unsafe | off
-- grants={'select': ['reporter', 'viewer']}  
-- full_refresh="",
{{
    config(
        materialized="incremental",
        unique_key='ID',
        tags="CRM",
        alias="NEW_TABLE_NAME",
        +docs:
            node_color: "#cd7f32",
        snowflake_warehouse='COMPUTE_WH'
    )
}}

with source_orders as (
    select *
    from {{ source('T1', 'customer') }}
)
SELECT * FROM source_orders