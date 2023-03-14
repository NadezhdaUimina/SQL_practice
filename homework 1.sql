# Урок 1. Установка СУБД, подключение к БД, просмотр и создание таблиц

/* 
1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. 
Необходимые поля таблицы: product_name (название товара), manufacturer (производитель), 
product_count (количество), price (цена). Заполните БД произвольными данными. 
*/

CREATE TABLE `phone_schema`.`phone` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NULL,
  `manufacturer` VARCHAR(45) NULL,
  `product_count` VARCHAR(45) NULL,
  `price` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));

INSERT INTO `phone_schema`.`phone` (`product_name`, `manufacturer`, `product_count`, `price`) VALUES ('Iphone14 Pro', 'Apple', '1', '98500');
INSERT INTO `phone_schema`.`phone` (`product_name`, `manufacturer`, `product_count`, `price`) VALUES ('Iphone12', 'Apple', '2', '39500');
INSERT INTO `phone_schema`.`phone` (`product_name`, `manufacturer`, `product_count`, `price`) VALUES ('Galaxy S21', 'Samsung', '1', '38400');
INSERT INTO `phone_schema`.`phone` (`product_name`, `manufacturer`, `product_count`, `price`) VALUES ('Galaxy A52', 'Samsung', '4', '31600');
INSERT INTO `phone_schema`.`phone` (`product_name`, `manufacturer`, `product_count`, `price`) VALUES ('Redmi Note 10S', 'Xiaomi ', '3', '19600');

/* 
2. Напишите SELECT-запрос, который выводит название товара, 
производителя и цену для товаров, количество которых превышает 2 
*/

SELECT product_name, manufacturer, price 
FROM phone_schema.phone
WHERE product_count > 2;

/* 
3. Выведите SELECT-запросом весь ассортимент товаров марки “Samsung”
*/

SELECT *
FROM phone_schema.phone
WHERE manufacturer = 'Samsung';

/*
4.* С помощью SELECT-запроса с оператором LIKE / REGEXP найти:
4.1.* Товары, в которых есть упоминание "Iphone"
*/

SELECT *
FROM phone_schema.phone
WHERE product_name LIKE '%Iphone%';

/*
4.2.* Товары, в которых есть упоминание "Samsung"
*/

SELECT *
FROM phone_schema.phone
WHERE manufacturer LIKE '%Samsung%';

/*
4.3.* Товары, в названии которых есть ЦИФРЫ
*/

SELECT *
FROM phone_schema.phone
WHERE product_name REGEXP '[0-9]';

/*
4.4.* Товары, в названии которых есть ЦИФРА "8"
*/

SELECT *
FROM phone_schema.phone
WHERE product_name LIKE '%8%';
