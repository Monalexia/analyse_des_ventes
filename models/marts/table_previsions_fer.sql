SELECT
    h.date_jour,
    h.annee,
    h.mois,
    h.jour,
    h.jour_semaine,
    h.id_ligne,
    h.mode_transport,
    h.precipitation,
    h.vent,
    h.neige,
    h.temperature,
    h.meteo_defavorable,
    SUM(h.retard_moyen_minutes) AS retard_moyen_minutes,
    l.accessibilite,
    l.air_conditionne
FROM {{ ref('stg_horaires_clean')}} h
LEFT JOIN {{ ref('stg_referentiel_lignes_clean')}} l
    ON h.id_ligne = l.id_ligne
WHERE h.mode_transport IN ('rail', 'metro')
GROUP BY h.date_jour, h.annee, h.mois, h.jour, h.jour_semaine, h.id_ligne, h.mode_transport, h.precipitation, h.vent, h.neige, h.temperature, h.meteo_defavorable,
    l.accessibilite, l.air_conditionne