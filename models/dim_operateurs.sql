select
    id_operateur,
    nom_operateur,
    groupe_operateur,
    logo
from {{ ref('stg_liste_transporteurs_clean') }}