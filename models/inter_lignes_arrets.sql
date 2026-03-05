SELECT
    id_ligne,
    id_stop
FROM {{ ref('stg_arrets_lignes_clean') }}