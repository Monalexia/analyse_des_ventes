select
    annee,
    semestre,
    id_zdc,
    cat_jour,
    heure,
    pourcentage_validation
from {{ ref('stg_profil_fer_clean') }}