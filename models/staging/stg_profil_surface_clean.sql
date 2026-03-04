SELECT
    ANNEE AS annee,
    SEMESTRE AS semestre,
    trim(CAT_JOUR) AS cat_jour,
    CAST(SPLIT(TRNC_HORR_60, 'H-')[SAFE_OFFSET(0)] as INT64) as heure,
    TRIM(ID_GROUPOFLIGNE) as id_group_ligne ,
    pourc_validations
FROM {{ source('UrbanMove_raw', 'profil_surface') }}