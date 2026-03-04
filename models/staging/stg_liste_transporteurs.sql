SELECT
    TRIM(nom_operateur) AS nom_operateur,
    id_operateur,
    logo_operateur AS logo

FROM {{ source('UrbanMove_raw', 'liste_transporteurs') }}
WHERE nom_operateur IS NOT NULL