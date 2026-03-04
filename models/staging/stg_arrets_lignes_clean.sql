SELECT
    SPLIT(ID, ':')[SAFE_OFFSET(1)] AS id_ligne_clean,
    ARRAY_REVERSE(SPLIT(stop_id, ':'))[SAFE_OFFSET(0)] AS stop_id_clean,
    stop_name,
    stop_lon,
    stop_lat,
    nom_commune,
    code_insee
FROM {{ source('UrbanMove_raw', 'arrets_lignes') }}