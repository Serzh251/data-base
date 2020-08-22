-- � ������ ���� ������ �������� ���������� �� ������� ����������������. � ������� ordered ���������� � ����������� � ������ (��� ���������)
-- ��� ���������� ������� ������������. � ������ ������� ���� �������, ������������� � �������� �������������� ����������.

drop database if exists components;
create database components CHARACTER SET utf8 COLLATE utf8_general_ci;
use components;

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
	id SERIAL PRIMARY KEY,
	name VARCHAR(120) unique
);

DROP TABLE IF EXISTS resistors;
CREATE TABLE resistors (
	id SERIAL PRIMARY key,
	catalog_id BIGINT UNSIGNED NOT NULL,
    `type` VARCHAR(100),
    part_number VARCHAR(100)COMMENT '�������',
    resistance BIGINT unsigned COMMENT '�������������, ��',
    power_dissipation float unsigned COMMENT '������������ ��������, ��',
    standardized_limit INT unsigned COMMENT '������������� ������, %',
    type_body VARCHAR(100) COMMENT '��� �������',
    manufacturer VARCHAR(100) COMMENT '�������������',
    quantity BIGINT unsigned COMMENT '���-��, ��',
    FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
)COMMENT = '���������';

DROP TABLE IF EXISTS capacitors;
CREATE TABLE capacitors (
	id SERIAL PRIMARY key,
	catalog_id BIGINT UNSIGNED NOT NULL,
    `type` VARCHAR(100),
    part_number VARCHAR(100)COMMENT '�������',
    capacity float unsigned COMMENT '�������, ���',
    voltage INT unsigned COMMENT '����������� ����������, �',
    standardized_limit INT unsigned COMMENT '������������� ������, %',
    type_body VARCHAR(100) COMMENT '��� �������',
    manufacturer VARCHAR(100) COMMENT '�������������',
    quantity BIGINT unsigned COMMENT '���-��, ��',
    FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
)COMMENT = '������������';

DROP TABLE IF EXISTS quartz;
CREATE TABLE quartz (
	id SERIAL PRIMARY key,
	catalog_id BIGINT UNSIGNED NOT NULL,
    part_number VARCHAR(100)COMMENT '�������',
    frequency float COMMENT '�������, ���',
    stability INT unsigned COMMENT '������������ ��� 25�� �',
    type_body VARCHAR(100) COMMENT '��� �������',
    manufacturer VARCHAR(100) COMMENT '�������������',
    quantity BIGINT unsigned COMMENT '���-��, ��',
    FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
)COMMENT = '��������� ���������';

DROP TABLE IF EXISTS inductors;
CREATE TABLE inductors (
	id SERIAL PRIMARY key,
	catalog_id BIGINT UNSIGNED NOT NULL,
    part_number VARCHAR(100)COMMENT '�������',
    rated_inductance float(10,3) unsigned COMMENT '�������������, ����',
    rated_current FLOAT(10,3) UNSIGNED COMMENT '����������� ���, �',
    standardized_limit INT unsigned COMMENT '������������� ������, %',
    type_body VARCHAR(100) COMMENT '��� �������',
    manufacturer VARCHAR(100) COMMENT '�������������',
    quantity BIGINT unsigned COMMENT '���-��, ��',
    FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
)COMMENT = '�������������';

DROP TABLE IF EXISTS diode;
CREATE TABLE diode (
	id SERIAL PRIMARY key,
	catalog_id BIGINT UNSIGNED NOT NULL,
    `type` VARCHAR(100),
    part_number VARCHAR(100)COMMENT '�������',
    rated_voltage BIGINT unsigned COMMENT '���� �������� ����������, �',
    rated_current float unsigned COMMENT '����������� ���, �',
    type_body VARCHAR(100) COMMENT '��� �������',
    manufacturer VARCHAR(100) COMMENT '�������������',
    quantity BIGINT unsigned COMMENT '���-��, ��',
    FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
)COMMENT = '�����';

DROP TABLE IF EXISTS transistors;
CREATE TABLE transistors (
	id SERIAL PRIMARY key,
	catalog_id BIGINT UNSIGNED NOT NULL,
    `type` VARCHAR(100),
    part_number VARCHAR(100)COMMENT '�������',
    rated_voltage_drain_Soure BIGINT unsigned COMMENT '���� ���������� ���� �����, �',
    rated_current float unsigned COMMENT '����������� ���, �',
    type_body VARCHAR(100) COMMENT '��� �������',
    manufacturer VARCHAR(100) COMMENT '�������������',
    quantity BIGINT unsigned COMMENT '���-��, ��',
    FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
)COMMENT = '�����������';

DROP TABLE IF EXISTS chips;
CREATE TABLE chips (
	id SERIAL PRIMARY key,
	catalog_id BIGINT UNSIGNED NOT NULL,
    `type` VARCHAR(100),
    part_number VARCHAR(100)COMMENT '�������',
    rated_voltage float (5, 2) unsigned COMMENT '����������� ����������, �',
    rated_frequency float unsigned COMMENT '������� �������, ���.',
    type_body VARCHAR(100) COMMENT '��� �������',
    manufacturer VARCHAR(100) COMMENT '�������������',
    quantity BIGINT unsigned COMMENT '���-��, ��',
    FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
)COMMENT = '����������';

DROP TABLE IF EXISTS ordered;
CREATE TABLE ordered (
	id SERIAL PRIMARY key,
	type_element VARCHAR(100)COMMENT '��� ��������',
    part_number VARCHAR(100)COMMENT '�������',
    type_body VARCHAR(100) COMMENT '��� �������',
    manufacturer VARCHAR(100) COMMENT '�������������',
    quantity BIGINT unsigned COMMENT '���-��, ��'
)COMMENT = '������� ������� �� ����������';

DROP TABLE IF EXISTS optocouplers;
CREATE TABLE optocouplers (
	id SERIAL PRIMARY key,
	catalog_id BIGINT UNSIGNED NOT NULL,
    `type` VARCHAR(100),
    part_number VARCHAR(100)COMMENT '�������',
    reverse_voltage BIGINT unsigned COMMENT '�������� ����������, �',
    forward_current float unsigned COMMENT '������ ���, �',
    type_body VARCHAR(100) COMMENT '��� �������',
    manufacturer VARCHAR(100) COMMENT '�������������',
    quantity BIGINT unsigned COMMENT '���-��, ��',
    FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
)COMMENT = '���������';
