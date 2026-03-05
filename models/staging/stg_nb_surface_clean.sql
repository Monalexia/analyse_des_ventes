with source as (

    select *
    from {{ source('UrbanMove_raw', 'nb_surface') }}

),

cleaned as (

    select
        -- date déjà au bon format
        JOUR as date_jour,

        -- identifiant group of lines
        trim(ID_GROUPOFLINES) as id_group_ligne,

        -- catégorie titre nettoyée
        TRIM(LOWER(
            CASE
                WHEN TRIM(LOWER(CATEGORIE_TITRE)) IN ('forfait navigo', 'navigo') THEN 'navigo'
                WHEN TRIM(LOWER(CATEGORIE_TITRE)) IN ('autre titre', 'autres titres', '?') THEN 'autre titre'
                ELSE CATEGORIE_TITRE
            END
        )) AS nom_titre,

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
    id_group_ligne,
    nom_titre,
    nb_validations
from cleaned