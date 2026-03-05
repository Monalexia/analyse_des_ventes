SELECT
    CASE
        WHEN LOWER(TRIM(operatorname)) = 'ratp cap idf' THEN 'RATP'
        ELSE TRIM(operatorname)
    END AS groupe_operateur,

    TRIM(mode) AS mode_transport,
    annee,
    resultat

FROM {{ source('UrbanMove_raw', 'indicateurs_perception') }}
WHERE operatorname IS NOT NULL