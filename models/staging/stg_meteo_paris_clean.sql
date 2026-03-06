SELECT
    time AS date_jour,
    temperature_2m_max AS temperature_max,
    temperature_2m_min AS temperature_min
FROM {{ source('UrbanMove_raw', 'meteo_paris') }}