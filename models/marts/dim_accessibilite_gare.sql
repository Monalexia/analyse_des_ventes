SELECT
    id_niveau_accessibilite,
    CASE
        WHEN id_niveau_accessibilite = 1 THEN 'non accessible'
        WHEN id_niveau_accessibilite = 4 THEN 'sur demande'
        WHEN id_niveau_accessibilite = 3 THEN 'sur réservation'
        ELSE 'accessible'
    END AS nom_niveau_accessibilite
FROM {{ ref('stg_accessibilite_gare_clean')}}
GROUP BY id_niveau_accessibilite, nom_niveau_accessibilite