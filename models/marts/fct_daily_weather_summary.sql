WITH staging AS (
    SELECT * FROM {{ ref('stg_weather') }}
)
SELECT
    weather_date,
    ROUND(AVG(temperature_celsius), 2) AS avg_daily_temp,
    MAX(temperature_celsius) AS max_daily_temp,
    MIN(temperature_celsius) AS min_daily_temp,
    ROUND(AVG(relative_humidity), 2) AS avg_daily_humidity,
    ROUND(AVG(wind_speed_kmh), 2) AS avg_daily_wind_speed,
    COUNT(*) AS total_hourly_readings
FROM staging
GROUP BY 1