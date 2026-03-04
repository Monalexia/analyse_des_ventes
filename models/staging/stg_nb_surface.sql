{{ config(
    materialized = 'table',
    schema = 'UrbanMove'
) }}

with source as (

    select *
    from {{ source('UrbanMove_raw', 'nb_surface') }}

),

cleaned as (

    select
        -- date déjà au bon format
        JOUR as date_jour,

        -- identifiant group of lines
        trim(ID_GROUPOFLINES) as id_groupoflines,

        -- catégorie titre nettoyée
        trim(CATEGORIE_TITRE) as categorie_titre,

        -- nombre de validations
        cast(NB_VALD as int64) as nb_validations

    from source

    -- suppression des lignes ND / NON DEFINIE
    where CODE_STIF_TRNS != -1
      and upper(CODE_STIF_RES) != 'ND'
      and upper(CODE_STIF_LIGNE) != 'ND'
      and upper(LIBELLE_LIGNE) != 'LIGNE NON DEFINIE'
)

select
    date_jour,
    id_groupoflines,
    categorie_titre,
    nb_validations
from cleaned