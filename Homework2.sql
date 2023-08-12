CREATE DATABASE IF NOT EXISTS homework_2;

USE homework_2;

CREATE TABLE IF NOT EXISTS sales (
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  order_date DATE,
  count_product INT UNSIGNED
);

SELECT * FROM sales;

INSERT INTO sales (order_date, count_product)
VALUES 
  ('2022-01-01', 156),
  ('2022-01-02', 180),
  ('2022-01-03', 21),
  ('2022-01-04', 124),
  ('2022-01-05', 341);

SELECT * FROM sales;


SELECT id AS "id заказа",  
CASE
  WHEN count_product < 100 THEN "маленький заказ"
  WHEN count_product BETWEEN 100 AND 300 THEN "средний заказ"
  ELSE "большой заказ"
END AS "тип заказа"
FROM sales;

CREATE TABLE IF NOT EXISTS orders (
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  employee_id VARCHAR(20) NOT NULL,
  amount DECIMAL(5,2),
  order_status VARCHAR(20) NOT NULL
  );

SELECT * FROM orders;

INSERT INTO orders (employee_id, amount, order_status)
VALUES 
  ('e03', 15.00, 'OPEN'),
  ('e01', 25.50, 'OPEN'),
  ('e05', 100.70, 'CLOSED'),
  ('e02', 22.18, 'OPEN'),
  ('e04', 9.50, 'CANCELLED');

SELECT * FROM orders;

SELECT id, employee_id, amount, order_status,  
CASE
  WHEN order_status = 'OPEN' THEN "Order is in open state"
  WHEN order_status = 'CLOSED' THEN "Order is closed"
  WHEN order_status = 'CANCELLED' THEN "Order is cancelled"
  ELSE "error"
END AS "full_order_status"
FROM orders;