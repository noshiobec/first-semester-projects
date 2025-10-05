-- SQL script to create necessary tables

CREATE TABLE IF NOT EXISTS customers (
    customer_id  SERIAL PRIMARY KEY,
    name         VARCHAR(120) NOT NULL,
    email        VARCHAR(120) UNIQUE,
    join_date    DATE NOT NULL DEFAULT CURRENT_DATE );

CREATE TABLE IF NOT EXISTS products (
    product_id    SERIAL PRIMARY KEY,
    product_name  VARCHAR(120) NOT NULL,
    category      VARCHAR(120),
    price         NUMERIC(10,2) NOT NULL );

CREATE TABLE IF NOT EXISTS orders (
    order_id    SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customers(customer_id),
    product_id  INT NOT NULL REFERENCES products(product_id),
    quantity    INT NOT NULL CHECK (quantity > 0),
    order_date  DATE NOT NULL );
