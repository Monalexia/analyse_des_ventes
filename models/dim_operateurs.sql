select
    id_operateur,
    nom_operateur,
    logo
from {{ ref('stg_liste_transporteurs') }}