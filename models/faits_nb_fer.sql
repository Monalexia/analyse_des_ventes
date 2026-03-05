SELECT
    nbf.date_jour,
    nbf.id_zdc,
    nbf.nb_validations,
    tt.id_titre
FROM {{ ref('stg_nb_fer_clean') }} nbf

LEFT JOIN {{ ref('dim_titres_transport') }} tt
ON nbf.nom_titre = tt.nom_titre