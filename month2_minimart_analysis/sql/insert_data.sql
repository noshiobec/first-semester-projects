-- SQL script to insert sample data

INSERT INTO customers (name, email, join_date) VALUES
('John Smith', 'john.smith@email.com', '2024-01-15'),
('Mary Johnson', 'mary.j@email.com', '2024-02-10'),
('Ahmed Bello', 'ahmed.b@email.com', '2024-03-05'),
('Grace Okoro', 'grace.okoro@email.com', '2024-03-20'),
('Daniel Brown', 'daniel.b@email.com', '2024-04-02'),
('Lucy Kim', 'lucy.kim@email.com', '2024-04-18'),
('Peter Wang', 'peter.wang@email.com', '2024-05-09');

INSERT INTO products (product_name, category, price, discount) VALUES
('Milk', 'Dairy', 2.50, 0.20),
('Bread Loaf', 'Bakery', 1.80, 0.10),
('Rice', 'Grains', 15.00, 1.00),
('Eggs', 'Poultry', 3.40, 0.25),
('Toothpaste', 'Personal Care', 4.50, 0.50),
('Cooking Oil ', 'Grocery', 6.20, 0.30),
('Laundry Detergent', 'Household', 8.90, 0.75);

INSERT INTO orders (customer_id, product_id, quantity, order_date) VALUES
(1, 3, 2, '2024-05-10'),
(2, 1, 3, '2024-05-11'),
(3, 7, 1, '2024-05-12'),
(4, 4, 2, '2024-05-12'),
(5, 5, 1, '2024-05-13'),
(6, 6, 2, '2024-05-13'),
(7, 2, 4, '2024-05-14');
