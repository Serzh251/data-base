-- В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
-- Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.
INSERT INTO sample.users (id, name)
SELECT id, name
FROM shop.users 
WHERE  id = 1;


-- Создайте представление, которое выводит название name товарной позиции из таблицы products
-- и соответствующее название каталога name из таблицы catalogs.
CREATE VIEW cat_names (name_goods, catalog_name)
AS select name, (select name from catalogs where id = catalog_id) as catalog_name from products;