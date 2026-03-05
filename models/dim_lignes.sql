SELECT
    id_ligne,
    nom_ligne,
    id_group_ligne,
    mode_transport,
    submode_transport,
    nom_operateur,
    accessibilite,
    signaux_sonores,
    signaux_visuels,
    air_conditionne   
FROM  {{ref ('stg_referentiel_lignes_clean')}}