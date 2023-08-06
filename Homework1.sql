-- Подключаем базу данных
USE homework_1;
SELECT*
FROM mobile_phone;

/*Задание №2 
Выведите название, производителя и цену для
товаров, количество которых превышает 2 */

SELECT ProductName, Manufacturer, Price
FROM mobile_phone
WHERE ProductCount > 2;


/*Задание №3
 Выведите весь ассортимент товаров марки "Samsung" */

SELECT *
FROM mobile_phone
WHERE Manufacturer = 'Samsung';


/*Задание №4.1
Вывести товары, в которых есть упоминание "Iphone" */

SELECT *
FROM mobile_phone
WHERE ProductName LIKE '%iPhone%' OR Manufacturer LIKE '%iPhone%';


/*Задание №4.2
Вывести товары, в которых есть упоминание "Samsung" */

SELECT *
FROM mobile_phone
WHERE ProductName LIKE '%Samsung%' OR Manufacturer LIKE '%Samsung%';


/*Задание №4.3
Вывести товары, в которых есть цифра */

SELECT * 
FROM mobile_phone 
WHERE ProductName REGEXP '[0-9]';


/*Задание №4.4
Вывести товары, в которых есть цифра */

SELECT * 
FROM mobile_phone 
WHERE ProductName REGEXP '[8]';