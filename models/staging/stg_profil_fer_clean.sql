with source as (

    select *
    from {{ source('UrbanMove_raw', 'profil_fer') }}

),

cleaned as (

    select
        cast(annee as int64) as annee,
        cast(semestre as int64) as semestre,

        -- Colonnes STIF (seront supprimées dans la table finale)
        nullif(trim(cast(code_stif_trns as string)), '') as code_stif_trns,
        nullif(trim(cast(code_stif_res as string)), '') as code_stif_res,
        nullif(trim(cast(code_stif_arret as string)), '') as code_stif_arret,

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

        cast(pourc_validations as float64) as pourcentage_validation

    from source
)

select *
from cleaned