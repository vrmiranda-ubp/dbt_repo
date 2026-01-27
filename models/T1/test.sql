{{
    config(
        materialized="table",
        snowflake_warehouse='COMPUTE_WH'
    )
}}

select {{ env_var('DBT_WH_ME', 1) }} as _audit_run_id