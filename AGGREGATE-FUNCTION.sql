--AGGREGATE FUNCTION
-- ============================================================
 
SELECT
    p.product_name,
    c.category_name,
    pr.price_date,
    pr.price_value,
    pr.currency
FROM product p
JOIN category c  ON p.category_id = c.category_id
JOIN price    pr ON p.product_id  = pr.product_id
ORDER BY pr.price_date DESC
LIMIT 100;
