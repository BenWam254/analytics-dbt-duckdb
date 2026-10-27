WITH raw_inventory AS (
    SELECT * FROM {{ source('warehouse', 'inventory_snapshot') }}
)
SELECT
    CAST(item_id AS BIGINT) AS product_id,
    TRIM(title) AS product_name,
    LOWER(TRIM(category)) AS category_name,
    CAST(price AS DECIMAL(10, 2)) AS unit_price,
    CAST(stock AS INT) AS current_stock_level,
    row_hash
FROM raw_inventory