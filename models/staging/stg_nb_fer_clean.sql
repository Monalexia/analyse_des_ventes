SELECT
    JOUR AS date_jour,
    ID_ZDC AS id_zdc,
    TRIM(LOWER(CATEGORIE_TITRE)) AS categorie_titre,
    NB_VALD AS nb_validations
FROM {{ source('UrbanMove_raw', 'nb_fer') }}
WHERE ID_ZDC != 999999
