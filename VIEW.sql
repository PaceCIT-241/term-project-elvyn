USE produce_prices;

CREATE OR REPLACE VIEW vw_latest_prices AS
SELECT 
    p.product_id, 
    p.product_name, 
    c.category_name, 
    s.source_name, 
    pr.price_date, 
    pr.price_value, 
    pr.currency, 
    pf.form_name
FROM product p
JOIN category c ON p.category_id = c.category_id
JOIN source s ON p.source_id = s.source_id
JOIN price pr ON p.product_id = pr.product_id
JOIN product_form pf ON p.product_id = pf.product_id
WHERE pr.price_date = (
    SELECT MAX(price_date) 
    FROM price 
    WHERE product_id = p.product_id
);
SELECT * FROM vw_latest_prices
ORDER BY category_name, product_name
LIMIT 100;
