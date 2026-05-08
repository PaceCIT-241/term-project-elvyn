-- ============================================================
-- 1. DATABASE SETUP
-- ============================================================
CREATE DATABASE IF NOT EXISTS produce_prices;
USE produce_prices;

-- 1. SOURCE TABLE
CREATE TABLE IF NOT EXISTS category (
    category_id   INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    description   TEXT
);
-- 2. CATEGORY TABLE
CREATE TABLE IF NOT EXISTS category (
    category_id   INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    description   TEXT
);

-- 3. PRODUCT TABLE
CREATE TABLE IF NOT EXISTS product (
    product_id   INT AUTO_INCREMENT PRIMARY KEY,
    category_id  INT NOT NULL,
    source_id    INT,
    product_name VARCHAR(200) NOT NULL,
    unit         VARCHAR(50),
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES category(category_id),
    FOREIGN KEY (source_id) REFERENCES source(source_id)
);

-- 4. PRODUCT FORM TABLE
CREATE TABLE IF NOT EXISTS product_form (
    form_id     INT AUTO_INCREMENT PRIMARY KEY,
    product_id  INT NOT NULL,
    form_name   VARCHAR(100) NOT NULL,
    description TEXT,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- 5. PRICE TABLE
CREATE TABLE IF NOT EXISTS price (
    price_id    INT AUTO_INCREMENT PRIMARY KEY,
    product_id  INT NOT NULL,
    price_date  DATE NOT NULL,
    price_value NUMERIC(12,4) NOT NULL,
    currency    CHAR(3) NOT NULL DEFAULT 'USD',
    price_type  VARCHAR(100),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);
-- 6. YIELD TABLE
CREATE TABLE IF NOT EXISTS yield (
    yield_id    INT AUTO_INCREMENT PRIMARY KEY,
    price_id    INT NOT NULL,
    yield_value NUMERIC(10,6) NOT NULL,
    yield_unit  VARCHAR(50),
    calc_method VARCHAR(100),
    FOREIGN KEY (price_id) REFERENCES price(price_id)
);