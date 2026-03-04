SELECT * FROM {{ source('UrbanMove_raw', 'referentiel_des_lignes') }}
WHERE id_groupoflines IS NOT NULL