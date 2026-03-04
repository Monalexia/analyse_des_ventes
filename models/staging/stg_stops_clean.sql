SELECT
    ARRAY_REVERSE(SPLIT(stop_id, ':'))[SAFE_OFFSET(0)] AS stop_id_clean,
    stop_code,
    stop_name,
    stop_desc,
    stop_lon,
    stop_lat,
    zone_id,
    stop_url,
    location_type,
    SPLIT(parent_station, ':')[SAFE_OFFSET(1)] AS id_zdc_clean,
    stop_timezone,
    level_id,
    wheelchair_boarding,
    platform_code
FROM {{ source('UrbanMove_raw', 'stops') }}
WHERE parent_station IS NOT NULL