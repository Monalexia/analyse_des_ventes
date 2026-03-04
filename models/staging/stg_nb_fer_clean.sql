SELECT
    JOUR as date_jour,
    ID_ZDC as id_zdc,
    trim(CATEGORIE_TITRE) as categorie_titre,
    NB_VALD as nb_vald
FROM {{ source('UrbanMove_raw', 'nb_fer') }}
WHERE ID_ZDC != 999999
