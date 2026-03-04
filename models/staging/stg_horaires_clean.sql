SELECT
    date,
    annee,
    mois,
    jour,
    jour_semaine,
    heure,
    tranche_horaire,
    SPLIT(ligne_id, ':')[SAFE_OFFSET(1)] AS id_ligne_clean,
    ligne_nom,
    type_transport,
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