WITH validations_surface AS (
    SELECT
        date_jour,
        id_group_ligne,
        SUM(nb_validations) AS nb_validations
    FROM {{ ref('stg_nb_surface_clean')}}
    GROUP BY date_jour, id_group_ligne
)

SELECT
    h.date_jour,
    h.mois,
    h.jour_semaine,
    h.id_ligne,
    h.mode_transport,
    h.precipitation,
    h.vent,
    h.neige,
    h.temperature,
    h.meteo_defavorable,
    SUM(h.retard_moyen_minutes) AS retard_moyen_minutes,    
    s.nb_validations,
    l.accessibilite,
    l.air_conditionne
FROM {{ ref('stg_horaires_clean')}} h
LEFT JOIN {{ ref('stg_referentiel_lignes_clean')}} l
    ON h.id_ligne = l.id_ligne
LEFT JOIN validations_surface s
    ON l.id_group_ligne = s.id_group_ligne
    AND h.date_jour = s.date_jour
WHERE h.mode_transport IN ('bus', 'tram') AND s.nb_validations IS NOT NULL
GROUP BY h.date_jour, h.mois, h.jour_semaine, h.id_ligne, h.mode_transport, h.precipitation, h.vent, h.neige, h.temperature, h.meteo_defavorable,
    s.nb_validations, l.accessibilite, l.air_conditionne