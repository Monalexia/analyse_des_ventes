SELECT
    JOUR,
    ID_ZDC,
    CATEGORIE_TITRE,
    NB_VALD
FROM {{ source('UrbanMove_raw', 'nb_fer') }}
WHERE ID_ZDC != 999999
