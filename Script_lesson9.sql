-- � ���� ������ shop � sample ������������ ���� � �� �� �������, ������� ���� ������. 
-- ����������� ������ id = 1 �� ������� shop.users � ������� sample.users. ����������� ����������.
INSERT INTO sample.users (id, name)
SELECT id, name
FROM shop.users 
WHERE  id = 1;


-- �������� �������������, ������� ������� �������� name �������� ������� �� ������� products �
-- ��������������� �������� �������� name �� ������� catalogs.
CREATE VIEW cat_names (name_goods, catalog_name)
AS select name, (select name from catalogs where id = catalog_id) as catalog_name from products;

-- �������� �������� ������� hello(), ������� ����� ���������� �����������, � ����������� �� �������� ������� �����. 
-- � 6:00 �� 12:00 ������� ������ ���������� ����� "������ ����", � 12:00 �� 18:00 ������� ������ ���������� ����� "������ ����", 
-- � 18:00 �� 00:00 � "������ �����", � 00:00 �� 6:00 � "������ ����".

DROP FUNCTION IF EXISTS hello;

CREATE FUNCTION hello ()
RETURNS TEXT deterministic
begin
 DECLARE str TEXT DEFAULT 'returns';
  DECLARE time_now int;
  set time_now = DATE_FORMAT(NOW(), "%H");
  -- SELECT DATE_FORMAT(NOW(), "%H")INTO @time_now;
  IF(time_now between 6 and 12) THEN
  set str = '������ ����';
  elseif (time_now between 12 and 18) THEN
  set str = '������ ����';
  elseif (time_now between 18 and 24) THEN
  set str = '������ �����';
  else
  set str = '������ ����';
  END IF;
  RETURN str;
end

select hello ();


-- � ������� products ���� ��� ��������� ����: name � ��������� ������ � description � ��� ���������. ��������� ����������� ����� ����� ��� ���� �� ���. 
-- ��������, ����� ��� ���� ��������� �������������� �������� NULL �����������. ��������� ��������, ��������� ����, ����� ���� �� ���� ����� ��� 
-- ��� ���� ���� ���������. ��� ������� ��������� ����� NULL-�������� ���������� �������� ��������.
DROP TRIGGER IF EXISTS exept_null;

CREATE TRIGGER exept_null before INSERT ON products
FOR EACH ROW
begin
	if new.name is null and new.description is null then
		signal sqlstate '45000' set message_text = '������� �� ������� �������� ����� �/��� ��������';
	end if; 
END

INSERT products (name, description, price) VALUES ('Nokia 9', 'HDM Global', 41000);
INSERT products (name, description, price) VALUES (null, null, 1452);




