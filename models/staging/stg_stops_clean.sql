SELECT
    SAFE_CAST(TRIM(ARRAY_REVERSE(SPLIT(stop_id, ':'))[SAFE_OFFSET(0)])AS INT64) AS id_stop,
    SAFE_CAST(TRIM(SPLIT(parent_station, ':')[SAFE_OFFSET(1)])AS INT64) AS id_zdc
FROM {{ source('UrbanMove_raw', 'stops') }}
WHERE parent_station IS NOT NULL