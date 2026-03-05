SELECT
    TRIM(SPLIT(ID, ':')[SAFE_OFFSET(1)]) AS id_ligne,
    CAST(TRIM(ARRAY_REVERSE(SPLIT(stop_id, ':'))[SAFE_OFFSET(0)])AS INT64) AS id_arret,
    TRIM(stop_name) AS nom_arret,
    stop_lon as longitude,
    stop_lat as latitude,
    TRIM(nom_commune) AS nom_commune,
    RIGHT(code_insee, 5) as code_insee,
    LEFT(RIGHT(code_insee, 5), 2) as id_departement
FROM {{ source('UrbanMove_raw', 'arrets_lignes') }}