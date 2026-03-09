WITH categorie_uniques AS (
    SELECT cat_jour
    FROM {{ ref('stg_profil_fer_clean')}}
    WHERE cat_jour IS NOT NULL
)

SELECT
    cat_jour,
    CASE
        WHEN cat_jour = 'DIJFP' THEN 'Dimanche et jours fériés'
        WHEN cat_jour = 'JOHV' THEN 'Jours ouvrés hors vacances'
        WHEN cat_jour = 'JOVS' THEN 'Jours ouvrés vacances'
        WHEN cat_jour = 'SAHV' THEN 'Samedi hors vacances'
        ELSE 'Samedi vacances'
    END AS description
FROM categorie_uniques
