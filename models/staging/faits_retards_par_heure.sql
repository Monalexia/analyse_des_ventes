SELECT
    h.date_jour,
    h.heure,
    l.mode_transport,
    SUM(h.retard_moyen_minutes) AS retard_moyen_minutes
FROM {{ ref('stg_horaires_clean') }} h
LEFT JOIN {{ ref('stg_referentiel_lignes_clean') }} l
    ON h.id_ligne = l.id_ligne
WHERE l.mode_transport IS NOT NULL
GROUP BY h.date_jour, h.heure, l.mode_transport