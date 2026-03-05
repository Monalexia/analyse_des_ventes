SELECT
    date_jour,
    heure,
    tranche_horaire,
    id_ligne,
    frequence_theorique_par_heure,
    frequence_reelle_par_heure,
    taux_service,
    retard_moyen_minutes,
    incident_detecte,
    incident_type
FROM {{ ref('stg_horaires_clean') }}