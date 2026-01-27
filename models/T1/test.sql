{{
    config(
        materialized="table",
        snowflake_warehouse='COMPUTE_WH'
    )
}}

select env_var("env_attrib") as _audit_run_id