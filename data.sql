-- Values to table 'marcas'
INSERT INTO `drums`.`marcas`(nombre, pais)
VALUES('Gretsch','United States'),
	('Pearl','Japan'),
    ('Yamaha','Japan'),
    ('Tama','Japan'),
    ('Ludwing Drums','United States'),
    ('Sonor','German'),
    ('Mapex','Taiwan'),
    ('Drums DW','United States');
    
-- Values to table 'distribuidores'
INSERT INTO `drums`.`distribuidores`(nombre, numero_telefono, pais, ciudad, direccion)
VALUES('Renzo','+5744676278','Colombia','Bogotá','Cra. 7 #55A-00, Piso 2, Chapinero 111021'),
	('Allegro','+5854445677','Venezuela','Táchira','Carrera 15 con Pasaje Acueducto #220, Piso 3, Barrio Obrero'),
    ('Audiomúsica','+5135822501','Perú','Lima','Falabella San Miguel, Av. la Marina 2100, San Miguel 15087'),
    ('Plaza Music','+5280093751','México','Guadalajara','C. Maestranza 152, Centro 44100'),
    ('Music Gross','+5176394601','Perú','Cusco','Av. Nicolás de Piérola 227, 15001'),
	('Mercury','+5765652783','Colombia','Medellín','Cra. 49 #52-141, La Candelaria'),
	('Casa Amarilla','+5273372819','México','México D.F','');

-- Values to table 'piezas'
INSERT INTO `drums`.`piezas`(nombre, numero_serie, material, peso, marca_id, distribuidor_id)
VALUES('Pedal Bombo Batería P-6B','FG778O','Aluminio','1,5 kg',2,4),
	('Redoblante Black Beauty','FG6637','Latón','2,3 kg',3,2),
    ('Base Boom','FG271','Aluminio','2,4 kg',5,6),
    ('Pad','FH732','Goma','1,2 kg',6,4),
    ('Platillo','FH892','Bronce','1,5 kg',8,3),
    ('Hi Hat','FIO384','Bronce','1,3 kg',7,5),
    ('Tom de piso','EF375','Latón','2,7 kg',6,3),
    ('Pad de pierna','EU312','Goma','1,1 kg',6,7),
    ('Baquetas','FN389','Madera','0,6 kg',6,6),
    ('Parche doble capa','FG235','Orgánico','1,7 kg',7,3),
    ('Parche Resonante','SM215','Neopreno','1,6 kg',8,6),
    ('Redoblante','FH873','Madera','3,6 kg',7,5),
    ('Silla','DG271','Goma','2,1 kg',6,7);
    
-- Values to table 'baterias'
INSERT INTO `drums`.`baterias`(tipo, numero_serie, peso, distribuidor_id, marca_id)
VALUES('Acústica','LC17011DIR','26 kg',4,7),
	('Acústica','LF17024RSE','32 kg',7,8),
    ('Electrónica','LV14611DAF','40 kg',4,2),
    ('Acústica','LC17467GSR','35 kg',2,6),
    ('Electrónica','LB46511DAR','35 kg',1,5),
    ('Electrónica','VC16811FIR','37 kg',7,4),
    ('Acústica','LF34011JGR','28 kg',7,8),
    ('Acústica','LN16912DRT','26 kg',3,5),
    ('Acústica','LC71110TSR','32 kg',2,6),
    ('Electrónica','LC15211TEG','36 kg',2,2),
    ('Electrónica','LK16911GJR','37 kg',1,3),
    ('Acústica','LR13512DTE','34 kg',4,3),
    ('Acústica','LE17481TER','23 kg',7,5),
    ('Electrónica','WR17611WIR','24 kg',7,8),
    ('Acústica','CL17461GTR','36 kg',4,6),
    ('Electrónica','CH26121DT','33 kg',4,3),
    ('Acústica','DG71413TAR','28 kg',2,6),
    ('Electrónica','IU29311DJQ','29 kg',4,1),
    ('Acústica','BS13532GAR','28 kg',7,3),
    ('Electrónica','GA47710HTR','29 kg',6,4),
    ('Acústica','CH51401TBR','38 kg',2,6),
    ('Acústica','LF37061DOF','35 kg',5,3);

-- Values to table 'distribuidores_baterias'
INSERT INTO `drums`.`distribuidores_baterias`(bateria_id, distribuidor_id)
VALUES(19,7), (16,4), (21,2), (15,4), (17,2), (20,6), (18,4), (5,1), (10,2), (1,4), (4,2), (9,2),
    (13,7), (2,7), (7,7), (22,5), (11,1), (8,3), (12,4), (3,4), (6,7), (14,7);