WITH titres_uniques AS (
    SELECT DISTINCT nom_titre
    FROM {{ ref('stg_nb_fer_clean') }}
    WHERE nom_titre IS NOT NULL
)

SELECT
    ROW_NUMBER() OVER (ORDER BY nom_titre) AS id_titre,
    nom_titre,
    CASE
        WHEN nom_titre IN ('amethyste', 'contrat solidarité transport', 'tst', 'fgt') THEN 'Tarifs sociaux'
        WHEN nom_titre IN ('imagine r', 'navigo') THEN 'Usagers réguliers'
        WHEN nom_titre IN ('forfaits courts', 'navigo jour') THEN 'Usagers occasionnels'
        ELSE 'Autres titres'
    END AS categorie_titre

FROM titres_uniques