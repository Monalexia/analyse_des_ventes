SELECT
    h.date_jour,
    h.id_ligne,
    SUM(h.frequence_theorique_par_heure) AS frequence_theorique_par_jour,
    SUM(h.frequence_reelle_par_heure) AS frequence_reelle_par_jour,
    AVG(h.taux_service) AS taux_service,
    SUM(h.retard_moyen_minutes) AS retard_moyen_minutes,
    SUM(
        CASE
            WHEN h.incident_detecte = true THEN 1
            ELSE 0
        END
    ) AS nombre_incidents,
    h.temperature,
    m.temperature_max,
    m.temperature_min,
    h.precipitation,
    h.neige,
    h.vent,
    h.meteo_defavorable
FROM {{ ref('stg_horaires_clean') }} h
LEFT JOIN {{ ref('stg_meteo_paris_clean')}} m
    ON h.date_jour = m.date_jour
WHERE h.date_jour < '2024-10-01'
GROUP BY h.date_jour, h.id_ligne,
    h.temperature, m.temperature_max, m.temperature_min, h.precipitation, h.neige, h.vent, h.meteo_defavorable