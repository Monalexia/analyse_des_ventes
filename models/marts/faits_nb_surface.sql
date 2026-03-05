SELECT
    nbs.date_jour,
    nbs.id_group_ligne,
    nbs.nb_validations,
    tt.id_titre
FROM {{ ref('stg_nb_surface_clean') }} nbs

LEFT JOIN {{ ref('dim_titres_transport') }} tt
ON nbs.nom_titre = tt.nom_titre