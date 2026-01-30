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
        alias="NEW_TABLE_NAME",
        tags=['crm'],
        docs={'node_color': 'red'},
        enabled=true,
        event_time='session_start_time',
        full_refresh = true,
        snowflake_warehouse='COMPUTE_WH'        
    )
}}

with source_orders as (
    select *
    from {{ source('T1', 'customer') }}
)
SELECT * FROM source_orders