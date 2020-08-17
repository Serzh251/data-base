-- �������� ������� logs ���� Archive. ����� ��� ������ �������� ������ � �������� users, catalogs � products � 
-- ������� logs ���������� ����� � ���� �������� ������, �������� �������, ������������� ���������� ����� � ���������� ���� name.

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
  id_row int(10) unsigned NOT NULL AUTO_INCREMENT,
  table_name VARCHAR(255) COMMENT '�������� �������',
  name VARCHAR(255) COMMENT '�������� �������',
  updated_at DATETIME DEFAULT NOW(),
  PRIMARY KEY (id_row)
) ENGINE=Archive;

DROP TRIGGER IF EXISTS updated_products;
CREATE TRIGGER updated_products before INSERT ON products
FOR EACH ROW
begin
	insert into logs (table_name, name) values ('products', new.name);
end

INSERT products (name, description, price) VALUES ('Nokia 9', 'HDM Global', 41000);
 
DROP TRIGGER IF EXISTS updated_catalogs;
CREATE TRIGGER updated_catalogs before INSERT ON catalogs
FOR EACH ROW
begin
	insert into logs (table_name, name) values ('catalogs', new.name);
end

INSERT catalogs (name) VALUES ('����� �������');


DROP TRIGGER IF EXISTS updated_users;
CREATE TRIGGER updated_users before INSERT ON users
FOR EACH ROW
begin
	insert into logs (table_name, name) values ('users', new.name);
end

INSERT users (name, birthday_at) VALUES ('����', '1990-10-15');


-- (�� �������) �������� SQL-������, ������� �������� � ������� users ������� �������.
DROP PROCEDURE  IF exists insert_many;
CREATE PROCEDURE  insert_many (numb int)
begin
	DECLARE i INT DEFAULT 0;
	WHILE i  < numb DO
   		 INSERT users (name, birthday_at) VALUES ('����', '1990-10-15');
   	SET i = i + 1;
  END WHILE;
end

call insert_many (1000000);


-- � ���� ������ Redis ��������� ��������� ��� �������� ��������� � ������������ IP-�������.
set "192.168.1.1" 1 -- ����� ����� ��������� ��������� ��� ����� �������, �� �� �������
set "192.168.1.1" 2
set "192.168.1.1" 3
set "192.168.1.1" 4
set "192.168.1.1" 5

set "192.168.1.2" 1
set "192.168.1.2" 2

set "192.168.1.3" 1
set "192.168.1.3" 2
set "192.168.1.3" 3

get 192.168.1.1
get 192.168.1.2
get 192.168.1.3

-- ��� ������ ���� ������ Redis ������ ������ ������ ����� ������������ �� ������������ ������ � ��������, 
-- ����� ������������ ������ ������������ �� ��� �����.
HMSET users name  "support@softtime.info" "support@softtime.info" name
HGET users name
HGET users support@softtime.info

-- ����������� �������� ��������� � �������� ������� ������� ���� ������ shop � ���� MongoDB.
db.shop.insert({1: '����������'})
db.shop.insert({2: '����������� �����'})
db.shop.insert({3: '����������'})
db.shop.insert({4: '������� �����'})
db.shop.insert({5: '����������� ������'})
db.shop.insert({6: '����� �������'})

db.shop.insert({id: '1'}, { name: 'Intel Core i3-8100'}, {descriptions: '��������� ��� ���������� ������������ �����������, ���������� �� ��������� Intel.'}, {price: '7890.00'}, {catalog_id: '1'}, {created_at: '2020-08-02 16:25:45.0'}, {updated_at: '2020-08-02 16:25:45.0'})
db.shop.insert({id: '2'}, { name: 'Intel Core i5-7400'}, {descriptions: '��������� ��� ���������� ������������ �����������, ���������� �� ��������� Intel.'}, {price: '12700.00'}, {catalog_id: '1'}, {created_at: '2020-08-02 16:25:45.0'}, {updated_at: '2020-08-02 16:25:45.0'})
db.shop.insert({id: '3'}, { name: 'AMD FX-8320E'}, {descriptions: '��������� ��� ���������� ������������ �����������, ���������� �� ��������� AMD.'}, {price: '4780.00'}, {catalog_id: '1'}, {created_at: '2020-08-02 16:25:45.0'}, {updated_at: '2020-08-02 16:25:45.0'})
db.shop.insert({id: '4'}, { name: 'AMD FX-8320'}, {descriptions: '��������� ��� ���������� ������������ �����������, ���������� �� ��������� AMD.'}, {price: '7120.00'}, {catalog_id: '1'}, {created_at: '2020-08-02 16:25:45.0'}, {updated_at: '2020-08-02 16:25:45.0'})
db.shop.insert({id: '5'}, { name: 'ASUS ROG MAXIMUS X HERO'}, {descriptions: '����������� ����� ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX'}, {price: '19310.00'}, {catalog_id: '2'}, {created_at: '2020-08-02 16:25:45.0'}, {updated_at: '2020-08-02 16:25:45.0'})
db.shop.insert({id: '6'}, { name: 'Gigabyte H310M S2H'}, {descriptions: '����������� ����� Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX'}, {price: '4790.00'}, {catalog_id: '2'}, {created_at: '2020-08-02 16:25:45.0'}, {updated_at: '2020-08-02 16:25:45.0'})
db.shop.insert({id: '7'}, { name: 'MSI B250M GAMING PRO'}, {descriptions: '����������� ����� MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX'}, {price: '5060.00'}, {catalog_id: '2'}, {created_at: '2020-08-02 16:25:45.0'}, {updated_at: '2020-08-02 16:25:45.0'})


