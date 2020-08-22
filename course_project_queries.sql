-- выборка резисторов с корпусом smd 0802 и произведенные Panasonic
select * from resistors where type_body = 'smd_0802' and manufacturer = 'Panasonic';

-- выборка конденсаторов с рабочим напр€жением более 100¬, сортировка по возрастанию
select * from capacitors where voltage > 100 order by voltage desc;

-- выборка диодов, соответствующих по току индуктивност€м
SELECT
  d.part_number as part_number_diode,
  d.manufacturer,
  d.rated_current,
  i.part_number as part_number_inductors,
  i.manufacturer
FROM
  diode AS d JOIN inductors AS i
ON
  d.rated_current = i.rated_current;
 
-- выборка диодов, индуктивностей, резисторов с одинаковым производителем
SELECT
  d.part_number as part_number_diode,
  o.part_number as part_number_inductors,
  r.part_number as part_number_resistors
FROM
  diode AS d 
 JOIN optocouplers AS o on d.manufacturer = o.manufacturer
 JOIN resistors AS r on r.manufacturer = d.manufacturer; 

-- выборка микросхем с корпусом dip8 и производителем Analog Devices, объединенна€ с выборкой диодов с корпусом R-6/P600, отсортировано по ном. напр€жению
select part_number, `type`, rated_voltage, quantity from chips where type_body = 'dip8' and manufacturer = 'Analog Devices'
union 
select part_number, `type`, rated_voltage, quantity from diode where type_body = 'R-6/P600' order by rated_voltage desc ;

-- выборка резисторов с минимальной рассеиваемой мощностью
select 
  part_number, manufacturer, power_dissipation
FROM
  resistors
WHERE
  power_dissipation = (SELECT min(power_dissipation) FROM resistors);
 
 -- создание представлени€ таблицы резисторов отсортированное по рассеиваемой мощности
 drop view if exists resistors_view;
 CREATE VIEW resistors_view AS SELECT * FROM resistors ORDER BY power_dissipation;
 select * from resistors_view;
 
 -- создание представлени€ таблицы микросхем с типом микроконтроллеры отсортированное по номинальной частоте
 drop view if exists chips_view;
 CREATE VIEW chips_view AS SELECT * FROM chips where `type` = 'Microcontroller' ORDER BY rated_frequency desc;
 select * from chips_view;

-- триггер дл€ вы€влени€ ошибки ввода не стандартного типа корпуса дл€ smd резисторов
DROP TRIGGER IF EXISTS exept_type_body_resistors;
CREATE TRIGGER exept_type_body_resistors before INSERT ON resistors
FOR EACH ROW
begin
	 if new.`type` = 'smd_resistor' then
		if new.type_body <> 'smd_0402' and new.type_body <> 'smd_0603' and new.type_body <> 'smd_0805'and new.type_body <> 'smd_1206'
		and new.type_body <> 'smd_2010'and new.type_body <> 'smd_2512' then
			signal sqlstate '45000' set message_text = 'введите стандартный тип корпуса дл€ smd резистора';
		end if; 
	 end if;
end
insert into resistors (catalog_id, `type`, part_number, resistance, power_dissipation, standardized_limit, type_body, manufacturer, quantity) values
(1, 'smd_resistor', 'ERJP06F5362V', 53600, 0.125, 1, 'smd_0603', 'Panasonic', 200);

-- триггер дл€ вы€влени€ ошибки ввода нулевого значени€ артикула или количества конденсаторов
DROP TRIGGER IF EXISTS exept_insert_capacitors;
CREATE TRIGGER exept_insert_capacitors before INSERT ON capacitors
FOR EACH ROW
begin
	 if new.part_number is null or new.quantity is null then
		signal sqlstate '45000' set message_text = 'введите не нулевое значение артикула и количества';
	 end if;
end

insert into capacitors (catalog_id, `type`, part_number, capacity, voltage, standardized_limit, type_body, manufacturer, quantity) values 
	(1, 'membranous', 'B32320I2656J011', 65, 350, 5, '40х58', 'Epcos', 1000);

-- удаление позиций из таблицы orders если данна€ позици€ имеетс€ в наличии в количестве более 100 шт
-- к сожалению процедура получилась сложной, отладить не удалось, но в целом алгоритм вроде как рабочий
DROP PROCEDURE IF EXISTS update_orders;
CREATE PROCEDURE update_orders ()
begin
	 DECLARE i INT DEFAULT 0;
     DECLARE count_numb INT DEFAULT 0;
	 SET count_numb = (select count(*) from ordered);

    WHILE i < count_numb DO
		SET i = i + 1;
		select
		case type_element
		    WHEN 'capacitors'
					if (select quantity from capacitors where part_number = (SELECT part_number from ordered where id = 1)) > 100
						then delete from ordered where id = i;
					end if;  
		    WHEN 'diode' 
					if (select quantity from diode where part_number = (SELECT part_number from ordered where id = 1)) > 100
						then delete from ordered where id = i;
					end if;  
		    WHEN 'inductors' 
					if (select quantity from inductors where part_number = (SELECT part_number from ordered where id = 1)) > 100
						then delete from ordered where id = i;
					end if;  
		    WHEN 'optocouplers' 
		        then 
					if (select quantity from optocouplers where part_number = (SELECT part_number from ordered where id = 1)) > 100
						then delete from ordered where id = i;
					end if;  
		    WHEN 'chip'
		        then 
					if (select quantity from chips where part_number = (SELECT part_number from ordered where id = 1)) > 100
						then delete from ordered where id = i;
					end if;
		    WHEN 'quartz' 
					if (select quantity from quartz where part_number = (SELECT part_number from ordered where id = 1)) > 100
						then delete from ordered where id = i;
					end if;  
		    WHEN 'resistors' 
					if (select quantity from resistors where part_number = (SELECT part_number from ordered where id = 1)) > 100
						then delete from ordered where id = i;
					end if;  
		    WHEN 'transistors' 
					if (select quantity from transistors where part_number = (SELECT part_number from ordered where id = 1)) > 100
						then delete from ordered where id = i;
					end if;  
		end AS Category
		FROM ordered where id = i;
    END WHILE;
end

call update_orders();


