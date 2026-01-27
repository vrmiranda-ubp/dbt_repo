{{
    config(
        materialized="incremental",
        snowflake_warehouse='COMPUTE_WH'
    )
}}

select 
    -- Inject the run id if present, otherwise use "manual"
    env_var("env_attrib") as _audit_run_id