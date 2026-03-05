select
    annee,
    semestre,
    id_group_ligne,
    cat_jour,
    heure,
    pourc_validations
FROM {{ ref('stg_profil_surface_clean') }}