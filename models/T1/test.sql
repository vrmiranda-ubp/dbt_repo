{{
    config(
        materialized="table",
        snowflake_warehouse='COMPUTE_WH'
    )
}}

select {{ env_var('YOUR_VARIABLE_NAME', 1) }} as _audit_run_id