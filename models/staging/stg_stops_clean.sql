SELECT
    safe_cast(trim(array_reverse(split(stop_id, ':'))[safe_offset(0)])AS int) AS stop_id,
    safe_cast(trim(split(parent_station, ':')[safe_offset(1)])AS int) AS id_zdc
FROM {{ source('UrbanMove_raw', 'stops') }}
WHERE parent_station IS NOT NULL