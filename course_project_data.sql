-- наполнение таблиц данными

insert into catalogs (name) values 
	('Пассивные компоненты'),
	('Активные компоненты');
	
insert into resistors (catalog_id, `type`, part_number, resistance, power_dissipation, standardized_limit, type_body, manufacturer, quantity) values 
	(1, 'smd_resistor', 'ERJ6ENF2050V', 205, 0.125, 1, 'smd_0802', 'Panasonic', 100),
	(1, 'smd_resistor', 'ERJ6ENF6811V', 6810, 0.125, 1, 'smd_0802', 'Panasonic', 100),
	(1, 'smd_resistor', 'ERJP06F5362V', 53600, 0.125, 1, 'smd_0802', 'Panasonic', 200),
	(1, 'smd_resistor', 'ERJ3EKF9311V', 100000, 0.1, 1, 'smd_0603', 'Panasonic', 300),
	(1, 'smd_resistor', 'ERJ8ENF1804V', 1800000, 0.25, 1, 'smd_1206', 'Panasonic', 500),
	(1, 'smd_resistor', 'ERJP06F2103V', 210000, 0.125, 1, 'smd_0802', 'Panasonic', 556),
	(1, 'smd_resistor', 'ERJP08F13R3V', 13, 0.125, 1, 'smd_0802', 'Panasonic', 789),
	(1, 'smd_resistor', 'ERJ6ENF3570V', 357, 0.125, 1, 'smd_0802', 'Panasonic', 15),
	(1, 'smd_resistor', 'ERJP08F4753V', 457000, 0.25, 1, 'smd_1206', 'Panasonic', 789),
	(1, 'smd_resistor', 'ERJ2RKF2321X', 2320000, 0.1, 1, 'smd_0402', 'Panasonic', 45),
	(1, 'smd_resistor', 'ERJ6RBD1001V', 1000, 0.125, 1, 'smd_0802', 'Panasonic', 86),
	(1, 'smd_resistor', 'ERJ6BQF8R2V', 8, 0.25, 1, 'smd_0802', 'Panasonic', 456),
	(1, 'smd_resistor', 'ERJ6ENF1433V', 143000, 0.125, 1, 'smd_0802', 'Panasonic', 789),
	(1, 'smd_resistor', 'ERJM1WSF5M0U', 5000000, 1, 1, 'smd_2512', 'Panasonic', 755),
	(1, 'smd_resistor', 'ERJ3BQF1R0V', 1, 0.125, 1, 'smd_0602', 'Panasonic', 55),
	(1, 'smd_resistor', 'ERJ8BWFR012V', 15000, 0.5, 5, 'smd_1206', 'Panasonic', 13),
	(1, 'smd_resistor', 'ERJB2CFR012V', 12000000, 1, 1, 'smd_1206', 'Panasonic', 90),
	(1, 'smd_resistor', 'ERJM1WTF1M5U', 1500000, 1, 1, 'smd_1206', 'Panasonic', 100),
	(1, 'smd_resistor', 'CR0805-FX-4991ELF', 4990000, 0.125, 1, 'smd_0802', 'Bourns', 4500),
	(1, 'smd_resistor', 'CR0603-FX-2493ELF', 249000, 0.1, 1, 'smd_0603', 'Bourns', 15660),
	(1, 'smd_resistor', 'CRL2010-FW-R680ELF', 680, 0.75, 1, 'smd_2010', 'Bourns', 780),
	(1, 'smd_resistor', 'CR0805-JW-103ELF', 10000, 0.125, 5, 'smd_0802', 'Bourns', 1000),
	(1, 'smd_resistor', 'CRM2512-JW-100ELF', 10, 2, 5, 'smd_2512', 'Bourns', 300),
	(1, 'smd_resistor', 'CHV2512-JW-106ELF', 10000000, 1, 5, 'smd_2512', 'Bourns', 4500),
	(1, 'smd_resistor', 'CR2010-JW-100ELF', 10, 0.5, 5, 'smd_2010', 'Bourns', 1580),
	(1, 'с1-4', 'CF-1W-1RJ', 1, 1, 5, 'axial', 'Тайвань', 1000),
	(1, 'MRS25', 'MRS25000C6000FCT00', 600, 0.6, 5, 'axial', 'Vishay', 300),
	(1, 'Trimming Potentiometer', '3006P-1-101LF', 100, 0.75, 10, '3006P', 'Bourns', 500);
	
	
insert into capacitors (catalog_id, `type`, part_number, capacity, voltage, standardized_limit, type_body, manufacturer, quantity) values 
	(1, 'membranous', 'B32320I2656J011', 65, 350, 5, '40х58', 'Epcos', 1000),
	(1, 'metal-film', 'B32656S0105J561', 1, 1000, 5, 'MKP BOX', 'Epcos', 200),
	(1, 'metal-film', 'B32683A0223K000', 0.022, 1000, 10, 'b32683', 'Epcos', 300),
	(1, 'electrolytic', 'B32320I2656J011', 0.22, 50, 20, '5x11мм', 'JB', 70),
	(1, 'electrolytic', 'JRB2C010M02500630110000B', 1, 160, 20, '6.3x11мм', 'JB', 500),
	(1, 'electrolytic', 'JRB2G3R3M03500800120000B', 3.3, 400, 20, '8x12мм', 'JB', 780),	
	(1, 'electrolytic', 'B32320I2656J011', 0.47, 100, 20, '5х11', 'Epcos', 563),
	(1, 'supercapacitor', 'DCS5R5224H', 220, 5, 30, 'H-TYPE', 'KORCHIP', 20),	
	(1, 'metal-paper', 'PME261EA4680KR19T0', 0.0068, 300, 10, 'radial', 'Kemet Electronics', 478),
	(1, 'metal-paper', '584106729', 0.25, 1000, 10, 'МБГЧ-1', 'Россия', 562),	
	(1, 'metal-paper', 'PME271MB6100MR30', 0.1, 630, 20, 'radial', 'Kemet Electronics', 431),
	(1, 'metal-paper', ' МБГЧ-1-2А-250-1', 0.1, 250, 10, 'МБГЧ-1', 'Россия', 252),	
	(1, 'smd_capasitor', 'CL21C6R8CBANNNC', 0.025, 50, 20, 'smd_0805', 'Samsung Electronics', 258),
    (1, 'smd_capasitor', 'CL32B106KBJNNNE', 10, 50, 20, 'smd_1210', 'Samsung Electronics', 789),		
	(1, 'smd_capasitor', 'CL10F103ZB8NNNC', 0.1, 50, 20, 'smd_0603', 'Samsung Electronics', 425),
    (1, 'smd_capasitor', 'CL21C6R8CBANNNC', 0.022, 50, 10, 'smd_0805', 'Samsung Electronics', 120),
    (1, 'smd_capasitor', 'CL31B473KDFNNNE', 0.047, 200, 10, 'smd_1206', 'Samsung Electronics', 1000),
    (1, 'smd_capasitor', 'CL10F334ZA8NNNC', 0.33, 25, 10, 'smd_0603', 'Samsung Electronics', 784),
    (1, 'smd_capasitor', 'CL43B684KBFNNNE', 0.68, 50, 10, 'smd_1812', 'Samsung Electronics', 589),
    (1, 'smd_capasitor', 'CL32A106KOJNNNE', 10, 50, 10, 'smd_1210', 'Samsung Electronics', 468),
    (1, 'smd_capasitor', 'CL21F105ZAFNNNE', 1, 50, 20, 'smd_0805', 'Samsung Electronics', 794);
    
   
insert into quartz (catalog_id, part_number, frequency, stability, type_body, manufacturer, quantity) values 
	(1,'1.8432MHzHC-49U', 1.8432, 3, 'HC-49U', 'China', 100),
    (1,'2.4576MHzHC-49U', 2.4576, 3, 'HC-49U', 'China', 120),
	(1,'3.000MHzHC-49U', 3, 3, 'HC-49U', 'China', 12),
    (1,'6.144MHzHC-49U', 6.144, 3, 'HC-49U', 'China', 45),	
	(1,'7.3728MHzHC-49US', 7.3728, 3, 'HC-49S', 'China', 69),
    (1,'8.867238MHzHC-49U', 8.867238, 3, 'HC-49U', 'China', 78),
	(1,'9.8304MHzHC-49U', 9.8304, 3, 'HC-49U', 'China', 65),
    (1,'10.240MHzHC-49U', 10.240, 3, 'HC-49U', 'China', 32),    
	(1,'11.0592MHzHC-49SM', 11.0592, 3, 'HC-49SM', 'China', 23),
    (1,'12.288MHzHC-49U', 12.288, 3, 'HC-49U', 'China', 78),    
	(1,'13.875MHzHC-49U', 13.875, 3, 'HC-49U', 'China', 96),
    (1,'14.7456MHzHC-49US', 14.7456, 3, 'HC-49US', 'China', 85),
	(1,'16.384MHzHC-49U', 3, 3, 'HC-49U', 'China', 56),
    (1,'17.734475MHzHC-49U', 17.734475, 3, 'HC-49U', 'China', 43),	
	(1,'21.480MHzHC-49U', 21.480, 3, 'HC-49U', 'China', 120),
    (1,'22.1184MHzHC-49US', 22.1184, 3, 'HC-49U', 'China', 450),
	(1,'26.480MHzHC-49U', 26.48, 3, 'HC-49U', 'China', 32),
    (1,'27.145MHzHC-49U', 27.145, 3, 'HC-49U', 'China', 78),    
	(1,'32.768MHzHC-49US', 32.768, 3, 'HC-49SM', 'China', 58),
    (1,'72.470MHzHC-49U', 72.47, 3, 'HC-49U', 'China', 89);       
    
    
insert into inductors (catalog_id, part_number, rated_inductance, rated_current, standardized_limit, type_body, manufacturer, quantity) values 
	(1,'B82432A1102K000', 1, 0.6, 10, 'smd_1812', 'Epcos', 1000),
    (1,'B82432A1103K000', 10, 0.6, 10, 'smd_1812', 'Epcos', 200),
	(1,'B82432A1105J000', 1000, 0.6, 10, 'smd_1812', 'Epcos', 200),
	(1,'B82432A1152K000', 1.5, 0.6, 10, 'smd_1812', 'Epcos', 300),
	(1,'B82432A1153K000', 15, 0.6, 10, 'smd_1812', 'Epcos', 445),
    (1,'B82432A1223K000', 220, 0.26, 10, 'smd_1812', 'Epcos', 125),
	(1,'B82432A1272K000', 2.7, 0.45, 10, 'smd_1812', 'Epcos', 458),
	(1,'B82432A1334K000', 330, 0.085, 10, 'smd_1812', 'Epcos', 456),	
	(1,'B82432A1473K000', 470, 0.21, 10, 'smd_1812', 'Epcos', 369),
    (1,'B82432A1563K000', 56, 0.2, 10, 'smd_1812', 'Epcos', 753),
	(1,'B82432A1684K000', 680, 0.065, 10, 'smd_1812', 'Epcos', 357),
	(1,'B82141A1102K', 1, 0.725, 10, 'radial', 'Epcos', 963),	
	(1,'B82141A1103K', 10, 0.41, 10, 'radial', 'Epcos', 159),
    (1,'B82141A1122K000', 1.2, 0.7, 10, 'radial', 'Epcos', 951),
	(1,'B82141A1124J', 120, 0.6, 10, 'radial', 'Epcos', 458),
	(1,'B82141A1153J', 15, 0.365, 10, 'radial', 'Epcos', 854),	
	(1,'B82141A1182K', 1.8, 0.66, 10, 'radial', 'Epcos', 365),
    (1,'B82141A1223K', 22, 0.335, 10, 'radial', 'Epcos', 748),
	(1,'B82141A1334J', 330, 0.105, 10, 'radial', 'Epcos', 185);
	
insert into diode (catalog_id, `type`, part_number, rated_voltage, rated_current, type_body, manufacturer, quantity) values 
	(2,'Rectifier diodes', '10A10', 1000, 10, 'R-6/P600', 'China', 121),
	(2,'Rectifier diodes', '1N4001', 50, 0.2, 'DO-204AL/DO-41', 'DC Components', 10),
	(2,'Rectifier diodes', '1N4007', 1000, 1, 'DO-204AL/DO-41', 'DC Components', 12),
	(2,'Rectifier diodes', '1N4018', 1000, 1, 'DO-204AL/DO-41', 'DC Components', 56),
	(2,'Rectifier diodes', '1N5400', 50, 3, 'DO-201AD', 'DC Components', 45),
	(2,'Rectifier diodes', 'P600A', 50, 6, 'R-6/P600', 'Diotec Semiconductor', 54),
	(2,'Rectifier diodes', 'P600D', 200, 6, 'R-6/P600', 'Diotec Semiconductor', 66),
	(2,'Rectifier diodes', 'P600J', 600, 0.2, 'R-6/P600', 'Diotec Semiconductor', 75),
	(2,'Rectifier diodes', 'P600M', 1000, 6, 'R-6/P600', 'Diotec Semiconductor', 15),	
	(2,'Power diodes', 'VS-40HF160', 1600, 40, 'DO-203AB/DO-5', 'Vishay', 72),	
	(2,'Power diodes', 'VS-25FR120M', 1200, 25, 'DO-4', 'Vishay', 63),	
	(2,'Power diodes', '12FR120M', 1200, 12, 'DO203AA', 'Vishay', 36),	
    (2,'Schottky diodes', '80SQ045NRLG', 45, 8, 'DO-27', 'ON Semiconductor', 70),	
    (2,'Schottky diodes', 'BAT54HT1G', 30, 0.2, 'SOD-323', 'ON Semiconductor', 100),	
    (2,'Schottky diodes', 'MBR10100G', 100, 10, 'TO-220', 'ON Semiconductor', 158),	
    (2,'Schottky diodes', 'MBR1645G', 45, 16, 'TO-220', 'ON Semiconductor', 729),	
    (2,'Schottky diodes', 'MBRB20100CTG', 100, 10, 'D2PAK', 'ON Semiconductor', 957),	
    (2,'Schottky diodes', 'MBRS4201T3G', 200, 4, 'DO-214AB', 'ON Semiconductor', 458),
    (2,'Schottky diodes', 'SB560', 60, 5, 'DO-27', 'ON Semiconductor', 741);	
    
insert into transistors (catalog_id, `type`, part_number, rated_voltage_drain_Soure, rated_current, type_body, manufacturer, quantity) values 
	(2,'bipolar transistors', '2N3904', 60, 0.2, 'to-92', 'Diotec Semiconductor', 1000),
	(2,'bipolar transistors', '2N5551', 160, 0.6, 'to-92', 'Diotec Semiconductor', 1300), 
	(2,'bipolar transistors', 'BC547A', 45, 0.1, 'to-92', 'Diotec Semiconductor', 1050), 
	(2,'bipolar transistors', 'C808-16', 25, 0.8, 'sot-23', 'Diotec Semiconductor', 400), 
	(2,'bipolar transistors', 'BC847S', 45, 0.1, 'SOT-363', 'Diotec Semiconductor', 55), 
	(2,'MOSFET', 'AUIRF1010Z', 55, 94, 'to-220', 'International Rectifier', 45), 
	(2,'MOSFET', 'AUIRF2804S-7P', 40, 320, 'd2pak-7', 'International Rectifier', 32),
    (2,'MOSFET', 'AUIRF3004WL', 40, 386, 'to262wl0', 'International Rectifier', 43), 
    (2,'MOSFET', 'AUIRF4905', 55, 74, 'to-220', 'International Rectifier', 76),
    (2,'MOSFET', 'AUIRFP2907', 75, 209, 'to-247', 'International Rectifier', 58), 
    (2,'MOSFET', 'IRF5852TRPBF', 20, 2.7, 'TSOP-6', 'International Rectifier', 65), 
    (2,'MOSFET', 'IRF630NSPBF', 200, 9.5, 'd2pak-7', 'International Rectifier', 57), 
    (2,'MOSFET', 'IRFH3702TRPBF', 30, 16, 'PQFN-3x3', 'International Rectifier', 1256), 
    (2,'MOSFET', 'IRFH8318TRPBF', 30, 50, 'PQFN-5x6', 'International Rectifier', 452), 
    (2,'IGBTs', 'IRG4BC20KDPBF', 600, 16, 'to-220', 'International Rectifier', 84), 
    (2,'IGBTs', 'IRG4PC40FDPBF', 600, 49, '	to-247ac', 'International Rectifier', 258), 
    (2,'IGBTs', 'IRG4PH30KPBF', 1200, 10, '	to-247ac', 'International Rectifier', 758), 
    (2,'IGBTs', 'IRG4PSC71UDPBF', 600, 85, 'super-247', 'International Rectifier', 523),
    (2,'IGBTs', 'IRG4BC30FD-SPBF', 600, 28, 'd2-pak', 'International Rectifier', 125),
    (2,'JFET', 'IRG4IBC30KDPBF', 35, 0.005, 'to-92', 'ON Semiconductor', 425),
    (2,'JFET', 'MCH5908H-TL-E', 16, 0.016, 'd2pak-7', 'ON Semiconductor', 245),
    (2,'JFET', 'NSVJ3910SB3T1G', 25, 0.002, 'sot-23', 'ON Semiconductor', 25);
    
insert into chips (catalog_id, `type`, part_number, rated_voltage, rated_frequency, type_body, manufacturer, quantity) values 
	(2,'DC-DC Converters', 'ADM660ANZ', 7, 100, 'dip8', 'Analog Devices', 458),
	(2,'DC-DC Converters', 'L4978', 50, 300, 'dip8', 'ST Microelectronics', 558),
	(2,'DC-DC Converters', 'LM2594N-5.0/NOPB', 40, 150, 'dip8', 'Texas Instruments', 458),
	(2,'DC-DC Converters', 'MC34063ABN', 40, 42, 'dip8', 'ST Microelectronics', 78),
	(2,'DC-DC Converters', 'MAX764EPA+', 16, 300, 'dip8', 'Maxim Integrated Productss', 58),
	(2,'DAC', 'AD1933WBSTZ', 3.6, 192, 'LQFP-64', 'Analog Devices', 789),
	(2,'DAC', 'AD420ANZ-32', 32, 192, 'dip24', 'Analog Devices', 100),
	(2,'DAC', 'AD7390ARZ', 5.5, 192, 'soic-8', 'Analog Devices', 578),
	(2,'DAC', 'AD7233ANZ', 16.5, 192, 'dip8', 'Analog Devices', 123),
	(2,'Microcontroller', 'AT89C2051-24SU', 6, 24, 'soic-20', 'Atmel', 231),
	(2,'Microcontroller', 'ATmega1280-16AU', 5.5, 16, 'tqfp-100', 'Atmel', 123),
	(2,'Microcontroller', 'ATmega16-16PU', 5.5, 16, 'dip40', 'Atmel', 456),
	(2,'Microcontroller', 'ATmega2560-16AU', 5.5, 16, 'dip40', 'Atmel', 546),
	(2,'Microcontroller', 'ATmega32A-PU', 5.5, 16, 'dip40', 'Atmel', 454),
	(2,'Microcontroller', 'AT91SAM9G20B-CU', 1.1, 400, 'LFBGA217', 'Atmel', 45),
	(2,'Microcontroller', 'STM32F427VIT6', 3.6, 180, 'LQFP-100', 'ST Microelectronics', 203),
	(2,'Microcontroller', 'STM32F446RCT6', 3.6, 180, 'LQFP-64', 'ST Microelectronics', 302),
	(2,'Microcontroller', 'STM32F730R8T6', 3.6, 216, 'LQFP-64', 'ST Microelectronics', 120),
	(2,'Microcontroller', 'STM32F427ZIT6', 3.6, 180, 'LQFP-144', 'ST Microelectronics', 47);

insert into ordered (type_element, part_number,type_body, manufacturer, quantity) values 
	('chip', 'ADM660ANZ', 'dip8', 'Analog Devices', 100),
	('chip', 'AT91SAM9G20B-CU', 'LFBGA217', 'Atmel', 100),
	('chip', 'STM32F427VIT6', 'LQFP-100', 'ST Microelectronics', 200),
    ('chip', 'ADM660ANZ', 'dip8', 'Analog Devices', 500),
	('diode', '1N5400', 'DO-201AD', 'DC Components', 500),
	('diode', 'P600A', 'R-6/P600', 'Diotec Semiconductor', 300),
	('diode', 'P600D', 'R-6/P600', 'Diotec Semiconductor', 150),
	('inductors','B82432A1105J000', 'smd_1812', 'Epcos', 200),
	('inductors','B82432A1152K000', 'smd_1812', 'Epcos', 300),
	('inductors','B82432A1153K000', 'smd_1812', 'Epcos', 500),
    ('inductors','B82432A1223K000', 'smd_1812', 'Epcos', 300),
	('quartz','3.000MHzHC-49U', 'HC-49U', 'China', 100),
    ('quartz','6.144MHzHC-49U', 'HC-49U', 'China', 500),	
	('quartz','7.3728MHzHC-49US', 'HC-49S', 'China', 450),
    ('quartz','8.867238MHzHC-49U', 'HC-49U', 'China', 120),
	('resistors', 'ERJ3EKF9311V', 'smd_0603', 'Panasonic', 300),
	('resistors', 'ERJ8ENF1804V', 'smd_1206', 'Panasonic', 500),
	('resistors', 'ERJP06F2103V', 'smd_0802', 'Panasonic', 700),
	('resistors', 'ERJP08F13R3V', 'smd_0802', 'Panasonic', 200),
	('resistors', 'ERJ6ENF3570V', 'smd_0802', 'Panasonic', 200),
    ('transistors', 'AUIRFP2907', 'to-247', 'International Rectifier', 500), 
    ('transistors', 'IRF5852TRPBF', 'TSOP-6', 'International Rectifier', 500), 
    ('transistors', 'IRF630NSPBF', 'd2pak-7', 'International Rectifier', 200), 
    ('transistors', 'IRFH3702TRPBF', 'PQFN-3x3', 'International Rectifier', 1000);

insert into optocouplers (catalog_id, `type`, part_number, reverse_voltage, forward_current, type_body, manufacturer, quantity) values 
	(1,'triac optocoupler', 'BRT12H', 600, 0.3, 'dip6', 'Vishay', 458),
	(1,'triac optocoupler', 'BRT13H', 800, 0.3, 'dip6', 'Vishay', 458),
	(1,'triac optocoupler', 'IL410', 600, 0.3, 'dip6', 'Vishay', 458),
	(1,'triac optocoupler', 'IL420', 600, 0.3, 'dip6', 'Vishay', 458),
	(1,'triac optocoupler', 'MOC3052', 600, 0.01, 'dip6', 'Lite-on Electronics', 458),
	(1,'transistor optocoupler', '4N35-X007T', 30, 0.05, 'dip6', 'Vishay', 458),
	(1,'transistor optocoupler', 'CNY65A', 32, 0.05, 'dip16', 'Vishay', 458),
	(1,'transistor optocoupler', 'CNY74-4H', 70, 0.3, 'dip6', 'Vishay', 458),
    (1,'transistor optocoupler', 'SFH6916', 70, 0.05, 'SOP-16', 'Vishay', 458);






	
	
	