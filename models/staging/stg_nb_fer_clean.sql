SELECT
    JOUR AS date_jour,
    ID_ZDC AS id_zdc,
    TRIM(LOWER(
        CASE
            WHEN TRIM(LOWER(CATEGORIE_TITRE)) IN ('forfait navigo', 'navigo') THEN 'navigo'
            WHEN TRIM(LOWER(CATEGORIE_TITRE)) IN ('autre titre', 'autres titres', '?') THEN 'autre titre'
            ELSE CATEGORIE_TITRE
        END
    )) AS nom_titre,
    NB_VALD AS nb_validations
FROM {{ source('UrbanMove_raw', 'nb_fer') }}
WHERE ID_ZDC != 999999
