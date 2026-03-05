with arrets_lignes as (
    select *
    from {{ ref('stg_arrets_lignes_clean') }}
),
stops as (
    select *
    from {{ ref('stg_stops_clean') }}
),
accessibilite_gare as (
    SELECT *
    FROM {{ ref('stg_accessibilite_gare_clean') }}
)

select
    a.id_arret,
    a.nom_arret,
    ag.id_niveau_accessibilite,
    a.longitude,
    a.latitude,
    a.id_departement,
    a.nom_commune,
    a.code_insee
from arrets_lignes a
left join stops s
    on a.id_arret = s.id_arret
left join accessibilite_gare ag
    on a.id_arret = ag.id_arret
group by a.id_arret, a.nom_arret, ag.id_niveau_accessibilite, a.longitude, a.latitude, a.id_departement, a.nom_commune, a.code_insee