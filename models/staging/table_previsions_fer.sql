SELECT
    h.date_jour,
    h.id_ligne,
    h.mode_transport,
    h.precipitation,
    h.vent,
    h.neige,
    h.temperature,
    h.meteo_defavorable,
    AVG(h.taux_service) AS taux_service,
    SUM(h.retard_moyen_minutes) AS retard_moyen_minutes,
    SUM(
        CASE
            WHEN h.incident_detecte = true THEN 1
            ELSE 0
        END
    ) AS nombre_incidents,
    l.accessibilite,
    l.air_conditionne
FROM {{ ref('stg_horaires_clean')}} h
LEFT JOIN {{ ref('stg_referentiel_lignes_clean')}} l
    ON h.id_ligne = l.id_ligne
WHERE h.mode_transport IN ('rail', 'metro')
GROUP BY h.date_jour, h.id_ligne, h.mode_transport, h.precipitation, h.vent, h.neige, h.temperature, h.meteo_defavorable,
    l.accessibilite, l.air_conditionne