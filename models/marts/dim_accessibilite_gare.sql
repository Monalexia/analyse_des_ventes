SELECT
    id_niveau_accessibilite,
    nom_niveau_accessibilite
FROM {{ ref('stg_accessibilite_gare_clean')}}
GROUP BY id_niveau_accessibilite, nom_niveau_accessibilite