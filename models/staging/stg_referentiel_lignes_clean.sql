SELECT
    trim(id_ligne) AS id_ligne,
    trim(nom_ligne) AS nom_ligne,
    trim(mode_transport) AS mode_transport,
    trim(submode_transport) AS submode_transport,
    trim(nom_operateur) AS nom_operateur,
    trim(accessibilite) AS accessibilite,
    trim(signaux_sonores) AS signaux_sonores,
    trim(signaux_visuels) AS signaux_visuels,
    trim(id_groupoflines) AS id_groupoflines,
    trim(nom_groupoflines) AS nom_groupoflines,
    trim(air_conditionne) AS air_conditionne 
FROM {{ source('UrbanMove_raw', 'referentiel_des_lignes') }}
WHERE id_groupoflines IS NOT NULL