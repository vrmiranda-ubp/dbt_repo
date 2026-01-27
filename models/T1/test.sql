{{
    config(
        materialized="table",
        snowflake_warehouse='COMPUTE_WH'
    )
}}

select '{{ env_var('DBT_WH_ME', NULL) }}' as _audit_run_id