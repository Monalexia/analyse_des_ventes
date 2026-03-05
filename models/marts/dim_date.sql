SELECT
    date_jour,
    annee,
    CASE
        WHEN EXTRACT(MONTH FROM date_jour) <= 6 THEN 1
        ELSE 2
    END AS semestre,
    mois,
    jour,
    jour_semaine
FROM {{ ref('stg_horaires_clean')}}
GROUP BY date_jour, annee, mois, jour, jour_semaine