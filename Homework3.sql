CREATE DATABASE IF NOT EXISTS homework_3;

USE homework_3;

-- 1 часть

CREATE TABLE IF NOT EXISTS Salespeople (
  id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  snum INT NOT NULL,
  sname VARCHAR(25) NOT NULL,
  city VARCHAR(25),
  comm DECIMAL(2,2)
);

SELECT * FROM Salespeople;

INSERT INTO salespeople (snum, sname, city, comm) 
VALUES
  (1001, "Peel", "London", .12),
  (1002, "Serres", "San Jose", .13),
  (1004, "Motika", "London", .11),
  (1007, "Rifkin", "Barcelona", .15),
  (1003, "Axelrod", "New York", .10);
    
SELECT * FROM Salespeople;

CREATE TABLE IF NOT EXISTS Customers (
  id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  cnum INT NOT NULL,
  cname VARCHAR(25) NOT NULL,
  city VARCHAR(25),
  rating INT,
  snum INT
);
INSERT INTO Customers(cnum, cname, city, rating, snum) 
VALUES
  (2001, "Hoffman", "London", 100, 1001),
  (2002, "Giovanni", "Rome", 200, 1003),
  (2003, "Liu", "SanJose", 200, 1002),
  (2004, "Grass", "Berlin", 300, 1002),
  (2006, "Clemens", "London", 100, 1001),
  (2008, "Cisneros", "SanJose", 300, 1007),
  (2007, "Pereira", "Rome", 100, 1004);

SELECT * FROM Customers;

CREATE TABLE IF NOT EXISTS Orders (
  id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  onum INT NOT NULL,
  amt DECIMAL(7,2),
  odate DATE,
  cnum INT NOT NULL,
  snum INT NOT NULL
);

INSERT INTO Orders(onum, amt, odate, cnum, snum) 
VALUES
  (3001, 18.69, '1990-03-10', 2008, 1007),
  (3003, 767.19, '1990-03-10', 2001, 1001),
  (3002, 1900.10, '1990-03-10', 2007, 1004),
  (3005, 5160.45, '1990-03-10', 2003, 1002),
  (3006, 1098.16, '1990-03-10', 2008, 1007),
  (3009, 1713.23, '1990-04-10', 2002, 1003),
  (3007, 75.75, '1990-04-10', 2004, 1002),
  (3008, 4723.00, '1990-05-10', 2006, 1001),
  (3010, 1309.95, '1990-06-10', 2004, 1002),
  (3011, 9891.88, '1990-06-10', 2006, 1001);
  
  SELECT * FROM Orders;

-- 1 задание    
SELECT city, sname, snum, comm FROM salespeople;

-- 2 задание
SELECT rating, cname FROM customers
WHERE city = 'SanJose';

-- 3 задание
SELECT DISTINCT snum FROM orders;

-- 4 задание
SELECT cname FROM customers
WHERE cname LIKE 'G%';

-- 5 задание
SELECT * FROM orders
WHERE amt > 1000;

-- 6 задание
SELECT MIN(amt) FROM orders;

-- 7 задание
SELECT * FROM customers
WHERE rating > 100 AND city != 'Rome';

CREATE TABLE workers (
  id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name_w VARCHAR(15) NOT NULL,
  surname VARCHAR(15) NOT NULL,
  specialty VARCHAR(15),
  seniority INT,
  salary INT,
  age INT UNSIGNED DEFAULT NULL
);


-- 2 часть

INSERT INTO workers 
  (name_w, surname, specialty, seniority, salary, age)
VALUES
  ('Вася', 'Васькин', 'Начальник', 40, 100000, 60),
  ('Петя', 'Петькин', 'Начальник', 8, 70000, 30),
  ('Катя', 'Каткина', 'Инженер', 2, 70000, 25),
  ('Саша', 'Сашкин', 'Инженер', 12, 50000, 35),
  ('Иван', 'Иванов', 'Рабочий', 40, 30000, 59),
  ('Петр', 'Петров', 'Рабочий', 20, 25000, 40),
  ('Сидор', 'Сидоров', 'Рабочий', 10, 20000, 35),
  ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
  ('Юра', 'Юркин', 'Рабочий', 5, 15000, 25),
  ('Максим', 'Воронин', 'Рабочий', 2, 11000, 22),
  ('Юра', 'Галкин', 'Рабочий', 3, 12000, 24),
  ('Люся', 'Люськина', 'Уборщик', 10, 10000, 49);
    
SELECT * FROM workers;

-- Отсортируйте поле “зарплата” (salary) в порядке убывания и возрастания
    
SELECT * FROM workers 
ORDER BY salary DESC;

SELECT * FROM workers 
ORDER BY salary;

/* Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с
наибольшей заработной платой (возможен подзапрос)*/

SELECT salary 
FROM workers
ORDER BY salary DESC
LIMIT 5; 

/* Выполните группировку всех сотрудников по специальности ,
суммарная зарплата которых превышает 100000 */

SELECT   specialty, SUM(salary) AS "Суммарная зп"
FROM workers
GROUP BY specialty
HAVING SUM(salary) > 100000; 