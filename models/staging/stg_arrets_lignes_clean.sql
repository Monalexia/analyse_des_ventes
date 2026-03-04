SELECT
    TRIM(SPLIT(ID, ':')[SAFE_OFFSET(1)]) AS id_ligne,
    TRIM(ARRAY_REVERSE(SPLIT(stop_id, ':'))[SAFE_OFFSET(0)]) AS id_stop,
    TRIM(stop_name) AS stop_name,
    stop_lon,
    stop_lat,
    TRIM(nom_commune) AS nom_commune,
    code_insee
FROM {{ source('UrbanMove_raw', 'arrets_lignes') }}