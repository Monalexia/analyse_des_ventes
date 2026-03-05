select
    groupe_operateur,
    mode_transport,
    annee,
    resultat
from {{ ref('stg_indicateurs_perception_clean') }}