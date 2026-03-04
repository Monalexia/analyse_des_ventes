SELECT
    ARRAY_REVERSE(SPLIT(stop_id, ':'))[SAFE_OFFSET(0)] AS stop_id_clean,
    SPLIT(parent_station, ':')[SAFE_OFFSET(1)] AS id_zdc_clean
FROM {{ source('UrbanMove_raw', 'stops') }}
WHERE parent_station IS NOT NULL