SELECT
    id_ligne,
    id_operateur
FROM {{ ref('stg_referentiel_lignes_clean') }}