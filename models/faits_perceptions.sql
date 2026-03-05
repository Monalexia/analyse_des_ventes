select
    groupe_operateur,
    mode,
    annee,
    resultat
from {{ ref('stg_indicateurs_perception_clean') }}