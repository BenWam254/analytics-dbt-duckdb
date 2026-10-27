WITH staging AS (
    SELECT * FROM {{ ref('stg_inventory') }}
)
SELECT
    product_id,
    product_name,
    category_name,
    unit_price,
    current_stock_level,
    CASE
        WHEN current_stock_level = 0 THEN 'Out of Stock'
        WHEN current_stock_level < 15 THEN 'Low Stock'
        ELSE 'In Stock'
    END AS inventory_status
FROM staging