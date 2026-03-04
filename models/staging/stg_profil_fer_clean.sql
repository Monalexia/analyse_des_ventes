{{ config(
    materialized = 'table',
    schema = 'UrbanMove'
) }}

with source as (

    select *
    from {{ source('UrbanMove_raw', 'profil_fer') }}

),

cleaned as (

    select
        cast(annee as int64) as annee,
        cast(semestre as int64) as semestre,

        -- Colonnes STIF supprimées
        -- (on ne les garde pas dans le staging final)
        
        case
            when lower(trim(libelle_arret)) = 'inconnu' then null
            else trim(libelle_arret)
        end as libelle_arret,

        safe_cast(id_zdc as int64) as id_zdc,
        trim(cat_jour) as cat_jour,

        safe_cast(
            regexp_extract(trnc_horr_60, r'^(\d+)H')
            as int64
        ) as heure,

        cast(pourc_validations as float64) as pourc_validations

    from source
)

select
    annee,
    semestre,
    id_zdc,
    cat_jour,
    heure,
    pourc_validations
from cleaned