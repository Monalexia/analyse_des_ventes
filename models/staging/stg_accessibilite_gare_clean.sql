SELECT
    stop_point_id AS id_arret,
    accessibility_level_id AS id_niveau_accessibilite,
    TRIM(LOWER(accessibility_level_name)) AS nom_niveau_accessibilite

FROM {{ source('UrbanMove_raw', 'accessibilite_gare') }}
WHERE stop_point_id IS NOT NULL