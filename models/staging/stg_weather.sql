WITH raw_weather AS (
    SELECT * FROM {{ source('warehouse', 'hourly_weather') }}
)
SELECT
    CAST(timestamp AS TIMESTAMP) AS weather_timestamp,
    CAST(timestamp AS DATE) AS weather_date,
    CAST(temperature AS DECIMAL(5, 2)) AS temperature_celsius,
    CAST(humidity AS INT) AS relative_humidity,
    CAST(wind_speed AS DECIMAL(5, 2)) AS wind_speed_kmh,
    temp_category
FROM raw_weather