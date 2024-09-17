/* Table: chats */
{{
    config(
        materialized='table'
    )
}}

-- depends_on: {{ ref('zendesk_pipeline1_dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'chats' */
    "session__browser",
    "session__city",
    "session__country_code",
    "session__country_name",
    "session__end_date",
    "session__id",
    "session__ip",
    "session__platform",
    "session__region",
    "session__start_date",
    "session__user_agent",
    "visitor__phone",
    "visitor__notes",
    "visitor__id",
    "visitor__name",
    "visitor__email",
    "unread",
    "message",
    "timestamp",
    "id",
    "deleted",
    "update_timestamp",
    "type",
    "_dlt_load_id",
    "_dlt_id",
FROM {{ source('raw_data', 'chats') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE "_dlt_load_id" IN ( SELECT "load_id" FROM  {{ ref('zendesk_pipeline1_dlt_active_load_ids') }} )