{{
    config(
        materialized="incremental",
        tags=['test'],
        enabled=true,
        event_time='TEST',
        full_refresh = true,
        snowflake_warehouse='COMPUTE_WH'        
    )
}}

select *
from {{ source('T1', 'orders') }}
{% if is_incremental() %}
  -- dbt automatically adds the filter here
{% endif %}