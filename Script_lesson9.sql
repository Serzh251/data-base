-- В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
-- Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.
INSERT INTO sample.users (id, name)
SELECT id, name
FROM shop.users 
WHERE  id = 1;


-- Создайте представление, которое выводит название name товарной позиции из таблицы products и
-- соответствующее название каталога name из таблицы catalogs.
CREATE VIEW cat_names (name_goods, catalog_name)
AS select name, (select name from catalogs where id = catalog_id) as catalog_name from products;

-- Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
-- с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

DROP FUNCTION IF EXISTS hello;

CREATE FUNCTION hello ()
RETURNS TEXT deterministic
begin
 DECLARE str TEXT DEFAULT 'returns';
  DECLARE time_now int;
  set time_now = DATE_FORMAT(NOW(), "%H");
  -- SELECT DATE_FORMAT(NOW(), "%H")INTO @time_now;
  IF(time_now between 6 and 12) THEN
  set str = 'Доброе утро';
  elseif (time_now between 12 and 18) THEN
  set str = 'Добрый день';
  elseif (time_now between 18 and 24) THEN
  set str = 'Добрый вечер';
  else
  set str = 'Доброй ночи';
  END IF;
  RETURN str;
end

select hello ();


-- В таблице products есть два текстовых поля: name с названием товара и description с его описанием. Допустимо присутствие обоих полей или одно из них. 
-- Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей или 
-- оба поля были заполнены. При попытке присвоить полям NULL-значение необходимо отменить операцию.
DROP TRIGGER IF EXISTS exept_null;

CREATE TRIGGER exept_null before INSERT ON products
FOR EACH ROW
begin
	if new.name is null and new.description is null then
		signal sqlstate '45000' set message_text = 'введите не нулевое значение имени и/или описание';
	end if; 
END

INSERT products (name, description, price) VALUES ('Nokia 9', 'HDM Global', 41000);
INSERT products (name, description, price) VALUES (null, null, 1452);




