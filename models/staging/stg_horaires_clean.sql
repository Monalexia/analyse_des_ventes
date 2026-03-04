SELECT
    date,
    annee,
    mois,
    jour,
    TRIM(jour_semaine) AS jour_semaine,
    heure,
    TRIM(tranche_horaire) AS tranche_horaire,
    TRIM(SPLIT(ligne_id, ':')[SAFE_OFFSET(1)]) AS id_ligne,
    TRIM(ligne_nom) as ligne_nom,
    TRIM(type_transport) AS type_transport,
    frequence_theorique_par_heure,
    frequence_reelle_par_heure,
    taux_service_pct
    retard_moyen_minutes,
    incident_detecte,
    incident_type,
    temperature,
    precipitation,
    neige,
    vent,
    meteo_defavorable 
FROM {{ source('UrbanMove_raw', 'horaires') }}