-- � ���� ������ shop � sample ������������ ���� � �� �� �������, ������� ���� ������. 
-- ����������� ������ id = 1 �� ������� shop.users � ������� sample.users. ����������� ����������.
INSERT INTO sample.users (id, name)
SELECT id, name
FROM shop.users 
WHERE  id = 1;


-- �������� �������������, ������� ������� �������� name �������� ������� �� ������� products
-- � ��������������� �������� �������� name �� ������� catalogs.
CREATE VIEW cat_names (name_goods, catalog_name)
AS select name, (select name from catalogs where id = catalog_id) as catalog_name from products;