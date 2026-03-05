select
    annee,
    semestre,
    id_group_ligne,
    cat_jour,
    heure,
    pourcentage_validation
FROM {{ ref('stg_profil_surface_clean') }}