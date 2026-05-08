--Category_names
-- ============================================================
 
SELECT
    c.category_name,
    COUNT(DISTINCT p.product_id)  AS product_count,
    ROUND(AVG(pr.price_value), 4) AS avg_price,
    MIN(pr.price_value)           AS min_price,
    MAX(pr.price_value)           AS max_price
FROM category c
JOIN product p  ON c.category_id = p.category_id
JOIN price   pr ON p.product_id  = pr.product_id
GROUP BY c.category_name
ORDER BY avg_price DESC;
