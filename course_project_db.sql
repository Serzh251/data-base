drop database if exists components;
create database components character set UTF8;
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
    power_dissipation INT unsigned COMMENT '������������ ��������, ��',
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
    capacity BIGINT unsigned COMMENT '�������, �',
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
    frequency BIGINT unsigned COMMENT '�������, ���',
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
    rated_inductance BIGINT unsigned COMMENT '�������������, ��',
    rated_current INT unsigned COMMENT '����������� ���, �',
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
    power_dissipation INT unsigned COMMENT '������������ ��������, ��',
    rated_current INT unsigned COMMENT '����������� ���, �',
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
    power_dissipation INT unsigned COMMENT '������������ ��������, ��',
    rated_current INT unsigned COMMENT '����������� ���, �',
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
    rated_voltage BIGINT unsigned COMMENT '����������� ����������, �',
    pins_numb INT unsigned COMMENT '���-�� �����, ��.',
    rated_current INT unsigned COMMENT '����������� ���, �',
    type_body VARCHAR(100) COMMENT '��� �������',
    manufacturer VARCHAR(100) COMMENT '�������������',
    quantity BIGINT unsigned COMMENT '���-��, ��',
    FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
)COMMENT = '����������';

DROP TABLE IF EXISTS ordered;
CREATE TABLE ordered (
	id SERIAL PRIMARY key,
	catalog_id BIGINT UNSIGNED NOT NULL,
    `type` VARCHAR(100),
    part_number VARCHAR(100)COMMENT '�������',
    type_body VARCHAR(100) COMMENT '��� �������',
    manufacturer VARCHAR(100) COMMENT '�������������',
    quantity BIGINT unsigned COMMENT '���-��, ��',
    FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
)COMMENT = '������� ������� �� ����������';

DROP TABLE IF EXISTS optocouplers;
CREATE TABLE optocouplers (
	id SERIAL PRIMARY key,
	catalog_id BIGINT UNSIGNED NOT NULL,
    `type` VARCHAR(100),
    part_number VARCHAR(100)COMMENT '�������',
    reverse_voltage BIGINT unsigned COMMENT '�������� ����������, �',
    forward_current INT unsigned COMMENT '������ ���, �',
    type_body VARCHAR(100) COMMENT '��� �������',
    manufacturer VARCHAR(100) COMMENT '�������������',
    quantity BIGINT unsigned COMMENT '���-��, ��',
    FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
)COMMENT = '���������';
