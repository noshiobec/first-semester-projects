-- SQL queries for retrieving insights

-- Basic Queries
SELECT * FROM customers;

SELECT * FROM products
WHERE category = 'Grocery';

SELECT * FROM orders
ORDER BY order_date DESC;

-- Aggregation
SELECT COUNT(*) AS total_orders FROM orders;

SELECT p.product_name, SUM(p.price * o.quantity) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name;

SELECT AVG(price) AS average_product_price FROM products;

-- Joins
SELECT o.order_id, c.name AS customer_name, p.product_name, o.quantity, o.order_date
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN products p ON o.product_id = p.product_id;

SELECT c.customer_id, c.name, o.order_id, o.order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

SELECT p.product_id, p.product_name, o.order_id, o.quantity
FROM products p
LEFT JOIN orders o ON p.product_id = o.product_id;
