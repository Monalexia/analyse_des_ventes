SELECT
    date_jour,
    heure,
    temperature,
    precipitation,
    neige,
    vent,
    meteo_defavorable
FROM {{ ref('stg_horaires_clean')}}
GROUP BY date_jour, heure, temperature, precipitation, neige, vent, meteo_defavorable