SELECT
    date_jour,
    annee,
    mois,
    jour,
    jour_semaine
FROM {{ ref('stg_horaires_clean')}}
GROUP BY date_jour, annee, mois, jour, jour_semaine