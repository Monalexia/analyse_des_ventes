SELECT
    date_jour,
    temperature,
    precipitation,
    neige,
    vent,
    meteo_defavorable
FROM {{ ref('stg_horaires_clean')}}
GROUP BY date_jour, temperature, precipitation, neige, vent, meteo_defavorable