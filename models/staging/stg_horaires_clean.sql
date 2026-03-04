SELECT
    date,
    annee,
    mois,
    jour,
    trim(jour_semaine) AS jour_semaine,
    heure,
    trim(tranche_horaire) AS tranche_horaire,
    trim(split(ligne_id, ':')[safe_offset(1)]) AS id_ligne,
    trim(ligne_nom) as ligne_nom,
    trim(type_transport) AS type_transport,
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