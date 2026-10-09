Enter password: *************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 11
Server version: 26.7.0 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE ecommerce;
Query OK, 1 row affected (0.075 sec)

mysql> USE ecommerce;
Database changed
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| ecommerce          |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.042 sec)

mysql> USE ecommerce;
Database changed
mysql> create table customer;
ERROR 4028 (HY000): A table must have at least one visible column.
mysql> create table customers(customer_id int primary key Auto_Increment,name varchar(100)not null,email varchar(100) unique not null,phone varchar(15),city varchar(50),state varchar(50),registration_date date);
Query OK, 0 rows affected (0.337 sec)

mysql> SHOW TABLES;
+---------------------+
| Tables_in_ecommerce |
+---------------------+
| customers           |
+---------------------+
1 row in set (0.045 sec)

mysql> INSERT INTO customers(name, email, phone, city, state, registration_date)value('Rahul Sharma', 'rahul@gmail.com', '9876543210', 'Indore', 'Madhya Pradesh', '2025-01-15'),('Priya Verma', 'priya@gmail.com', '9876543211', 'Bhopal', 'Madhya Pradesh', '2025-02-10'),('Aman Khan', 'aman@gmail.com', '9876543212', 'Mumbai', 'Maharashtra', '2025-03-05'),('Neha Patel', 'neha@gmail.com', '9876543213', 'Ahmedabad', 'Gujarat', '2025-03-20'),('Riya Singh', 'riya@gmail.com', '9876543214', 'Delhi', 'Delhi', '2025-04-12');
Query OK, 5 rows affected (0.077 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM customers;
+-------------+--------------+-----------------+------------+-----------+----------------+-------------------+
| customer_id | name         | email           | phone      | city      | state          | registration_date |
+-------------+--------------+-----------------+------------+-----------+----------------+-------------------+
|           1 | Rahul Sharma | rahul@gmail.com | 9876543210 | Indore    | Madhya Pradesh | 2025-01-15        |
|           2 | Priya Verma  | priya@gmail.com | 9876543211 | Bhopal    | Madhya Pradesh | 2025-02-10        |
|           3 | Aman Khan    | aman@gmail.com  | 9876543212 | Mumbai    | Maharashtra    | 2025-03-05        |
|           4 | Neha Patel   | neha@gmail.com  | 9876543213 | Ahmedabad | Gujarat        | 2025-03-20        |
|           5 | Riya Singh   | riya@gmail.com  | 9876543214 | Delhi     | Delhi          | 2025-04-12        |
+-------------+--------------+-----------------+------------+-----------+----------------+-------------------+
5 rows in set (0.005 sec)

mysql> CREATE TABLE categories (category_id INT PRIMARY KEY AUTO_INCREMENT, category_name VARCHAR(100) NOT NULL UNIQUE);
Query OK, 0 rows affected (0.272 sec)

mysql> SHOW TABLES;
+---------------------+
| Tables_in_ecommerce |
+---------------------+
| categories          |
| customers           |
+---------------------+
2 rows in set (0.019 sec)

mysql> CREATE TABLE products (product_id INT PRIMARY KEY AUTO_INCREMENT,product_name VARCHAR(100) NOT NULL,category_id INT, price DECIMAL(10,2) NOT NULL,stock INT DEFAULT 0,FOREIGN KEY (category_id) REFERENCES categories(category_id));
Query OK, 0 rows affected (0.322 sec)

mysql> SHOW TABLES;
+---------------------+
| Tables_in_ecommerce |
+---------------------+
| categories          |
| customers           |
| products            |
+---------------------+
3 rows in set (0.022 sec)

mysql> INSERT INTO categories (category_name)VALUES('Electronics'),('Clothing'),('Books'),('Home Appliances'),('Sports');
Query OK, 5 rows affected (0.066 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM categories;
+-------------+-----------------+
| category_id | category_name   |
+-------------+-----------------+
|           3 | Books           |
|           2 | Clothing        |
|           1 | Electronics     |
|           4 | Home Appliances |
|           5 | Sports          |
+-------------+-----------------+
5 rows in set (0.005 sec)

mysql> INSERT INTO products(product_name, category_id, price, stock)VALUES('Laptop', 1, 55000.00, 20),('Smartphone', 1, 25000.00, 35),('Headphones', 1, 2500.00, 50),('T-Shirt', 2, 799.00, 100),('Jeans', 2, 1499.00, 60),('Python Programming Book', 3, 650.00, 40),^C
mysql> INSERT INTO products(product_name, category_id, price, stock)VALUES('Laptop', 1, 55000.00, 20),('Smartphone', 1, 25000.00, 35),('Headphones', 1, 2500.00, 50),('T-Shirt', 2, 799.00, 100),('Jeans', 2, 1499.00, 60),('Python Programming Book', 3, 650.00, 40),('SQL Book', 3, 550.00, 30),('Mixer Grinder', 4, 3200.00, 25),('Cricket Bat', 5, 1800.00, 15),('Football', 5, 900.00, 45);
Query OK, 10 rows affected (0.080 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM products;
+------------+-------------------------+-------------+----------+-------+
| product_id | product_name            | category_id | price    | stock |
+------------+-------------------------+-------------+----------+-------+
|          1 | Laptop                  |           1 | 55000.00 |    20 |
|          2 | Smartphone              |           1 | 25000.00 |    35 |
|          3 | Headphones              |           1 |  2500.00 |    50 |
|          4 | T-Shirt                 |           2 |   799.00 |   100 |
|          5 | Jeans                   |           2 |  1499.00 |    60 |
|          6 | Python Programming Book |           3 |   650.00 |    40 |
|          7 | SQL Book                |           3 |   550.00 |    30 |
|          8 | Mixer Grinder           |           4 |  3200.00 |    25 |
|          9 | Cricket Bat             |           5 |  1800.00 |    15 |
|         10 | Football                |           5 |   900.00 |    45 |
+------------+-------------------------+-------------+----------+-------+
10 rows in set (0.008 sec)

mysql> ^C
mysql> SELECT products.product_name,categories.category_name,products.price,products.stock FROM products JOIN categoriesON products.category_id = categories.category_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '.category_id = categories.category_id' at line 1
mysql> SELECT products.product_name,categories.category_name,products.price,product.stock FROM products JOIN categories ON products.category_id = categories.category_id;
ERROR 1054 (42S22): Unknown column 'product.stock' in 'field list'
mysql> SELECT  products.product_name,categories.category_name, products.price,products.stock  FROM products JOIN categories ON products.category_id = categories.category_id;
+-------------------------+-----------------+----------+-------+
| product_name            | category_name   | price    | stock |
+-------------------------+-----------------+----------+-------+
| Python Programming Book | Books           |   650.00 |    40 |
| SQL Book                | Books           |   550.00 |    30 |
| T-Shirt                 | Clothing        |   799.00 |   100 |
| Jeans                   | Clothing        |  1499.00 |    60 |
| Laptop                  | Electronics     | 55000.00 |    20 |
| Smartphone              | Electronics     | 25000.00 |    35 |
| Headphones              | Electronics     |  2500.00 |    50 |
| Mixer Grinder           | Home Appliances |  3200.00 |    25 |
| Cricket Bat             | Sports          |  1800.00 |    15 |
| Football                | Sports          |   900.00 |    45 |
+-------------------------+-----------------+----------+-------+
10 rows in set (0.009 sec)

mysql> CREATE TABLE orders (order_id INT PRIMARY KEY AUTO_INCREMENT, customer_id INT NOT NULL,order_date DATE NOT NULL, order_status VARCHAR(30) DEFAULT 'Pending', total_amount DECIMAL(10,2) NOT NULL, FOREIGN KEY (customer_id) REFERENCES customers(customer_id));
Query OK, 0 rows affected (0.294 sec)

mysql> INSERT INTO orders(customer_id, order_date, order_status, total_amount)VALUES^C
mysql> ^C
mysql> INSERT INTO orders(customer_id, order_date, order_status, total_amount)VALUES(1, '2025-05-01', 'Delivered', 55000.00),(2, '2025-05-03', 'Delivered', 2500.00),(3, '2025-05-05', 'Pending', 25000.00),(1, '2025-05-10', 'Delivered', 1499.00),(4, '2025-05-12', 'Shipped', 3200.00),(5, '2025-05-15', 'Delivered', 1800.00),(2, '2025-05-18', 'Cancelled', 650.00),(3, '2025-05-20', 'Delivered', 900.00);
Query OK, 8 rows affected (0.090 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM orders;
+----------+-------------+------------+--------------+--------------+
| order_id | customer_id | order_date | order_status | total_amount |
+----------+-------------+------------+--------------+--------------+
|        1 |           1 | 2025-05-01 | Delivered    |     55000.00 |
|        2 |           2 | 2025-05-03 | Delivered    |      2500.00 |
|        3 |           3 | 2025-05-05 | Pending      |     25000.00 |
|        4 |           1 | 2025-05-10 | Delivered    |      1499.00 |
|        5 |           4 | 2025-05-12 | Shipped      |      3200.00 |
|        6 |           5 | 2025-05-15 | Delivered    |      1800.00 |
|        7 |           2 | 2025-05-18 | Cancelled    |       650.00 |
|        8 |           3 | 2025-05-20 | Delivered    |       900.00 |
+----------+-------------+------------+--------------+--------------+
8 rows in set (0.005 sec)

mysql> SELECT customers.name,orders.order_id, orders.order_date,orders.order_status,orders.total_amount FROM customers JOIN orders ON customers.customer_id = orders.customer_id;
+--------------+----------+------------+--------------+--------------+
| name         | order_id | order_date | order_status | total_amount |
+--------------+----------+------------+--------------+--------------+
| Rahul Sharma |        1 | 2025-05-01 | Delivered    |     55000.00 |
| Rahul Sharma |        4 | 2025-05-10 | Delivered    |      1499.00 |
| Priya Verma  |        2 | 2025-05-03 | Delivered    |      2500.00 |
| Priya Verma  |        7 | 2025-05-18 | Cancelled    |       650.00 |
| Aman Khan    |        3 | 2025-05-05 | Pending      |     25000.00 |
| Aman Khan    |        8 | 2025-05-20 | Delivered    |       900.00 |
| Neha Patel   |        5 | 2025-05-12 | Shipped      |      3200.00 |
| Riya Singh   |        6 | 2025-05-15 | Delivered    |      1800.00 |
+--------------+----------+------------+--------------+--------------+
8 rows in set (0.008 sec)

mysql> CREATE TABLE order_items (order_item_id INT PRIMARY KEY AUTO_INCREMENT,order_id INT NOT NULL,product_id INT NOT NULL, quantity INT NOT NULL,price DECIMAL(10,2) NOT NULL,FOREIGN KEY (order_id) REFERENCES orders(order_id),FOREIGN KEY (product_id) REFERENCES products(product_id));
Query OK, 0 rows affected (0.328 sec)

mysql> INSERT INTO order_items(order_id, product_id, quantity, price)VALUES(1, 1, 1, 55000.00),(2, 3, 1, 2500.00),(3, 2, 1, 25000.00),(4, 5, 1, 1499.00),(5, 8, 1, 3200.00),^C
mysql> INSERT INTO order_items(order_id, product_id, quantity, price)VALUES(1, 1, 1, 55000.00),(2, 3, 1, 2500.00),(3, 2, 1, 25000.00),(4, 5, 1, 1499.00),(5, 8, 1, 3200.00),(6, 9, 1, 1800.00),(7, 6, 1, 650.00),(8, 10, 1, 900.00);
Query OK, 8 rows affected (0.084 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM order_items;
+---------------+----------+------------+----------+----------+
| order_item_id | order_id | product_id | quantity | price    |
+---------------+----------+------------+----------+----------+
|             1 |        1 |          1 |        1 | 55000.00 |
|             2 |        2 |          3 |        1 |  2500.00 |
|             3 |        3 |          2 |        1 | 25000.00 |
|             4 |        4 |          5 |        1 |  1499.00 |
|             5 |        5 |          8 |        1 |  3200.00 |
|             6 |        6 |          9 |        1 |  1800.00 |
|             7 |        7 |          6 |        1 |   650.00 |
|             8 |        8 |         10 |        1 |   900.00 |
+---------------+----------+------------+----------+----------+
8 rows in set (0.008 sec)

mysql> SELECT customers.name AS customer_name,orders.order_id, products.product_name,order_items.quantity,order_items.priceFROM customers
    -> SELECT  customers.name AS customer_name, orders.order_id,products.product_name,order_items.quantity, order_items.price FROM customers JOIN orders  ON customers.customer_id = orders.customer_id JOIN order_items  ON orders.order_id = order_items.order_id JOIN products ON order_items.product_id = products.product_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SELECT  customers.name AS customer_name, orders.order_id,products.product_name,o' at line 2
mysql> SELECT customers.name AS customer_name,orders.order_id,products.product_name,order_items.quantity, order_items.price FROM customers JOIN orders  ON customers.customer_id = orders.customer_id JOIN order_items  ON orders.order_id = order_items.order_id JOIN products ON order_items.product_id = products.product_id;
+---------------+----------+-------------------------+----------+----------+
| customer_name | order_id | product_name            | quantity | price    |
+---------------+----------+-------------------------+----------+----------+
| Rahul Sharma  |        1 | Laptop                  |        1 | 55000.00 |
| Rahul Sharma  |        4 | Jeans                   |        1 |  1499.00 |
| Priya Verma   |        2 | Headphones              |        1 |  2500.00 |
| Priya Verma   |        7 | Python Programming Book |        1 |   650.00 |
| Aman Khan     |        3 | Smartphone              |        1 | 25000.00 |
| Aman Khan     |        8 | Football                |        1 |   900.00 |
| Neha Patel    |        5 | Mixer Grinder           |        1 |  3200.00 |
| Riya Singh    |        6 | Cricket Bat             |        1 |  1800.00 |
+---------------+----------+-------------------------+----------+----------+
8 rows in set (0.014 sec)

mysql> CREATE TABLE payments (payment_id INT PRIMARY KEY AUTO_INCREMENT,order_id INT NOT NULL,payment_date DATE,payment_method VARCHAR(30), payment_status VARCHAR(30), amount DECIMAL(10,2), FOREIGN KEY (order_id) REFERENCES orders(order_id));
Query OK, 0 rows affected (0.381 sec)

mysql> INSERT INTO payments(order_id, payment_date, payment_method, payment_status, amount)VALUES(1, '2025-05-01', 'UPI', 'Paid', 55000.00),(2, '2025-05-03', 'Credit Card', 'Paid', 2500.00),(3, '2025-05-05', 'UPI', 'Pending', 25000.00),(4, '2025-05-10', 'Debit Card', 'Paid', 1499.00),(5, '2025-05-12', 'UPI', 'Paid', 3200.00),(6, '2025-05-15', 'Cash', 'Paid', 1800.00),(7, '2025-05-18', 'UPI', 'Refunded', 650.00),(8, '2025-05-20', 'Credit Card', 'Paid', 900.00);
Query OK, 8 rows affected (0.087 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM payments;
+------------+----------+--------------+----------------+----------------+----------+
| payment_id | order_id | payment_date | payment_method | payment_status | amount   |
+------------+----------+--------------+----------------+----------------+----------+
|          1 |        1 | 2025-05-01   | UPI            | Paid           | 55000.00 |
|          2 |        2 | 2025-05-03   | Credit Card    | Paid           |  2500.00 |
|          3 |        3 | 2025-05-05   | UPI            | Pending        | 25000.00 |
|          4 |        4 | 2025-05-10   | Debit Card     | Paid           |  1499.00 |
|          5 |        5 | 2025-05-12   | UPI            | Paid           |  3200.00 |
|          6 |        6 | 2025-05-15   | Cash           | Paid           |  1800.00 |
|          7 |        7 | 2025-05-18   | UPI            | Refunded       |   650.00 |
|          8 |        8 | 2025-05-20   | Credit Card    | Paid           |   900.00 |
+------------+----------+--------------+----------------+----------------+----------+
8 rows in set (0.006 sec)

mysql> SELECT customers.name AS customer_name,orders.order_id, orders.order_date,orders.total_amount, payments.payment_method,payments.payment_status,payments.amount FROM customers JOIN orders ON customers.customer_id = orders.customer_id JOIN payments  ON orders.order_id = payments.order_id;
+---------------+----------+------------+--------------+----------------+----------------+----------+
| customer_name | order_id | order_date | total_amount | payment_method | payment_status | amount   |
+---------------+----------+------------+--------------+----------------+----------------+----------+
| Rahul Sharma  |        1 | 2025-05-01 |     55000.00 | UPI            | Paid           | 55000.00 |
| Rahul Sharma  |        4 | 2025-05-10 |      1499.00 | Debit Card     | Paid           |  1499.00 |
| Priya Verma   |        2 | 2025-05-03 |      2500.00 | Credit Card    | Paid           |  2500.00 |
| Priya Verma   |        7 | 2025-05-18 |       650.00 | UPI            | Refunded       |   650.00 |
| Aman Khan     |        3 | 2025-05-05 |     25000.00 | UPI            | Pending        | 25000.00 |
| Aman Khan     |        8 | 2025-05-20 |       900.00 | Credit Card    | Paid           |   900.00 |
| Neha Patel    |        5 | 2025-05-12 |      3200.00 | UPI            | Paid           |  3200.00 |
| Riya Singh    |        6 | 2025-05-15 |      1800.00 | Cash           | Paid           |  1800.00 |
+---------------+----------+------------+--------------+----------------+----------------+----------+
8 rows in set (0.013 sec)

mysql> SELECT SUM(total_amount) AS total_revenue FROM orders WHERE order_status <> 'Cancelled';
+---------------+
| total_revenue |
+---------------+
|      89899.00 |
+---------------+
1 row in set (0.010 sec)

mysql> SELECT AVG(total_amount) AS average_order_value FROM orders WHERE order_status <> 'Cancelled';
+---------------------+
| average_order_value |
+---------------------+
|        12842.714286 |
+---------------------+
1 row in set (0.007 sec)

mysql> ^C
mysql> SELECT COUNT(*) AS total_orders FROM orders WHERE order_status <> 'Cancelled';
+--------------+
| total_orders |
+--------------+
|            7 |
+--------------+
1 row in set (0.006 sec)

mysql> SELECT order_status, COUNT(*) AS number_of_orders FROM orders GROUP BY order_status;
+--------------+------------------+
| order_status | number_of_orders |
+--------------+------------------+
| Delivered    |                5 |
| Pending      |                1 |
| Shipped      |                1 |
| Cancelled    |                1 |
+--------------+------------------+
4 rows in set (0.008 sec)

mysql> SELECT customers.name AS customer_name,SUM(orders.total_amount) AS total_spent FROM customers JOIN orders ON customers.customer_id = orders.customer_id WHERE orders.order_status <> 'Cancelled' GROUP BY customers.customer_id, customers.name GROUP BY customers.customer_id, customers.name
    -> ORDER BY total_spent DESC;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'GROUP BY customers.customer_id, customers.name
ORDER BY total_spent DESC' at line 1
mysql> SELECT customers.name AS customer_name, SUM(orders.total_amount) AS total_spent FROM customers JOIN orders ON customers.customer_id = orders.customer_id WHERE orders.order_status <> 'Cancelled' GROUP BY customers.customer_id, customers.name ORDER BY total_spent DESC;
+---------------+-------------+
| customer_name | total_spent |
+---------------+-------------+
| Rahul Sharma  |    56499.00 |
| Aman Khan     |    25900.00 |
| Neha Patel    |     3200.00 |
| Priya Verma   |     2500.00 |
| Riya Singh    |     1800.00 |
+---------------+-------------+
5 rows in set (0.012 sec)

mysql> SELECT  products.product_name,SUM(order_items.quantity) AS total_quantity_sold FROM products JOIN order_items ON products.product_id = order_items.product_id JOIN orders ON order_items.order_id = orders.order_id WHERE orders.order_status <> 'Cancelled' GROUP BY products.product_id, products.product_name ORDER BY total_quantity_sold DESC;
+---------------+---------------------+
| product_name  | total_quantity_sold |
+---------------+---------------------+
| Laptop        |                   1 |
| Headphones    |                   1 |
| Smartphone    |                   1 |
| Jeans         |                   1 |
| Mixer Grinder |                   1 |
| Cricket Bat   |                   1 |
| Football      |                   1 |
+---------------+---------------------+
7 rows in set (0.014 sec)

mysql> SELECT  categories.category_name,SUM(order_items.quantity * order_items.price) AS category_revenue FROM categories JOIN products ON categories.category_id = products.category_id JOIN order_items ON products.product_id = order_items.product_id JOIN orders  ON order_items.order_id = orders.order_id WHERE orders.order_status <> 'Cancelled' GROUP BY categories.category_id, categories.category_name ORDER BY category_revenue DESC;
+-----------------+------------------+
| category_name   | category_revenue |
+-----------------+------------------+
| Electronics     |         82500.00 |
| Home Appliances |          3200.00 |
| Sports          |          2700.00 |
| Clothing        |          1499.00 |
+-----------------+------------------+
4 rows in set (0.010 sec)

mysql> SELECT customers.name AS customer_name,COUNT(orders.order_id) AS total_orders FROM customers JOIN orders  ON customers.customer_id = orders.customer_id WHERE orders.order_status <> 'Cancelled' GROUP BY customers.customer_id, customers.name HAVING COUNT(orders.order_id) > 1;
+---------------+--------------+
| customer_name | total_orders |
+---------------+--------------+
| Rahul Sharma  |            2 |
| Aman Khan     |            2 |
+---------------+--------------+
2 rows in set (0.010 sec)

mysql> SELECT customers.name AS customer_name FROM customers LEFT JOIN orders ^C
mysql> SELECT customers.name AS customer_name FROM customers LEFT JOIN orders ON customers.customer_id = orders.customer_id WHERE orders.order_id IS NULL;
Empty set (0.007 sec)

mysql> SELECT customers.name AS customer_name,SUM(orders.total_amount) AS total_spent ^C
mysql> SELECT customers.name AS customer_name,SUM(orders.total_amount) AS total_spent FROM customers JOIN orders ON customers.customer_id = orders.customer_id WHERE orders.order_status <> 'Cancelled' GROUP BY customers.customer_id, customers.name  ORDER BY total_spent DESC LIMIT 1;
+---------------+-------------+
| customer_name | total_spent |
+---------------+-------------+
| Rahul Sharma  |    56499.00 |
+---------------+-------------+
1 row in set (0.013 sec)

mysql> SELECT  product_name, price FROM products WHERE price > (SELECT AVG(price) FROM products);
+--------------+----------+
| product_name | price    |
+--------------+----------+
| Laptop       | 55000.00 |
| Smartphone   | 25000.00 |
+--------------+----------+
2 rows in set (0.010 sec)

mysql> SELECT  customers.name AS customer_name, SUM(orders.total_amount) AS total_spent FROM customers JOIN orders ON customers.customer_id = orders.customer_id WHERE orders.order_status <> 'Cancelled' GROUP BY customers.customer_id, customers.name HAVING SUM(orders.total_amount) = (SELECT MAX(total_spent)  FROM (SELECT SUM(total_amount) AS total_spent FROM orders WHERE order_status <> 'Cancelled' GROUP BY customer_id   ) AS customer_totals );
+---------------+-------------+
| customer_name | total_spent |
+---------------+-------------+
| Rahul Sharma  |    56499.00 |
+---------------+-------------+
1 row in set (0.018 sec)

mysql> SELECT product_name,  price,   CASE  WHEN price >= 30000 THEN 'Expensive'  WHEN price >= 5000 THEN 'Medium' ELSE 'Affordable'  END AS price_category FROM products;
+-------------------------+----------+----------------+
| product_name            | price    | price_category |
+-------------------------+----------+----------------+
| Laptop                  | 55000.00 | Expensive      |
| Smartphone              | 25000.00 | Medium         |
| Headphones              |  2500.00 | Affordable     |
| T-Shirt                 |   799.00 | Affordable     |
| Jeans                   |  1499.00 | Affordable     |
| Python Programming Book |   650.00 | Affordable     |
| SQL Book                |   550.00 | Affordable     |
| Mixer Grinder           |  3200.00 | Affordable     |
| Cricket Bat             |  1800.00 | Affordable     |
| Football                |   900.00 | Affordable     |
+-------------------------+----------+----------------+
10 rows in set (0.009 sec)

mysql> SELECT categories.category_name, COUNT(products.product_id) AS total_products FROM categories LEFT JOIN products ON categories.category_id = products.category_id GROUP BY categories.category_id, categories.category_name ORDER BY total_products DESC;
+-----------------+----------------+
| category_name   | total_products |
+-----------------+----------------+
| Electronics     |              3 |
| Books           |              2 |
| Clothing        |              2 |
| Sports          |              2 |
| Home Appliances |              1 |
+-----------------+----------------+
5 rows in set (0.011 sec)

mysql> SELECT order_id, customer_id,  total_amount FROM orders WHERE total_amount > ( SELECT AVG(total_amount) FROM orders );
+----------+-------------+--------------+
| order_id | customer_id | total_amount |
+----------+-------------+--------------+
|        1 |           1 |     55000.00 |
|        3 |           3 |     25000.00 |
+----------+-------------+--------------+
2 rows in set (0.008 sec)

mysql> WITH customer_spending AS (SELECT  customer_id,  SUM(total_amount) AS total_spent  FROM orders WHERE order_status <> 'Cancelled'  GROUP BY customer_id ) SELECT customers.name, customer_spending.total_spent customer_spending.total_spent JOIN customer_spending  ON customers.customer_id = customer_spending.customer_id ORDER BY customer_spending.total_spent DESC;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '.total_spent JOIN customer_spending  ON customers.customer_id = customer_spendin' at line 1
mysql> WITH customer_spending AS ( SELECT customer_id,SUM(total_amount) AS total_spent  FROM orders WHERE order_status <> 'Cancelled'  GROUP BY customer_id ) SELECT customers.name, customer_spending.total_spent FROM customers JOIN customer_spending ON customers.customer_id = customer_spending.customer_id ORDER BY customer_spending.total_spent DESC;
+--------------+-------------+
| name         | total_spent |
+--------------+-------------+
| Rahul Sharma |    56499.00 |
| Aman Khan    |    25900.00 |
| Neha Patel   |     3200.00 |
| Priya Verma  |     2500.00 |
| Riya Singh   |     1800.00 |
+--------------+-------------+
5 rows in set (0.013 sec)

mysql> WITH category_sales AS (SELECT products.category_id,SUM(order_items.quantity * order_items.price) AS revenue FROM products  JOIN order_items  ON products.product_id = order_items.product_id JOIN orders ON order_items.order_id = orders.order_id WHERE orders.order_status <> 'Cancelled' GROUP BY products.category_id ) SELECT categories.category_name, category_sales.revenue FROM categories JOIN category_sales   ON categories.category_id = category_sales.category_id ORDER BY category_sales.revenue DESC;
+-----------------+----------+
| category_name   | revenue  |
+-----------------+----------+
| Electronics     | 82500.00 |
| Home Appliances |  3200.00 |
| Sports          |  2700.00 |
| Clothing        |  1499.00 |
+-----------------+----------+
4 rows in set (0.014 sec)

mysql> SELECT  customers.name AS customer_name, SUM(orders.total_amount) AS total_spent, RANK() OVER (ORDER BY SUM(orders.total_amount) DESC  ) AS customer_rank FROM customers JOIN orders ON customers.customer_id = orders.customer_id WHERE orders.order_status <> 'Cancelled' GROUP BY customers.customer_id, customers.name;
+---------------+-------------+---------------+
| customer_name | total_spent | customer_rank |
+---------------+-------------+---------------+
| Rahul Sharma  |    56499.00 |             1 |
| Aman Khan     |    25900.00 |             2 |
| Neha Patel    |     3200.00 |             3 |
| Priya Verma   |     2500.00 |             4 |
| Riya Singh    |     1800.00 |             5 |
+---------------+-------------+---------------+
5 rows in set (0.013 sec)

mysql> SELECT product_name, price, RANK() OVER ( ORDER BY price DESC  ) AS price_rank FROM products;
+-------------------------+----------+------------+
| product_name            | price    | price_rank |
+-------------------------+----------+------------+
| Laptop                  | 55000.00 |          1 |
| Smartphone              | 25000.00 |          2 |
| Mixer Grinder           |  3200.00 |          3 |
| Headphones              |  2500.00 |          4 |
| Cricket Bat             |  1800.00 |          5 |
| Jeans                   |  1499.00 |          6 |
| Football                |   900.00 |          7 |
| T-Shirt                 |   799.00 |          8 |
| Python Programming Book |   650.00 |          9 |
| SQL Book                |   550.00 |         10 |
+-------------------------+----------+------------+
10 rows in set (0.009 sec)

mysql> SELECT  customers.name AS customer_name,  orders.order_id, orders.order_date, ROW_NUMBER() OVER (PARTITION BY customers.customer_id ORDER BY orders.order_date ) AS order_number FROM customers JOIN orders ON customers.customer_id = orders.customer_id;
+---------------+----------+------------+--------------+
| customer_name | order_id | order_date | order_number |
+---------------+----------+------------+--------------+
| Rahul Sharma  |        1 | 2025-05-01 |            1 |
| Rahul Sharma  |        4 | 2025-05-10 |            2 |
| Priya Verma   |        2 | 2025-05-03 |            1 |
| Priya Verma   |        7 | 2025-05-18 |            2 |
| Aman Khan     |        3 | 2025-05-05 |            1 |
| Aman Khan     |        8 | 2025-05-20 |            2 |
| Neha Patel    |        5 | 2025-05-12 |            1 |
| Riya Singh    |        6 | 2025-05-15 |            1 |
+---------------+----------+------------+--------------+
8 rows in set (0.010 sec)

mysql> SELECT customers.name AS customer_name, SUM(orders.total_amount) AS total_spent, DENSE_RANK() OVER ( ORDER BY SUM(orders.total_amount) DESC  ) AS spending_rank FROM customers  JOIN orders ON customers.customer_id = orders.customer_id  WHERE orders.order_status <> 'Cancelled' GROUP BY customers.customer_id, customers.name;
+---------------+-------------+---------------+
| customer_name | total_spent | spending_rank |
+---------------+-------------+---------------+
| Rahul Sharma  |    56499.00 |             1 |
| Aman Khan     |    25900.00 |             2 |
| Neha Patel    |     3200.00 |             3 |
| Priya Verma   |     2500.00 |             4 |
| Riya Singh    |     1800.00 |             5 |
+---------------+-------------+---------------+
5 rows in set (0.014 sec)

mysql> ^C
mysql> SELECT order_id, order_date,  total_amount, LAG(total_amount) OVER ( ORDER BY order_date ) AS previous_order_amount FROM orders;
+----------+------------+--------------+-----------------------+
| order_id | order_date | total_amount | previous_order_amount |
+----------+------------+--------------+-----------------------+
|        1 | 2025-05-01 |     55000.00 |                  NULL |
|        2 | 2025-05-03 |      2500.00 |              55000.00 |
|        3 | 2025-05-05 |     25000.00 |               2500.00 |
|        4 | 2025-05-10 |      1499.00 |              25000.00 |
|        5 | 2025-05-12 |      3200.00 |               1499.00 |
|        6 | 2025-05-15 |      1800.00 |               3200.00 |
|        7 | 2025-05-18 |       650.00 |               1800.00 |
|        8 | 2025-05-20 |       900.00 |                650.00 |
+----------+------------+--------------+-----------------------+
8 rows in set (0.012 sec)

mysql> SELECT order_id,  order_date, total_amount, LEAD(total_amount) OVER (   ORDER BY order_date  ) AS next_order_amount FROM orders;
+----------+------------+--------------+-------------------+
| order_id | order_date | total_amount | next_order_amount |
+----------+------------+--------------+-------------------+
|        1 | 2025-05-01 |     55000.00 |           2500.00 |
|        2 | 2025-05-03 |      2500.00 |          25000.00 |
|        3 | 2025-05-05 |     25000.00 |           1499.00 |
|        4 | 2025-05-10 |      1499.00 |           3200.00 |
|        5 | 2025-05-12 |      3200.00 |           1800.00 |
|        6 | 2025-05-15 |      1800.00 |            650.00 |
|        7 | 2025-05-18 |       650.00 |            900.00 |
|        8 | 2025-05-20 |       900.00 |              NULL |
+----------+------------+--------------+-------------------+
8 rows in set (0.010 sec)

mysql> CREATE VIEW customer_order_summary AS SELECT  customers.name AS customer_name,  orders.order_id,  orders.order_date, orders.order_status, orders.total_amount FROM customers JOIN orders ON customers.customer_id = orders.customer_id;
Query OK, 0 rows affected (0.085 sec)

mysql> SELECT * FROM customer_order_summary;
+---------------+----------+------------+--------------+--------------+
| customer_name | order_id | order_date | order_status | total_amount |
+---------------+----------+------------+--------------+--------------+
| Rahul Sharma  |        1 | 2025-05-01 | Delivered    |     55000.00 |
| Rahul Sharma  |        4 | 2025-05-10 | Delivered    |      1499.00 |
| Priya Verma   |        2 | 2025-05-03 | Delivered    |      2500.00 |
| Priya Verma   |        7 | 2025-05-18 | Cancelled    |       650.00 |
| Aman Khan     |        3 | 2025-05-05 | Pending      |     25000.00 |
| Aman Khan     |        8 | 2025-05-20 | Delivered    |       900.00 |
| Neha Patel    |        5 | 2025-05-12 | Shipped      |      3200.00 |
| Riya Singh    |        6 | 2025-05-15 | Delivered    |      1800.00 |
+---------------+----------+------------+--------------+--------------+
8 rows in set (0.012 sec)

mysql> SELECT categories.category_name,  AVG(products.price) AS average_price FROM categories JOIN products ON categories.category_id = products.category_id GROUP BY categories.category_id, categories.category_name ^C
mysql> ^C
mysql> SELECT categories.category_name,  AVG(products.price) AS average_price FROM categories JOIN products ON categories.category_id = products.category_id GROUP BY categories.category_id, categories.category_name ORDER BY average_price DESC;
+-----------------+---------------+
| category_name   | average_price |
+-----------------+---------------+
| Electronics     |  27500.000000 |
| Home Appliances |   3200.000000 |
| Sports          |   1350.000000 |
| Clothing        |   1149.000000 |
| Books           |    600.000000 |
+-----------------+---------------+
5 rows in set (0.012 sec)

mysql> DELIMITER // CREATE PROCEDURE get_orders_by_status(IN statusName VARCHAR(30)) BEGIN SELECT ^C
mysql> DELIMITER // CREATE PROCEDURE get_customer_orders(IN customerId INT) BEGIN  SELECT  customers.name AS customer_name,   orders.order_id, orders.order_date, orders.order_status, orders.total_amount    FROM customers   JOIN orders ON customers.customer_id = orders.customer_id WHERE customers.customer_id = customerId;END // DELIMITER ;
mysql> CALL get_customer_orders(1);
    ->
    -> DELIMITER //
ERROR 1305 (42000): PROCEDURE ecommerce.get_customer_orders does not exist
mysql> DELIMITER // CREATE PROCEDURE get_customer_orders(IN customerId INT) BEGIN SELECT customers.name AS customer_name, orders.order_id, orders.order_date, orders.order_status, orders.total_amount  FROM customers  JOIN orders ON customers.customer_id = orders.customer_id WHERE customers.customer_id = customerId; END // DELIMITER ;
mysql> CALL get_customer_orders(1);
    -> \c
mysql> mysql>
    -> ^C
mysql> USE ecommerce;
ERROR 1049 (42000): Unknown database 'ecommerce;'
mysql> DELIMITER //
mysql> SHOW DATABASES;
    ->
    -> c
    -> SHOW DATABASES;
    -> /c
    -> \c
mysql> SHOW DATABASES;
    -> \c
mysql> SHOW DATABASES;
    -> \c
mysql> CREATE DATABASE ecommerce;
    ->
    -> ^C
mysql> CREATE DATABASE ecommerce;
    -> \c
mysql> create database ecommerce;
    -> CREATE DATABASE ecommerce;^C
mysql> SHOW DATABASES;
    -> ^C
mysql> DELIMITER ;
mysql> CALL get_customer_orders(1);
+---------------+----------+------------+--------------+--------------+
| customer_name | order_id | order_date | order_status | total_amount |
+---------------+----------+------------+--------------+--------------+
| Rahul Sharma  |        1 | 2025-05-01 | Delivered    |     55000.00 |
| Rahul Sharma  |        4 | 2025-05-10 | Delivered    |      1499.00 |
+---------------+----------+------------+--------------+--------------+
2 rows in set (0.018 sec)

Query OK, 0 rows affected (0.052 sec)

mysql>
mysql> DELIMITER //
mysql> CREATE PROCEDURE get_orders_by_status(IN statusName VARCHAR(30)) BEGIN  SELECT order_id, customer_id,^C
mysql> CREATE PROCEDURE get_orders_by_status(IN statusName VARCHAR(30)) BEGIN SELECT order_id,  customer_id,  order_date,total_amount  FROM orders   WHERE order_status = statusName; END //
Query OK, 0 rows affected (0.156 sec)

mysql> DELIMITER ;
mysql> CALL get_orders_by_status('Delivered');
+----------+-------------+------------+--------------+
| order_id | customer_id | order_date | total_amount |
+----------+-------------+------------+--------------+
|        1 |           1 | 2025-05-01 |     55000.00 |
|        2 |           2 | 2025-05-03 |      2500.00 |
|        4 |           1 | 2025-05-10 |      1499.00 |
|        6 |           5 | 2025-05-15 |      1800.00 |
|        8 |           3 | 2025-05-20 |       900.00 |
+----------+-------------+------------+--------------+
5 rows in set (0.035 sec)

Query OK, 0 rows affected (0.131 sec)

mysql> DELIMITER //
mysql> CREATE FUNCTION calculate_discount(amount DECIMAL(10,2)) RETURNS DECIMAL(10,2) DETERMINISTIC BEGIN  DECLARE discount DECIMAL(10,2);  IF amount >= 50000 THEN  SET discount = amount * 0.10;   ELSEIF amount >= 10000 THEN  SET discount = amount * 0.05; ELSE  SET discount = 0;  END IF;  RETURN discount; END //
Query OK, 0 rows affected (0.111 sec)

mysql> DELIMITER ;
mysql> SELECT order_id, total_amount,  calculate_discount(total_amount) AS discount FROM orders;
+----------+--------------+----------+
| order_id | total_amount | discount |
+----------+--------------+----------+
|        1 |     55000.00 |  5500.00 |
|        2 |      2500.00 |     0.00 |
|        3 |     25000.00 |  1250.00 |
|        4 |      1499.00 |     0.00 |
|        5 |      3200.00 |     0.00 |
|        6 |      1800.00 |     0.00 |
|        7 |       650.00 |     0.00 |
|        8 |       900.00 |     0.00 |
+----------+--------------+----------+
8 rows in set (0.040 sec)

mysql> DELIMITER //
mysql> CREATE TRIGGER prevent_negative_stock BEFORE INSERT ON products FOR EACH ROW BEGIN  IF NEW.stock < 0 THEN  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stock cannot be negative'; END IF; END //
Query OK, 0 rows affected (0.197 sec)

mysql> DELIMITER ;
mysql> DELIMITER //
mysql> CREATE TRIGGER prevent_negative_quantity BEFORE INSERT ON order_items FOR EACH ROW BEGIN IF NEW.quantity <= 0 THEN  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Quantity must be greater than zero'; END IF; END //
Query OK, 0 rows affected (0.124 sec)

mysql> DELIMITER ;
mysql> CREATE INDEX idx_customer_city ON customers(city);
Query OK, 0 rows affected (0.853 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> CREATE INDEX idx_order_date ON orders(order_date);
Query OK, 0 rows affected (0.575 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> CREATE INDEX idx_order_status ON orders(order_status);
Query OK, 0 rows affected (0.659 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> EXPLAIN SELECT * FROM orders WHERE order_status = 'Delivered';
+-------------------------------------------------------------------------------------------------+
| EXPLAIN                                                                                         |
+-------------------------------------------------------------------------------------------------+
| -> Index lookup on orders using idx_order_status (order_status = 'Delivered')  (cost=1 rows=5)
 |
+-------------------------------------------------------------------------------------------------+
1 row in set (0.043 sec)

mysql> SELECT customers.name AS customer_name, SUM(orders.total_amount) AS total_spent FROM customers JOIN orders ON customers.customer_id = orders.customer_id  WHERE orders.order_status <> 'Cancelled' GROUP BY customers.customer_id, customers.name ORDER BY total_spent DESC LIMIT 3;
+---------------+-------------+
| customer_name | total_spent |
+---------------+-------------+
| Rahul Sharma  |    56499.00 |
| Aman Khan     |    25900.00 |
| Neha Patel    |     3200.00 |
+---------------+-------------+
3 rows in set (0.012 sec)

mysql> SELECT products.product_name, SUM(order_items.quantity * order_items.price) AS revenue FROM products JOIN order_items ON products.product_id = order_items.product_id JOIN orders  ON order_items.order_id = orders.order_id  WHERE orders.order_status <> 'Cancelled' GROUP BY products.product_id, products.product_name ORDER BY revenue DESC LIMIT 3;
+---------------+----------+
| product_name  | revenue  |
+---------------+----------+
| Laptop        | 55000.00 |
| Smartphone    | 25000.00 |
| Mixer Grinder |  3200.00 |
+---------------+----------+
3 rows in set (0.029 sec)

mysql> SELECT payment_method, COUNT(*) AS total_payments, SUM(amount) AS total_amount FROM payments WHERE payment_status = 'Paid'  GROUP BY payment_method  ORDER BY total_amount DESC;
+----------------+----------------+--------------+
| payment_method | total_payments | total_amount |
+----------------+----------------+--------------+
| UPI            |              2 |     58200.00 |
| Credit Card    |              2 |      3400.00 |
| Cash           |              1 |      1800.00 |
| Debit Card     |              1 |      1499.00 |
+----------------+----------------+--------------+
4 rows in set (0.022 sec)

mysql> SELECT  order_status, COUNT(*) AS total_orders,  SUM(total_amount) AS total_amount FROM orders GROUP BY order_status;
+--------------+--------------+--------------+
| order_status | total_orders | total_amount |
+--------------+--------------+--------------+
| Cancelled    |            1 |       650.00 |
| Delivered    |            5 |     61699.00 |
| Pending      |            1 |     25000.00 |
| Shipped      |            1 |      3200.00 |
+--------------+--------------+--------------+
4 rows in set (0.006 sec)

mysql> SELECT  customers.name AS customer_name, COUNT(orders.order_id) AS total_orders, COALESCE(SUM(orders.total_amount), 0) AS total_spent, COALESCE(AVG(orders.total_amount), 0) AS average_order_value FROM customers LEFT JOIN orders ON customers.customer_id = orders.customer_id GROUP BY customers.customer_id, customers.name ORDER BY total_spent DESC;
+---------------+--------------+-------------+---------------------+
| customer_name | total_orders | total_spent | average_order_value |
+---------------+--------------+-------------+---------------------+
| Rahul Sharma  |            2 |    56499.00 |        28249.500000 |
| Aman Khan     |            2 |    25900.00 |        12950.000000 |
| Neha Patel    |            1 |     3200.00 |         3200.000000 |
| Priya Verma   |            2 |     3150.00 |         1575.000000 |
| Riya Singh    |            1 |     1800.00 |         1800.000000 |
+---------------+--------------+-------------+---------------------+
5 rows in set (0.240 sec)

mysql> SELECT customers.name AS customer_name, COUNT(DISTINCT orders.order_id) AS total_orders,  SUM(order_items.quantity) AS total_items, SUM(order_items.quantity * order_items.price) AS total_spent FROM customers JOIN orders ON customers.customer_id = orders.customer_id JOIN order_items ON orders.order_id = order_items.order_id WHERE orders.order_status <> 'Cancelled' GROUP BY customers.customer_id, customers.name ORDER BY total_spent DESC;
+---------------+--------------+-------------+-------------+
| customer_name | total_orders | total_items | total_spent |
+---------------+--------------+-------------+-------------+
| Rahul Sharma  |            2 |           2 |    56499.00 |
| Aman Khan     |            2 |           2 |    25900.00 |
| Neha Patel    |            1 |           1 |     3200.00 |
| Priya Verma   |            1 |           1 |     2500.00 |
| Riya Singh    |            1 |           1 |     1800.00 |
+---------------+--------------+-------------+-------------+
5 rows in set (0.244 sec)

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| ecommerce          |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.020 sec)

mysql> USE ecommerce;
Database changed
mysql> SHOW TABLES;
+------------------------+
| Tables_in_ecommerce    |
+------------------------+
| categories             |
| customer_order_summary |
| customers              |
| order_items            |
| orders                 |
| payments               |
| products               |
+------------------------+
7 rows in set (0.024 sec)

mysql>