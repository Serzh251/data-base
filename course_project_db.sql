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
    part_number VARCHAR(100)COMMENT 'артикул',
    resistance BIGINT unsigned COMMENT 'сопротивление, ом',
    power_dissipation INT unsigned COMMENT 'рассеиваемая мощность, вт',
    standardized_limit INT unsigned COMMENT 'нормированный допуск, %',
    type_body VARCHAR(100) COMMENT 'тип корпуса',
    manufacturer VARCHAR(100) COMMENT 'производитель',
    quantity BIGINT unsigned COMMENT 'кол-во, шт',
    FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
)COMMENT = 'резисторы';

DROP TABLE IF EXISTS capacitors;
CREATE TABLE capacitors (
	id SERIAL PRIMARY key,
	catalog_id BIGINT UNSIGNED NOT NULL,
    `type` VARCHAR(100),
    part_number VARCHAR(100)COMMENT 'артикул',
    capacity BIGINT unsigned COMMENT 'емкость, ф',
    voltage INT unsigned COMMENT 'номинальное напряжение, в',
    standardized_limit INT unsigned COMMENT 'нормированный допуск, %',
    type_body VARCHAR(100) COMMENT 'тип корпуса',
    manufacturer VARCHAR(100) COMMENT 'производитель',
    quantity BIGINT unsigned COMMENT 'кол-во, шт',
    FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
)COMMENT = 'конденсаторы';

DROP TABLE IF EXISTS quartz;
CREATE TABLE quartz (
	id SERIAL PRIMARY key,
	catalog_id BIGINT UNSIGNED NOT NULL,
    part_number VARCHAR(100)COMMENT 'артикул',
    frequency BIGINT unsigned COMMENT 'частота, МГц',
    stability INT unsigned COMMENT 'стабильность при 25гр С',
    type_body VARCHAR(100) COMMENT 'тип корпуса',
    manufacturer VARCHAR(100) COMMENT 'производитель',
    quantity BIGINT unsigned COMMENT 'кол-во, шт',
    FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
)COMMENT = 'кварцевый резонатор';

DROP TABLE IF EXISTS inductors;
CREATE TABLE inductors (
	id SERIAL PRIMARY key,
	catalog_id BIGINT UNSIGNED NOT NULL,
    part_number VARCHAR(100)COMMENT 'артикул',
    rated_inductance BIGINT unsigned COMMENT 'индуктивность, Гн',
    rated_current INT unsigned COMMENT 'номинальный ток, А',
    standardized_limit INT unsigned COMMENT 'нормированный допуск, %',
    type_body VARCHAR(100) COMMENT 'тип корпуса',
    manufacturer VARCHAR(100) COMMENT 'производитель',
    quantity BIGINT unsigned COMMENT 'кол-во, шт',
    FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
)COMMENT = 'индуктивности';

DROP TABLE IF EXISTS diode;
CREATE TABLE diode (
	id SERIAL PRIMARY key,
	catalog_id BIGINT UNSIGNED NOT NULL,
    `type` VARCHAR(100),
    part_number VARCHAR(100)COMMENT 'артикул',
    rated_voltage BIGINT unsigned COMMENT 'макс обратное напряжение, В',
    power_dissipation INT unsigned COMMENT 'рассеиваемая мощность, Вт',
    rated_current INT unsigned COMMENT 'номинальный ток, А',
    type_body VARCHAR(100) COMMENT 'тип корпуса',
    manufacturer VARCHAR(100) COMMENT 'производитель',
    quantity BIGINT unsigned COMMENT 'кол-во, шт',
    FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
)COMMENT = 'диоды';

DROP TABLE IF EXISTS transistors;
CREATE TABLE transistors (
	id SERIAL PRIMARY key,
	catalog_id BIGINT UNSIGNED NOT NULL,
    `type` VARCHAR(100),
    part_number VARCHAR(100)COMMENT 'артикул',
    rated_voltage_drain_Soure BIGINT unsigned COMMENT 'макс напряжение сток исток, В',
    power_dissipation INT unsigned COMMENT 'рассеиваемая мощность, Вт',
    rated_current INT unsigned COMMENT 'номинальный ток, А',
    type_body VARCHAR(100) COMMENT 'тип корпуса',
    manufacturer VARCHAR(100) COMMENT 'производитель',
    quantity BIGINT unsigned COMMENT 'кол-во, шт',
    FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
)COMMENT = 'транзисторы';

DROP TABLE IF EXISTS chips;
CREATE TABLE chips (
	id SERIAL PRIMARY key,
	catalog_id BIGINT UNSIGNED NOT NULL,
    `type` VARCHAR(100),
    part_number VARCHAR(100)COMMENT 'артикул',
    rated_voltage BIGINT unsigned COMMENT 'номинальное напряжение, В',
    pins_numb INT unsigned COMMENT 'кол-во пинов, шт.',
    rated_current INT unsigned COMMENT 'номинальный ток, А',
    type_body VARCHAR(100) COMMENT 'тип корпуса',
    manufacturer VARCHAR(100) COMMENT 'производитель',
    quantity BIGINT unsigned COMMENT 'кол-во, шт',
    FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
)COMMENT = 'микросхемы';

DROP TABLE IF EXISTS ordered;
CREATE TABLE ordered (
	id SERIAL PRIMARY key,
	catalog_id BIGINT UNSIGNED NOT NULL,
    `type` VARCHAR(100),
    part_number VARCHAR(100)COMMENT 'артикул',
    type_body VARCHAR(100) COMMENT 'тип корпуса',
    manufacturer VARCHAR(100) COMMENT 'производитель',
    quantity BIGINT unsigned COMMENT 'кол-во, шт',
    FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
)COMMENT = 'таблица заказов на пополнение';

DROP TABLE IF EXISTS optocouplers;
CREATE TABLE optocouplers (
	id SERIAL PRIMARY key,
	catalog_id BIGINT UNSIGNED NOT NULL,
    `type` VARCHAR(100),
    part_number VARCHAR(100)COMMENT 'артикул',
    reverse_voltage BIGINT unsigned COMMENT 'обратное напряжение, в',
    forward_current INT unsigned COMMENT 'прямой ток, А',
    type_body VARCHAR(100) COMMENT 'тип корпуса',
    manufacturer VARCHAR(100) COMMENT 'производитель',
    quantity BIGINT unsigned COMMENT 'кол-во, шт',
    FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
)COMMENT = 'резисторы';
