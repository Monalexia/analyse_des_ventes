SELECT
    TRIM(id_ligne) AS id_ligne,
    TRIM(nom_ligne) AS nom_ligne,
    TRIM(mode_transport) AS mode_transport,
    TRIM(submode_transport) AS submode_transport,
    id_operateur,
    TRIM(nom_operateur) AS nom_operateur,
    TRIM(accessibilite) AS accessibilite,
    TRIM(signaux_sonores) AS signaux_sonores,
    TRIM(signaux_visuels) AS signaux_visuels,
    TRIM(id_groupoflines) AS id_group_ligne,
    TRIM(nom_groupoflines) AS nom_group_ligne,
    TRIM(air_conditionne) AS air_conditionne 
FROM {{ source('UrbanMove_raw', 'referentiel_des_lignes') }}
WHERE id_groupoflines IS NOT NULL