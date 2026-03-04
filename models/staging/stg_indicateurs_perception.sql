SELECT
    TRIM(operatorname) AS id_operateur,
    TRIM(mode) AS mode,
    annee,
    resultat

FROM {{ source('UrbanMove_raw', 'indicateurs_perception') }}
WHERE operatorname IS NOT NULL