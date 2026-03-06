SELECT
    date AS date_jour,
    annee,
    mois,
    jour,
    TRIM(jour_semaine) AS jour_semaine,
    heure,
    TRIM(tranche_horaire) AS tranche_horaire,
    TRIM(SPLIT(ligne_id, ':')[SAFE_OFFSET(1)]) AS id_ligne,
    TRIM(ligne_nom) as nom_ligne,
    TRIM(LOWER(
        CASE
            WHEN TRIM(LOWER(type_transport)) = 'rer' THEN 'rail'
            WHEN TRIM(LOWER(type_transport)) = 'tramway' THEN 'tram'
            ELSE type_transport
        END
    )) AS mode_transport,
    frequence_theorique_par_heure,
    frequence_reelle_par_heure,
    taux_service_pct AS taux_service,
    retard_moyen_minutes,
    incident_detecte,
    incident_type,
    temperature,
    precipitation,
    neige,
    vent,
    meteo_defavorable 
FROM {{ source('UrbanMove_raw', 'horaires') }}