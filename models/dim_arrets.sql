with arrets_lignes as (
    select *
    from {{ ref('stg_arrets_lignes_clean') }}
),
stops as (
    select *
    from {{ ref('stg_stops_clean') }}
)

select
    a.id_stop as id_arret,
    a.nom_stop as nom_arret,
    s.level_id as level_accessibilite,
    a.stop_lon as longitude,
    a.stop_lat as latitude,
    a.id_departement as departement,
    a.nom_commune as commune,
    a.code_insee
from arrets_lignes a
left join stops s
    on a.id_stop = s.id_stop