SELECT
    id_ligne,
    id_arret
FROM {{ ref('stg_arrets_lignes_clean') }}