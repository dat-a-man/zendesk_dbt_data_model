{{
    config(
        materialized='incremental'
    )
}}
-- depends_on: {{ ref('dim_zendesk_pipeline1___dlt_loads') }}
-- depends_on: {{ ref('dim_zendesk_pipeline1__chats') }}
/* we save all currently active load ids into the processed ids table */
select load_id, {{ current_timestamp() }} as inserted_at FROM {{ ref('zendesk_pipeline1_dlt_active_load_ids') }}