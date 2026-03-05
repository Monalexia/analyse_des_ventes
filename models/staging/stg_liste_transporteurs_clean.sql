SELECT
    id_operateur,
    TRIM(nom_operateur) AS nom_operateur,

    CASE
        WHEN LOWER(TRIM(nom_operateur)) LIKE '%sncf%' THEN 'SNCF'
        WHEN LOWER(TRIM(nom_operateur)) LIKE '%ratp%' THEN 'RATP'
        WHEN LOWER(TRIM(nom_operateur)) LIKE '%keolis%' THEN 'Keolis'
        WHEN LOWER(TRIM(nom_operateur)) LIKE '%transdev%' THEN 'Transdev'
        WHEN LOWER(TRIM(nom_operateur)) LIKE '%savac%' THEN 'Lacroix-Savac'
        ELSE TRIM(nom_operateur)
    END AS groupe_operateur,


    logo_operateur AS logo

FROM {{ source('UrbanMove_raw', 'liste_transporteurs') }}
WHERE nom_operateur IS NOT NULL