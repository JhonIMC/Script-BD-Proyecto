
-- -----------------------------------------------------
-- Table departamento
-- -----------------------------------------------------
CREATE TABLE  departamento (
  id_departamento NUMBER NOT NULL,
  departamento VARCHAR2(45) NULL,
  PRIMARY KEY (id_departamento));


-- -----------------------------------------------------
-- Table municipio
-- -----------------------------------------------------
CREATE TABLE  municipio (
  id_municipio NUMBER NOT NULL,
  municipio VARCHAR2(45) NULL,
  departamento_id_departamento NUMBER NOT NULL,
  PRIMARY KEY (id_municipio),
  CONSTRAINT fk_municipio_departamento1
    FOREIGN KEY (departamento_id_departamento)
    REFERENCES departamento (id_departamento));


-- -----------------------------------------------------
-- Table direccion
-- -----------------------------------------------------
CREATE TABLE  direccion (
  id_direccion NUMBER NOT NULL,
  calle VARCHAR2(45) NULL,
  avenida VARCHAR2(45) NULL,
  otros VARCHAR2(45) NULL,
  municipio_id_municipio NUMBER NOT NULL,
  PRIMARY KEY (id_direccion),
  CONSTRAINT fk_direccion_municipio1
    FOREIGN KEY (municipio_id_municipio)
    REFERENCES municipio (id_municipio));


-- -----------------------------------------------------
-- Table sede
-- -----------------------------------------------------
CREATE TABLE  sede (
  id_sede NUMBER NOT NULL,
  sede VARCHAR2(45) NULL,
  direccion_id_direccion NUMBER NOT NULL,
  PRIMARY KEY (id_sede),
  CONSTRAINT fk_sede_direccion1
    FOREIGN KEY (direccion_id_direccion)
    REFERENCES direccion (id_direccion));


-- -----------------------------------------------------
-- Table clinica
-- -----------------------------------------------------
CREATE TABLE  clinica (
  id_clinica NUMBER NOT NULL,
  clinica VARCHAR2(45) NULL,
  sede_id_sede NUMBER NOT NULL,
  PRIMARY KEY (id_clinica),
  CONSTRAINT fk_clinica_sede
    FOREIGN KEY (sede_id_sede)
    REFERENCES sede (id_sede));


-- -----------------------------------------------------
-- Table especialidad
-- -----------------------------------------------------
CREATE TABLE  especialidad (
  id_especialidad NUMBER NOT NULL,
  especialidad VARCHAR2(45) NULL,
  PRIMARY KEY (id_especialidad));


-- -----------------------------------------------------
-- Table clinica_especialidad
-- -----------------------------------------------------
CREATE TABLE  clinica_especialidad (
  id_clinica_especialidad NUMBER NOT NULL,
  clinica_id_clinica NUMBER NOT NULL,
  especialidad_id_especialidad NUMBER NOT NULL,
  PRIMARY KEY (id_clinica_especialidad),
  CONSTRAINT fk_clinicaEspecialidad_clinica1
    FOREIGN KEY (clinica_id_clinica)
    REFERENCES clinica (id_clinica),
  CONSTRAINT fk_clinicaEspecialidad_especialidad1
    FOREIGN KEY (especialidad_id_especialidad)
    REFERENCES especialidad (id_especialidad));


-- -----------------------------------------------------
-- Table terapia
-- -----------------------------------------------------
CREATE TABLE  terapia (
  id_terapia NUMBER NOT NULL,
  precio FLOAT NULL,
  terapia VARCHAR2(45) NULL,
  descripcion VARCHAR2(45) NULL,
  especialidad_id_especialidad NUMBER NOT NULL,
  PRIMARY KEY (id_terapia),
  CONSTRAINT fk_terapia_especialidad1
    FOREIGN KEY (especialidad_id_especialidad)
    REFERENCES especialidad (id_especialidad));


-- -----------------------------------------------------
-- Table tipo_identidad
-- -----------------------------------------------------
CREATE TABLE  tipo_identidad (
  id_tipo_identidad NUMBER NOT NULL,
  tipo_identidad VARCHAR2(45) NULL,
  PRIMARY KEY (id_tipo_identidad));


-- -----------------------------------------------------
-- Table persona
-- -----------------------------------------------------
CREATE TABLE  persona (
  id_persona NUMBER NOT NULL,
  nombre VARCHAR2(45) NULL,
  apellido VARCHAR2(45) NULL,
  edad NUMBER NULL,
  telefono NUMBER NULL,
  email VARCHAR2(45) NULL,
  identidad VARCHAR2(20) NULL,
  nit VARCHAR2(13) NULL,
  tipo_identidad_id_tipo_identidad NUMBER NOT NULL,
  direccion_id_direccion NUMBER NOT NULL,
  PRIMARY KEY (id_persona),
  CONSTRAINT fk_persona_tipoIdentidad1
    FOREIGN KEY (tipo_identidad_id_tipo_identidad)
    REFERENCES tipo_identidad (id_tipo_identidad),
  CONSTRAINT fk_persona_direccion1
    FOREIGN KEY (direccion_id_direccion)
    REFERENCES direccion (id_direccion));


-- -----------------------------------------------------
-- Table estado
-- -----------------------------------------------------
CREATE TABLE  estado (
  id_estado NUMBER NOT NULL,
  nombre_estado VARCHAR2(45) NULL,
  PRIMARY KEY (id_estado));


-- -----------------------------------------------------
-- Table especialista
-- -----------------------------------------------------
CREATE TABLE  especialista (
  id_especialista NUMBER NOT NULL,
  persona_id_persona NUMBER NOT NULL,
  estado_id_estado NUMBER NOT NULL,
  PRIMARY KEY (id_especialista),
  CONSTRAINT fk_especialista_persona1
    FOREIGN KEY (persona_id_persona)
    REFERENCES persona (id_persona),
  CONSTRAINT fk_especialista_estado1
    FOREIGN KEY (estado_id_estado)
    REFERENCES estado (id_estado));


-- -----------------------------------------------------
-- Table especialidad_especialista
-- -----------------------------------------------------
CREATE TABLE  especialidad_especialista (
  id_especialidad_especialista NUMBER NOT NULL,
  especialidad_id_especialidad NUMBER NOT NULL,
  especialista_id_especialista NUMBER NOT NULL,
  PRIMARY KEY (id_especialidad_especialista),
  CONSTRAINT fk_especialidadEspecialista_especialidad1
    FOREIGN KEY (especialidad_id_especialidad)
    REFERENCES especialidad (id_especialidad),
  CONSTRAINT fk_especialidadEspecialista_especialista1
    FOREIGN KEY (especialista_id_especialista)
    REFERENCES especialista (id_especialista));


-- -----------------------------------------------------
-- Table tipo_pago
-- -----------------------------------------------------
CREATE TABLE  tipo_pago (
  id_tipo_pago NUMBER NOT NULL,
  tipo_pago VARCHAR2(45) NULL,
  PRIMARY KEY (id_tipo_pago))
;


-- -----------------------------------------------------
-- Table factura_tipo_pago
-- -----------------------------------------------------
CREATE TABLE  factura_tipo_pago (
  id_factura_tipo_pago NUMBER NOT NULL,
  cantidad VARCHAR2(45) NULL,
  tipo_pago_id_tipo_pago NUMBER NOT NULL,
  fecha DATE NULL,
  PRIMARY KEY (id_factura_tipo_pago),
  CONSTRAINT fk_facturaTipoPago_tipoPago1
    FOREIGN KEY (tipo_pago_id_tipo_pago)
    REFERENCES tipo_pago (id_tipo_pago));


-- -----------------------------------------------------
-- Table factura
-- -----------------------------------------------------
CREATE TABLE  factura (
  id_factura NUMBER NOT NULL,
  numero_factura NUMBER NULL,
  serie_factura VARCHAR2(15) NULL,
  factura_tipo_pago_id_factura_tipo_pago NUMBER NOT NULL,
  estado_id_estado NUMBER NOT NULL,
  PRIMARY KEY (id_factura),
  CONSTRAINT fk_factura_facturaTipoPago1
    FOREIGN KEY (factura_tipo_pago_id_factura_tipo_pago)
    REFERENCES factura_tipo_pago (id_factura_tipo_pago),
  CONSTRAINT fk_factura_estado1
    FOREIGN KEY (estado_id_estado)
    REFERENCES estado (id_estado));


-- -----------------------------------------------------
-- Table horario
-- -----------------------------------------------------
CREATE TABLE  horario (
  id_horario NUMBER NOT NULL,
  horario DATE NULL,
  PRIMARY KEY (id_horario));


-- -----------------------------------------------------
-- Table cliente
-- -----------------------------------------------------
CREATE TABLE  cliente (
  id_cliente NUMBER NOT NULL,
  fecha_creacion DATE NULL,
  persona_id_persona NUMBER NOT NULL,
  PRIMARY KEY (id_cliente),
  CONSTRAINT fk_cliente_persona1
    FOREIGN KEY (persona_id_persona)
    REFERENCES persona (id_persona));

-- -----------------------------------------------------
-- Table reservacion
-- -----------------------------------------------------
CREATE TABLE  reservacion (
  id_reservacion NUMBER NOT NULL,
  datos_reservacion VARCHAR2(45) NULL,
  fecha_reservacion DATE NULL,
  horario_id_horario NUMBER NOT NULL,
  cliente_id_cliente NUMBER NOT NULL,
  estado_id_estado NUMBER NOT NULL,
  especialidad_especialista_id_especialidad_especialista NUMBER NOT NULL,
  clinica_especialidad_id_clinica_especialidad NUMBER NOT NULL,
  PRIMARY KEY (id_reservacion),
  CONSTRAINT fk_reservacion_horario1
    FOREIGN KEY (horario_id_horario)
    REFERENCES horario (id_horario),
  CONSTRAINT fk_reservacion_cliente1
    FOREIGN KEY (cliente_id_cliente)
    REFERENCES cliente (id_cliente),
  CONSTRAINT fk_reservacion_estado1
    FOREIGN KEY (estado_id_estado)
    REFERENCES estado (id_estado),
  CONSTRAINT fk_reservacion_especialidadEspecialista1
    FOREIGN KEY (especialidad_especialista_id_especialidad_especialista)
    REFERENCES especialidad_especialista (id_especialidad_especialista),
  CONSTRAINT fk_reservacion_clinicaEspecialidad1
    FOREIGN KEY (clinica_especialidad_id_clinica_especialidad)
    REFERENCES clinica_especialidad (id_clinica_especialidad));


-- -----------------------------------------------------
-- Table terapia_reservacion
-- -----------------------------------------------------
CREATE TABLE  terapia_reservacion (
  id_terapia_reservacion NUMBER NOT NULL,
  terapia_id_terapia NUMBER NOT NULL,
  reservacion_id_reservacion NUMBER NOT NULL,
  PRIMARY KEY (id_terapia_reservacion),
  CONSTRAINT fk_terapiaReservacion_terapia1
    FOREIGN KEY (terapia_id_terapia)
    REFERENCES terapia (id_terapia),
  CONSTRAINT fk_terapiaReservacion_reservacion1
    FOREIGN KEY (reservacion_id_reservacion)
    REFERENCES reservacion (id_reservacion));


-- -----------------------------------------------------
-- Table detalle_factura
-- -----------------------------------------------------
CREATE TABLE  detalle_factura (
  id_detalle_factura NUMBER NOT NULL,
  factura_id_factura NUMBER NOT NULL,
  terapia_reservacion_id_terapia_reservacion NUMBER NOT NULL,
  PRIMARY KEY (id_detalle_factura),
  CONSTRAINT fk_detalleFactura_factura1
    FOREIGN KEY (factura_id_factura)
    REFERENCES factura (id_factura),
  CONSTRAINT fk_detalleFactura_terapiaReservacion1
    FOREIGN KEY (terapia_reservacion_id_terapia_reservacion)
    REFERENCES terapia_reservacion (id_terapia_reservacion));


-- -----------------------------------------------------
-- Table usuario
-- -----------------------------------------------------
CREATE TABLE  usuario (
  id_usuario NUMBER NOT NULL,
  password VARCHAR2(45) NULL,
  persona_id_persona NUMBER NOT NULL,
  usuario VARCHAR2(45) NOT NULL,
  PRIMARY KEY (id_usuario),
  CONSTRAINT fk_usuario_persona1
    FOREIGN KEY (persona_id_persona)
    REFERENCES persona (id_persona));


-- -----------------------------------------------------
-- Table rol
-- -----------------------------------------------------
CREATE TABLE  rol (
  id_rol NUMBER NOT NULL,
  nombre_rol VARCHAR2(45) NULL,
  crear NUMBER NULL,
  borrar NUMBER NULL,
  actualizar NUMBER NULL,
  consultar NUMBER NULL,
  PRIMARY KEY (id_rol));


-- -----------------------------------------------------
-- Table historial
-- -----------------------------------------------------
CREATE TABLE  historial (
  id_historial NUMBER NOT NULL,
  fecha_cambio DATE NULL,
  usuario_id_usuario NUMBER NOT NULL,
  estado_id_estado NUMBER NOT NULL,
  rol_id_rol NUMBER NOT NULL,
  PRIMARY KEY (id_historial),
  CONSTRAINT fk_historial_usuario1
    FOREIGN KEY (usuario_id_usuario)
    REFERENCES usuario (id_usuario),
  CONSTRAINT fk_historial_estado1
    FOREIGN KEY (estado_id_estado)
    REFERENCES estado (id_estado),
  CONSTRAINT fk_historial_rol1
    FOREIGN KEY (rol_id_rol)
    REFERENCES rol (id_rol));


-- -----------------------------------------------------
-- Table menu
-- -----------------------------------------------------
CREATE TABLE  menu (
  id_menu NUMBER NOT NULL,
  nombre_menu VARCHAR2(45) NULL,
  PRIMARY KEY (id_menu));


-- -----------------------------------------------------
-- Table menu_rol
-- -----------------------------------------------------
CREATE TABLE  menu_rol (
  id_menu_rol NUMBER NOT NULL,
  menu_id_menu NUMBER NOT NULL,
  rol_id_rol NUMBER NOT NULL,
  PRIMARY KEY (id_menu_rol),
  CONSTRAINT fk_menu_rol_menu1
    FOREIGN KEY (menu_id_menu)
    REFERENCES menu (id_menu),
  CONSTRAINT fk_menu_rol_rol1
    FOREIGN KEY (rol_id_rol)
    REFERENCES rol (id_rol));

-- -------------------------------------------------------------------------------------------------------------
-- Procedimiento Almacenados
--Ejercutar primero del primer begin al primer end y luego el otro par
-- -------------------------------------------------------------------------------------------------------------


-- Departamento
CREATE OR REPLACE PROCEDURE insertar_departamento
(
    id_deparamento NUMBER,
    departamento VARCHAR2
)
IS BEGIN
    INSERT INTO departamento
    VALUES (id_deparamento, departamento);
    COMMIT;
END insertar_departamento;
/
BEGIN

insertar_departamento (1,'Alta Verapaz');
insertar_departamento (2,'Baja Verapaz');
insertar_departamento (3,'Chimaltenago');
insertar_departamento (4,'Chiquimula');
insertar_departamento (5,'El Peten');
insertar_departamento (6,'El Progreso');
insertar_departamento (7,'El Quiche');
insertar_departamento (8,'Escuintla');
insertar_departamento (9,'Guatemala');
insertar_departamento (10,'Huehuetenango');
insertar_departamento (11,'Izabal');
insertar_departamento (12,'Jalapa');
insertar_departamento (13,'Jutiapa');
insertar_departamento (14,'Quetzaltenango');
insertar_departamento (15,'Retalhuleu');
insertar_departamento (16,'Sacatepequez');
insertar_departamento (17,'San Marcos');
insertar_departamento (18,'Santa Rosa');
insertar_departamento (19,'Solola');
insertar_departamento (20,'Suchitepequez');
insertar_departamento (21,'Totonicapan');
insertar_departamento (22,'Zacapa');

    
END;
/

-- Municipio
CREATE OR REPLACE PROCEDURE insertar_municipio
(
    id_municipio NUMBER,
    municipio VARCHAR2,
    departamento_id_departamento NUMBER
)
IS BEGIN
    INSERT INTO municipio
    VALUES (id_municipio, municipio, departamento_id_departamento);
    COMMIT;
END insertar_municipio;
/
BEGIN
insertar_municipio (1,'Salamá',1);
insertar_municipio (2,'San Miguel Chicaj',1);
insertar_municipio (3,'Rabinal',1);
insertar_municipio (4,'Cubulco',1);
insertar_municipio (5,'Granados',1);
insertar_municipio (6,'Santa Cruz El Chol',1);
insertar_municipio (7,'San Jerónimo',1);
insertar_municipio (8,'Purulhá',1);
insertar_municipio (9,'San Pedro Carchá',1);
insertar_municipio (10,'SanJuan Chamelco',1);
insertar_municipio (11,'Lanquín',1);
insertar_municipio (12,'Santa María Cahabón',1);
insertar_municipio (13,'Chisec',1);
insertar_municipio (14,'Chahal',1);
insertar_municipio (15,'Fray Bartolomé de las Casas',1);
insertar_municipio (16,'Santa Catarina La Tinta',1);
insertar_municipio (17,'Salamá',2);
insertar_municipio (18,'San Miguel Chicaj',2);
insertar_municipio (19,'Rabinal',2);
insertar_municipio (20,'Cubulco',2);
insertar_municipio (21,'Granados',2);
insertar_municipio (22,'Santa Cruz El Chol',2);
insertar_municipio (23,'San Jerónimo',2);
insertar_municipio (24,'Purulhá',2);
insertar_municipio (25,'Chimaltenango',3);
insertar_municipio (26,'San José Poaquil',3);
insertar_municipio (27,'San Martín Jilotepeque',3);
insertar_municipio (28,'San Juan Comalapa',3);
insertar_municipio (29,'Santa Apolonia',3);
insertar_municipio (30,'Tecpán Guatemala',3);
insertar_municipio (31,'Patzun',3);
insertar_municipio (32,'San Miguel Pochuta',3);
insertar_municipio (33,'Patzicia',3);
insertar_municipio (34,'Santa Cruz Balanyá',3);
insertar_municipio (35,'Acatenango',3);
insertar_municipio (36,'San Pedro Yepocapa',3);
insertar_municipio (37,'San Andrés Itzapa',3);
insertar_municipio (38,'Parramos',3);
insertar_municipio (39,'Zaragoza',3);
insertar_municipio (40,'El Tejar',3);
insertar_municipio (41,'Chiquimula',4);
insertar_municipio (42,'San José La Arada',4);
insertar_municipio (43,'San Juan Hermita',4);
insertar_municipio (44,'Jocotán',4);
insertar_municipio (45,'Camotán',4);
insertar_municipio (46,'Olopa',4);
insertar_municipio (47,'Esquipulas',4);
insertar_municipio (48,'Concepción Las Minas',4);
insertar_municipio (49,'Quezaltepeque',4);
insertar_municipio (50,'San Jacinto',4);
insertar_municipio (51,'Ipala',4);
insertar_municipio (52,'Flores',5);
insertar_municipio (53,'San José',5);
insertar_municipio (54,'San Benito',5);
insertar_municipio (55,'San Andrés',5);
insertar_municipio (56,'La Libertad',5);
insertar_municipio (57,'San Francisco',5);
insertar_municipio (58,'Santa Ana',5);
insertar_municipio (59,'Dolores',5);
insertar_municipio (60,'San Luis',5);
insertar_municipio (61,'Sayaxche',5);
insertar_municipio (62,'Melchor de Mencos',5);
insertar_municipio (63,'Poptún',5);
insertar_municipio (64,'Guastatoya',6);
insertar_municipio (65,'Morazán',6);
insertar_municipio (66,'San Agustín Acasaguastlan',6);
insertar_municipio (67,'San Cristóbal Acasaguastlan',6);
insertar_municipio (68,'El Jícaro',6);
insertar_municipio (69,'Sansare',6);
insertar_municipio (70,'Sanarate',6);
insertar_municipio (71,'San Antonio La Paz',6);
insertar_municipio (72,'Santa Cruz del Quiche',7);
insertar_municipio (73,'Chiche',7);
insertar_municipio (74,'Chinique',7);
insertar_municipio (75,'Zacualpa',7);
insertar_municipio (76,'Chajul',7);
insertar_municipio (77,'Santo Tomás Chichicstenango',7);
insertar_municipio (78,'Patzité',7);
insertar_municipio (79,'San Antonio Ilotenango',7);
insertar_municipio (80,'San Pedro Jocopilas',7);
insertar_municipio (81,'Cunén',7);
insertar_municipio (82,'San Juan Cotzal',7);
insertar_municipio (83,'Joyabaj',7);
insertar_municipio (84,'Escuintla',8);
insertar_municipio (85,'Santa Lucía Cotzumalguapa',8);
insertar_municipio (86,'La Democracia',8);
insertar_municipio (87,'Siquinalá',8);
insertar_municipio (88,'Masagua',8);
insertar_municipio (89,'Pueblo Nuevo Tiquisate',8);
insertar_municipio (90,'La Gomera',8);
insertar_municipio (91,'Guanagazapa',8);
insertar_municipio (92,'Puerto de San José',8);
insertar_municipio (93,'Iztapa',8);
insertar_municipio (94,'Palín',8);
insertar_municipio (95,'San Vicente Pacaya',8);
insertar_municipio (96,'Nueva Concepción',8);
insertar_municipio (97,'Guatemala',9);
insertar_municipio (98,'Santa Catarina Pinula',9);
insertar_municipio (99,'San José Pinula',9);
insertar_municipio (100,'San José del Golfo',9);
insertar_municipio (101,'Palencia',9);
insertar_municipio (102,'Chinautla',9);
insertar_municipio (103,'San Pedro Ayampuc',9);
insertar_municipio (104,'Mixco',9);
insertar_municipio (105,'San Pedro Sacatepequez',9);
insertar_municipio (106,'San Juan Sacatepequez',9);
insertar_municipio (107,'San Raymundo',9);
insertar_municipio (108,'Chuarrancho',9);
insertar_municipio (109,'Fraijanes',9);
insertar_municipio (110,'Amatitlán',9);
insertar_municipio (111,'Villa Nueva',9);
insertar_municipio (112,'Villa Canales',9);
insertar_municipio (113,'San Miguel Petapa',9);
insertar_municipio (114,'Huehuetenango',10);
insertar_municipio (115,'Chiantla',10);
insertar_municipio (116,'Malacatancito',10);
insertar_municipio (117,'Cuilco',10);
insertar_municipio (118,'Nentón',10);
insertar_municipio (119,'San Pedro Necta',10);
insertar_municipio (120,'Jacaltenango',10);
insertar_municipio (121,'San Pedro Soloma',10);
insertar_municipio (122,'San Ildelfonso Ixtahuac´n',10);
insertar_municipio (123,'Santa Bárbara',10);
insertar_municipio (124,'La Libertad',10);
insertar_municipio (125,'La Democracia',10);
insertar_municipio (126,'San Miguel Acatán',10);
insertar_municipio (127,'San Rafael La Independencia',10);
insertar_municipio (128,'Todos Santos Chuchcumatán',10);
insertar_municipio (129,'San Juan Atitán',10);
insertar_municipio (130,'Santa Eulalia',10);
insertar_municipio (131,'San Mateo Ixtatán',10);
insertar_municipio (132,'Colotenango',10);
insertar_municipio (133,'San Sebastián Huehuetenango',10);
insertar_municipio (134,'Tectitán',10);
insertar_municipio (135,'Concepción Huista',10);
insertar_municipio (136,'San Juan Ixcoy',10);
insertar_municipio (137,'San Antonio Huista',10);
insertar_municipio (138,'San Sebastián Coatán',10);
insertar_municipio (139,'Santa Cruz Barillas',10);
insertar_municipio (140,'Aguacatán',10);
insertar_municipio (141,'San Rafael Petzal',10);
insertar_municipio (142,'San Gaspar Ixchil',10);
insertar_municipio (143,'Santiago Chimaltenango',10);
insertar_municipio (144,'Santa Ana Huista',10);
insertar_municipio (145,'Puerto Barrios',11);
insertar_municipio (146,'Livingston',11);
insertar_municipio (147,'El Estor',11);
insertar_municipio (148,'Morales',11);
insertar_municipio (149,'Los Amates',11);
insertar_municipio (150,'Jalapa',12);
insertar_municipio (151,'San Pedro Pinula',12);
insertar_municipio (152,'San Luis Jilotepeque',12);
insertar_municipio (153,'San Manuel Chaparrón',12);
insertar_municipio (154,'San Carlos Alzatate',12);
insertar_municipio (155,'Monjas',12);
insertar_municipio (156,'Mataquescuintla',12);
insertar_municipio (157,'Jutiapa',13);
insertar_municipio (158,'El Progreso',13);
insertar_municipio (159,'Santa Catarina Mita',13);
insertar_municipio (160,'Agua Blanca',13);
insertar_municipio (161,'Asunción Mita',13);
insertar_municipio (162,'Yupiltepeque',13);
insertar_municipio (163,'Atescatempa',13);
insertar_municipio (164,'Jerez',13);
insertar_municipio (165,'El Adelanto',13);
insertar_municipio (166,'Zapotitlán',13);
insertar_municipio (167,'Comapa',13);
insertar_municipio (168,'Jalpatagua',13);
insertar_municipio (169,'Conguaco',13);
insertar_municipio (170,'Moyuta',13);
insertar_municipio (171,'Pasaco',13);
insertar_municipio (172,'San José Acatempa',13);
insertar_municipio (173,'Quezada',13);
insertar_municipio (174,'Quetzaltenango',14);
insertar_municipio (175,'Salcajá',14);
insertar_municipio (176,'Olintepeque',14);
insertar_municipio (177,'San Carlos Sija',14);
insertar_municipio (178,'Sibilia',14);
insertar_municipio (179,'Cabrican',14);
insertar_municipio (180,'Cajola',14);
insertar_municipio (181,'San Miguel Siguilça',14);
insertar_municipio (182,'San Juan Ostuncalco',14);
insertar_municipio (183,'San Mateo',14);
insertar_municipio (184,'Concepción Chiquirichapa',14);
insertar_municipio (185,'San Martín Sacatepequez',14);
insertar_municipio (186,'Almolonga',14);
insertar_municipio (187,'Cantel',14);
insertar_municipio (188,'Huitán',14);
insertar_municipio (189,'Zunil',14);
insertar_municipio (190,'Colomba',14);
insertar_municipio (191,'San Francisco La Unión',14);
insertar_municipio (192,'El Palmar',14);
insertar_municipio (193,'Coatepeque',14);
insertar_municipio (194,'Génova',14);
insertar_municipio (195,'Flores Costa Cuca',14);
insertar_municipio (196,'La Esperanza',14);
insertar_municipio (197,'Palestina de los Altos',14);
insertar_municipio (198,'Retalhuelu',15);
insertar_municipio (199,'San Sebastián',15);
insertar_municipio (200,'Santa Cruz Mulúa',15);
insertar_municipio (201,'San Martín Zapotitlán',15);
insertar_municipio (202,'San Felipe Retalhuleu',15);
insertar_municipio (203,'San Andrés Villa Seca',15);
insertar_municipio (204,'Champerico',15);
insertar_municipio (205,'Nuevo San Carlos',15);
insertar_municipio (206,'El Asintal',15);
insertar_municipio (207,'Antigua Guatemala',16);
insertar_municipio (208,'Jocotenango',16);
insertar_municipio (209,'Pastores',16);
insertar_municipio (210,'Sumpango',16);
insertar_municipio (211,'Santo Domingo Xenacoj',16);
insertar_municipio (212,'Santiago Sacatepequez',16);
insertar_municipio (213,'San Bartolomé Milpas Altas',16);
insertar_municipio (214,'San Lucas Sacatepequez',16);
insertar_municipio (215,'Santa Lucía Milpas Altas',16);
insertar_municipio (216,'Magdalena Milpas Altas',16);
insertar_municipio (217,'Santa María de Jesús',16);
insertar_municipio (218,'Ciudad Vieja',16);
insertar_municipio (219,'San Miguel Dueñas',16);
insertar_municipio (220,'San Juan Alotenango',16);
insertar_municipio (221,'San Antonio Aguas Calientes',16);
insertar_municipio (222,'Santa Catarina Barahona',16);
insertar_municipio (223,'San Marcos',17);
insertar_municipio (224,'San Pedro Sacatepéquez',17);
insertar_municipio (225,'Comitancillo',17);
insertar_municipio (226,'San Antonio Sacatepéquez',17);
insertar_municipio (227,'San Miguel Ixtahuacan',17);
insertar_municipio (228,'Concepción Tutuapa',17);
insertar_municipio (229,'Tacaná',17);
insertar_municipio (230,'Sibinal',17);
insertar_municipio (231,'Tajumulco',17);
insertar_municipio (232,'Tejutla',17);
insertar_municipio (233,'San Rafael Pié de la Cuesta',17);
insertar_municipio (234,'Nuevo Progreso',17);
insertar_municipio (235,'El Tumbador',17);
insertar_municipio (236,'San José El Rodeo',17);
insertar_municipio (237,'Malacatán',17);
insertar_municipio (238,'Catarina',17);
insertar_municipio (239,'Ayutla',17);
insertar_municipio (240,'Ocos',17);
insertar_municipio (241,'San Pablo',17);
insertar_municipio (242,'El Quetzal',17);
insertar_municipio (243,'La Reforma',17);
insertar_municipio (244,'Pajapita',17);
insertar_municipio (245,'Ixchiguan',17);
insertar_municipio (246,'San José Ojetenán',17);
insertar_municipio (247,'San Cristóbal Cucho',17);
insertar_municipio (248,'Sipacapa',17);
insertar_municipio (249,'Esquipulas Palo Gordo',17);
insertar_municipio (250,'Río Blanco',17);
insertar_municipio (251,'San Lorenzo',17);
insertar_municipio (252,'Cuilapa',18);
insertar_municipio (253,'Berberena',18);
insertar_municipio (254,'San Rosa de Lima',18);
insertar_municipio (255,'Casillas',18);
insertar_municipio (256,'San Rafael Las Flores',18);
insertar_municipio (257,'Oratorio',18);
insertar_municipio (258,'San Juan TEcuaco',18);
insertar_municipio (259,'Chiquimulilla',18);
insertar_municipio (260,'Taxisco',18);
insertar_municipio (261,'Santa María Ixhuatan',18);
insertar_municipio (262,'Guazacapán',18);
insertar_municipio (263,'Santa Cruz Naranjo',18);
insertar_municipio (264,'Pueblo Nuevo Viñas',18);
insertar_municipio (265,'Nueva Santa Rosa',18);
insertar_municipio (266,'Sololá',19);
insertar_municipio (267,'San José Chacaya',19);
insertar_municipio (268,'Santa María Visitación',19);
insertar_municipio (269,'Santa Lucía Utatlán',19);
insertar_municipio (270,'Nahualá',19);
insertar_municipio (271,'Santa Catarina Ixtahuacán',19);
insertar_municipio (272,'Santa Clara La Laguna',19);
insertar_municipio (273,'Concepción',19);
insertar_municipio (274,'San Andrés Semetabaj',19);
insertar_municipio (275,'Panajachel',19);
insertar_municipio (276,'Santa Catarina Palopó',19);
insertar_municipio (277,'San Antonio Palopó',19);
insertar_municipio (278,'San Lucas Tolimán',19);
insertar_municipio (279,'Santa Cruz La Laguna',19);
insertar_municipio (280,'Sna Pablo La Laguna',19);
insertar_municipio (281,'San Marcos La Laguna',19);
insertar_municipio (282,'San Juan La Laguna',19);
insertar_municipio (283,'San Pedro La Laguna',19);
insertar_municipio (284,'Santiago Atitlán',19);
insertar_municipio (285,'Mazatenango',20);
insertar_municipio (286,'Cuyotenango',20);
insertar_municipio (287,'San Francisco Zapotitlán',20);
insertar_municipio (288,'San Bernardino',20);
insertar_municipio (289,'San José El Ídolo',20);
insertar_municipio (290,'Santo Domingo Suchitepequez',20);
insertar_municipio (291,'San Lorenzo',20);
insertar_municipio (292,'Samayac',20);
insertar_municipio (293,'San Pablo Jocopilas',20);
insertar_municipio (294,'San Antonio Suchitepéquez',20);
insertar_municipio (295,'San Miguel Panán',20);
insertar_municipio (296,'San Gabriel',20);
insertar_municipio (297,'Chicacao',20);
insertar_municipio (298,'Patulul',20);
insertar_municipio (299,'Santa Bárbara',20);
insertar_municipio (300,'San Juan Bautista',20);
insertar_municipio (301,'Santo Tomás La Unión',20);
insertar_municipio (302,'Zunilito',20);
insertar_municipio (303,'Pueblo Nuevo Suchitepéquez',20);
insertar_municipio (304,'Río Bravo',20);
insertar_municipio (305,'Totonicapán',21);
insertar_municipio (306,'San Cristóbal Totonicapán',21);
insertar_municipio (307,'San Francisco El Alto',21);
insertar_municipio (308,'San Andrés Xecul',21);
insertar_municipio (309,'Momostenango',21);
insertar_municipio (310,'Santa María Chiquimula',21);
insertar_municipio (311,'Santa Lucía La Reforma',21);
insertar_municipio (312,'San Bartolo Aguas Calientes',21);
insertar_municipio (313,'Zacapa',22);
insertar_municipio (314,'Estanzuela',22);
insertar_municipio (315,'Río Hondo',22);
insertar_municipio (316,'gualán',22);
insertar_municipio (317,'Teculután',22);
insertar_municipio (318,'Usumatlán',22);
insertar_municipio (319,'Cabañas',22);
insertar_municipio (320,'San Diego',22);
insertar_municipio (321,'La Unión',22);
insertar_municipio (322,'Huite',22);
END;
/
-- Rol
CREATE OR REPLACE PROCEDURE insertar_rol
(
    id_rol NUMBER,
    nombre_rol VARCHAR2,
    crear NUMBER,
    borrar NUMBER,
    actualizar NUMBER,
    consultar NUMBER
)
IS BEGIN
    INSERT INTO rol
    VALUES (id_rol, nombre_rol, crear, borrar, actualizar, consultar);
    COMMIT;
END insertar_rol;
/
BEGIN
    insertar_rol(1, 'Admin', 1,1,1,1);
    insertar_rol(2, 'Usuario', 1,0,1,1);
    insertar_rol(3, 'Auxiliar', 0,0,0,1);
END;
/


-- Estado
CREATE OR REPLACE PROCEDURE insertar_estado
(
    id_estado NUMBER,
    nombre_estado VARCHAR2
)
IS BEGIN
    INSERT INTO estado
    VALUES (id_estado, nombre_estado);
    COMMIT;
END insertar_estado;
/
BEGIN
    insertar_estado(1, 'Activo');
    insertar_estado(2, 'Progreso');
    insertar_estado(3, 'Rechazado');
END;
/




-- Especialidad
CREATE OR REPLACE PROCEDURE insertar_especialidad
(
    id_especialidad NUMBER,
    especialidad VARCHAR2
)
IS BEGIN
    INSERT INTO especialidad
    VALUES (id_especialidad, especialidad);
    COMMIT;
END insertar_especialidad;
/
BEGIN
    insertar_especialidad(1, 'Neurologica');
    insertar_especialidad(2, 'Pediatrica');
    insertar_especialidad(3, 'Geriatrica');
    insertar_especialidad(4, 'Traumatologica');
END;
/

-- Tipo Identidad
CREATE OR REPLACE PROCEDURE insertar_tipo_identidad
(
    id_tipo_identidad NUMBER,
    tipo_identidad VARCHAR2
)
IS BEGIN
    INSERT INTO tipo_identidad
    VALUES (id_tipo_identidad, tipo_identidad);
    COMMIT;
END insertar_tipo_identidad;
/
BEGIN
    insertar_tipo_identidad(1, 'DPI');
    insertar_tipo_identidad(2, 'Pasaporte');
END;
/


-- Tipo menu
CREATE OR REPLACE PROCEDURE insertar_menu
(
    id_menu NUMBER,
    menu VARCHAR2
)
IS BEGIN
    INSERT INTO menu
    VALUES (id_menu, menu);
    COMMIT;
END insertar_menu;
/
BEGIN
    insertar_menu(1, 'Reservacion');
    insertar_menu(2, 'Clientes');
    insertar_menu(3, 'Especialistas');
    insertar_menu(4, 'Especialidades');
    insertar_menu(5, 'Sedes');
    insertar_menu(6, 'Clinicas');
    insertar_menu(7, 'Facturas');
    insertar_menu(8, 'Estados');
    insertar_menu(9, 'Tipo de Identidad');
    insertar_menu(10, 'Roles');
    insertar_menu(11, 'Terapia');
END;
/

-- Tipo menu rol
CREATE OR REPLACE PROCEDURE insertar_menu_rol
(
    id_menu_rol NUMBER,
    menu_id_menu NUMBER,
    rol_id_rol NUMBER
)
IS BEGIN
    INSERT INTO menu_rol
    VALUES (id_menu_rol, menu_id_menu, rol_id_rol);
    COMMIT;
END insertar_menu_rol;
/
BEGIN
    insertar_menu_rol(1, 1, 1);
    insertar_menu_rol(2, 2, 1);
    insertar_menu_rol(3, 3, 1);
    insertar_menu_rol(4, 4, 1);
    insertar_menu_rol(5, 5, 1);
    insertar_menu_rol(6, 6, 1);
    insertar_menu_rol(7, 7, 1);
    insertar_menu_rol(8, 8, 1);
    insertar_menu_rol(9, 9, 1);
    insertar_menu_rol(10, 10, 1);
    insertar_menu_rol(11, 1, 2);
    insertar_menu_rol(12, 2, 2);
    insertar_menu_rol(13, 3, 2);
    insertar_menu_rol(14, 4, 2);
    insertar_menu_rol(15, 5, 2);
    insertar_menu_rol(16, 7, 2);
    insertar_menu_rol(17, 9, 2);
    insertar_menu_rol(18, 10, 2);
END;
/

-- Tipo horario
CREATE OR REPLACE PROCEDURE insertar_horario
(
    id_horario NUMBER,
    horario DATE
)
IS BEGIN
    INSERT INTO horario
    VALUES (id_horario, horario);
    COMMIT;
END insertar_horario;
/
BEGIN
    insertar_horario(1, TO_DATE('2022/10/28 08:00:00', 'yyyy/mm/dd hh24:mi:ss'));
    insertar_horario(2, TO_DATE('2022/10/28 09:00:00', 'yyyy/mm/dd hh24:mi:ss'));
    insertar_horario(3, TO_DATE('2022/10/28 10:00:00', 'yyyy/mm/dd hh24:mi:ss'));
    insertar_horario(4, TO_DATE('2022/10/28 11:00:00', 'yyyy/mm/dd hh24:mi:ss'));
    insertar_horario(5, TO_DATE('2022/10/28 12:00:00', 'yyyy/mm/dd hh24:mi:ss'));
    insertar_horario(6, TO_DATE('2022/10/28 13:00:00', 'yyyy/mm/dd hh24:mi:ss'));
    insertar_horario(7, TO_DATE('2022/10/28 14:00:00', 'yyyy/mm/dd hh24:mi:ss'));
    insertar_horario(8, TO_DATE('2022/10/28 15:00:00', 'yyyy/mm/dd hh24:mi:ss'));
    insertar_horario(9, TO_DATE('2022/10/28 16:00:00', 'yyyy/mm/dd hh24:mi:ss'));
    insertar_horario(10, TO_DATE('2022/10/28 17:00:00', 'yyyy/mm/dd hh24:mi:ss'));
   
END;
/

-- Tipo tipo pago
CREATE OR REPLACE PROCEDURE insertar_tipo_pago
(
    id_tipo_pago NUMBER,
    tipo_pago VARCHAR2
)
IS BEGIN
    INSERT INTO tipo_pago
    VALUES (id_tipo_pago, tipo_pago);
    COMMIT;
END insertar_tipo_pago;
/
BEGIN
    insertar_tipo_pago(1, 'Efectivo');
    insertar_tipo_pago(2, 'Tarjeta');
END;
/
-------------------------------------------------------TRIGGERS-------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

CREATE TABLE bitacora (
    id_bitacora NUMBER NOT NULL,
    tabla VARCHAR2(45) NULL,
    valor_anterior VARCHAR2(4000),
    valor_nuevo VARCHAR2(4000),
    fecha DATE NULL,
    accion VARCHAR2(100) NULL,
    usuario VARCHAR2(20) NULL,
    PRIMARY KEY(id_bitacora)
);

SELECT * FROM bitacora;

-- SEQUENCIA
CREATE SEQUENCE SQC_BITACORA
START WITH 1
INCREMENT BY 1;


-- TRIGGER CLIENTE
CREATE OR REPLACE TRIGGER tr_cliente
BEFORE UPDATE OR DELETE
ON cliente
    FOR EACH ROW
    BEGIN
        IF updating('fecha_creacion') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'CLIENTE', 
            (JSON_OBJECT (
            KEY 'fecha_creacion' IS :OLD.fecha_creacion
            )), 
            (JSON_OBJECT (
            KEY 'fecha_creacion' IS :NEW.fecha_creacion
            )), 
            systimestamp, 'UPDATE', user);
        END IF;
        IF deleting THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'CLIENTE', 
            (JSON_OBJECT (
            KEY 'id_cliente' IS :OLD.id_cliente,
            KEY 'fecha_creacion' IS :OLD.fecha_creacion,
            KEY 'persona_id_persona' IS :OLD.persona_id_persona
            )),
            NULL, systimestamp, 'DELETE', user);
        END IF;
    END;
/
-- TRIGGER PERSONA
CREATE OR REPLACE TRIGGER tr_persona
BEFORE UPDATE OR DELETE
ON persona
    FOR EACH ROW
    BEGIN
        IF updating('nombre') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'PERSONA',             
            (JSON_OBJECT (KEY 'nombre' IS :OLD.nombre)), (JSON_OBJECT (KEY 'nombre' IS :NEW.nombre)), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('apellido') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'PERSONA',             
            (JSON_OBJECT (KEY 'apellido' IS :OLD.apellido)), (JSON_OBJECT (KEY 'apellido' IS :NEW.apellido)), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('edad') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'PERSONA',             
            (JSON_OBJECT (KEY 'edad' IS :OLD.edad)), (JSON_OBJECT (KEY 'edad' IS :NEW.edad)), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('telefono') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'PERSONA',             
            (JSON_OBJECT (KEY 'telefono' IS :OLD.telefono)), (JSON_OBJECT (KEY 'telefono' IS :NEW.telefono)), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('email') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'PERSONA',             
            (JSON_OBJECT (KEY 'email' IS :OLD.email)), (JSON_OBJECT (KEY 'email' IS :NEW.email)), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('identidad') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'PERSONA',             
            (JSON_OBJECT (KEY 'identidad' IS :OLD.identidad)), (JSON_OBJECT (KEY 'identidad' IS :NEW.identidad)), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('nit') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'PERSONA',             
            (JSON_OBJECT (KEY 'nit' IS :OLD.nit)), (JSON_OBJECT (KEY 'nit' IS :NEW.nit)), systimestamp, 'UPDATE', user);
        END IF;
        IF deleting THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'PERSONA', 
            (JSON_OBJECT (
            KEY 'id_persona' IS :OLD.id_persona,
            KEY 'nombre' IS :OLD.nombre,
            KEY 'apellido' IS :OLD.apellido,
            KEY 'edad' IS :OLD.edad,
            KEY 'telefono' IS :OLD.telefono,
            KEY 'email' IS :OLD.email,
            KEY 'identidad' IS :OLD.identidad,
            KEY 'nit' IS :OLD.nit,
            KEY 'tipo_identidad' IS :OLD.tipo_identidad_id_tipo_identidad,
            KEY 'direccion' IS :OLD.direccion_id_direccion
            )), NULL, systimestamp, 'DELETE', user);
        END IF;
    END;
/


-- TRIGGER USUARIO
CREATE OR REPLACE TRIGGER tr_usuario
BEFORE UPDATE OR DELETE
ON usuario
    FOR EACH ROW
    BEGIN
        IF updating('password') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'USUARIO',
            NULL, 
            (JSON_OBJECT (
            KEY 'password' IS :NEW.password
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('usuario') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'USUARIO',
            NULL, 
            (JSON_OBJECT (
            KEY 'usuario' IS :NEW.usuario
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF deleting THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'USUARIO', 
            (JSON_OBJECT (
            KEY 'id_usuario' IS :OLD.id_usuario,
            KEY 'password' IS :OLD.password,
            KEY 'persona_id_persona' IS :OLD.persona_id_persona,
            KEY 'usuario' IS :OLD.usuario
            )),
            NULL, systimestamp, 'DELETE', user);
        END IF;
    END;
/


-- TRIGGER TERAPIA
CREATE OR REPLACE TRIGGER tr_terapia
BEFORE UPDATE OR DELETE
ON terapia
    FOR EACH ROW
    BEGIN
        IF updating('precio') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'TERAPIA',             
            (JSON_OBJECT (
            KEY 'precio' IS :OLD.precio
            )), 
            (JSON_OBJECT (
            KEY 'precio' IS :NEW.precio
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('terapia') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'TERAPIA',             
            (JSON_OBJECT (
            KEY 'terapia' IS :OLD.terapia
            )), 
            (JSON_OBJECT (
            KEY 'terapia' IS :NEW.terapia
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('descripcion') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'TERAPIA',             
            (JSON_OBJECT (
            KEY 'descripcion' IS :OLD.descripcion
            )), 
            (JSON_OBJECT (
            KEY 'descripcion' IS :NEW.descripcion
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF deleting THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'TERAPIA', 
            (JSON_OBJECT (
            KEY 'id_terapia' IS :OLD.id_terapia,
            KEY 'precio' IS :OLD.precio,
            KEY 'terapia' IS :OLD.terapia,
            KEY 'descripcion' IS :OLD.descripcion,
            KEY 'especialidad_id_especialidad' IS :OLD.especialidad_id_especialidad
            )),
            NULL, systimestamp, 'DELETE', user);
        END IF;
    END;

/

-- TRIGGER DIRECCION
CREATE OR REPLACE TRIGGER tr_direccion
BEFORE UPDATE OR DELETE
ON direccion
    FOR EACH ROW
    BEGIN
        IF updating('calle') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'DIRECCION',             
            (JSON_OBJECT (
            KEY 'calle' IS :OLD.calle
            )), 
            (JSON_OBJECT (
            KEY 'calle' IS :NEW.calle
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('avenida') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'DIRECCION',             
            (JSON_OBJECT (
            KEY 'avenida' IS :OLD.avenida
            )), 
            (JSON_OBJECT (
            KEY 'avenida' IS :NEW.avenida
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('otros') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'DIRECCION',             
            (JSON_OBJECT (
            KEY 'otros' IS :OLD.otros
            )), 
            (JSON_OBJECT (
            KEY 'otros' IS :NEW.otros
            )),
            systimestamp, 'UPDATE', user);
        END IF;
        IF updating('municipio_id_municipio') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'DIRECCION',             
            (JSON_OBJECT (
            KEY 'municipio_id_municipio' IS :OLD.municipio_id_municipio
            )), 
            (JSON_OBJECT (
            KEY 'municipio_id_municipio' IS :NEW.municipio_id_municipio
            )),
            systimestamp, 'UPDATE', user);
        END IF;
        IF deleting THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'DIRECCION', 
            (JSON_OBJECT (
            KEY 'id_direccion' IS :OLD.id_direccion,
            KEY 'calle' IS :OLD.calle,
            KEY 'avenida' IS :OLD.avenida,
            KEY 'otros' IS :OLD.otros,
            KEY 'municipio_id_municipio' IS :OLD.municipio_id_municipio
            )),
            NULL, systimestamp, 'DELETE', user);
        END IF;
    END;

/

-- TRIGGER SEDE
CREATE OR REPLACE TRIGGER tr_sede
BEFORE UPDATE OR DELETE
ON sede
    FOR EACH ROW
    BEGIN
        IF updating('sede') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'SEDE',             
            (JSON_OBJECT (
            KEY 'sede' IS :OLD.sede
            )), 
            (JSON_OBJECT (
            KEY 'sede' IS :NEW.sede
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('direccion_id_direccion') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'SEDE',             
            (JSON_OBJECT (
            KEY 'direccion_id_direccion' IS :OLD.direccion_id_direccion
            )), 
            (JSON_OBJECT (
            KEY 'direccion_id_direccion' IS :NEW.direccion_id_direccion
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF deleting THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'SEDE', 
            (JSON_OBJECT (
            KEY 'id_sede' IS :OLD.id_sede,
            KEY 'sede' IS :OLD.sede,
            KEY 'direccion_id_direccion' IS :OLD.direccion_id_direccion
            )),
            NULL, systimestamp, 'DELETE', user);
        END IF;
    END;

/

-- TRIGGER CLINICA
CREATE OR REPLACE TRIGGER tr_clinica
BEFORE UPDATE OR DELETE
ON clinica
    FOR EACH ROW
    BEGIN
        IF updating('clinica') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'CLINICA',             
            (JSON_OBJECT (
            KEY 'clinica' IS :OLD.clinica
            )), 
            (JSON_OBJECT (
            KEY 'clinica' IS :NEW.clinica
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('sede_id_sede') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'CLINICA',             
            (JSON_OBJECT (
            KEY 'sede_id_sede' IS :OLD.sede_id_sede
            )), 
            (JSON_OBJECT (
            KEY 'sede_id_sede' IS :NEW.sede_id_sede
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF deleting THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'CLINICA', 
            (JSON_OBJECT (
            KEY 'id_clinica' IS :OLD.id_clinica,
            KEY 'clinica' IS :OLD.clinica,
            KEY 'sede_id_sede' IS :OLD.sede_id_sede
            )),
            NULL, systimestamp, 'DELETE', user);
        END IF;
    END;
/


-- TRIGGER ESPECIALIDAD
CREATE OR REPLACE TRIGGER tr_especialidad
BEFORE UPDATE OR DELETE
ON especialidad
    FOR EACH ROW
    BEGIN
        IF updating('especialidad') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'ESPECIALIDAD',             
            (JSON_OBJECT (
            KEY 'especialidad' IS :OLD.especialidad
            )), 
            (JSON_OBJECT (
            KEY 'especialidad' IS :NEW.especialidad
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF deleting THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'ESPECIALIDAD', 
            (JSON_OBJECT (
            KEY 'id_especialidad' IS :OLD.id_especialidad,
            KEY 'especialidad' IS :OLD.especialidad
            )),
            NULL, systimestamp, 'DELETE', user);
        END IF;
    END;
    
/
    
-- TRIGGER ESPECIALISTA
CREATE OR REPLACE TRIGGER tr_especialista
BEFORE UPDATE OR DELETE
ON especialista
    FOR EACH ROW
    BEGIN
        IF updating('persona_id_persona') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'ESPECIALISTA',             
            (JSON_OBJECT (
            KEY 'persona_id_persona' IS :OLD.persona_id_persona
            )), 
            (JSON_OBJECT (
            KEY 'persona_id_persona' IS :NEW.persona_id_persona
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('estado_id_estado') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'ESPECIALISTA',             
            (JSON_OBJECT (
            KEY 'estado_id_estado' IS :OLD.estado_id_estado
            )), 
            (JSON_OBJECT (
            KEY 'estado_id_estado' IS :NEW.estado_id_estado
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF deleting THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'ESPECIALISTA', 
            (JSON_OBJECT (
            KEY 'id_especialista' IS :OLD.id_especialista,
            KEY 'persona_id_persona' IS :OLD.persona_id_persona,
            KEY 'estado_id_estado' IS :OLD.estado_id_estado
            )),
            NULL, systimestamp, 'DELETE', user);
        END IF;
    END;

/
-- TRIGGER RESERVACION
CREATE OR REPLACE TRIGGER tr_reservacion
BEFORE UPDATE OR DELETE
ON reservacion
    FOR EACH ROW
    BEGIN
        IF updating('datos_reservacion') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'RESERVACION',             
            (JSON_OBJECT (
            KEY 'datos_reservacion' IS :OLD.datos_reservacion
            )), 
            (JSON_OBJECT (
            KEY 'datos_reservacion' IS :NEW.datos_reservacion
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('fecha_reservacion') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'RESERVACION',             
            (JSON_OBJECT (
            KEY 'fecha_reservacion' IS :OLD.fecha_reservacion
            )), 
            (JSON_OBJECT (
            KEY 'fecha_reservacion' IS :NEW.fecha_reservacion
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('horario_id_horario') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'RESERVACION',             
            (JSON_OBJECT (
            KEY 'horario_id_horario' IS :OLD.horario_id_horario
            )), 
            (JSON_OBJECT (
            KEY 'horario_id_horario' IS :NEW.horario_id_horario
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('cliente_id_cliente') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'RESERVACION',             
            (JSON_OBJECT (
            KEY 'cliente_id_cliente' IS :OLD.cliente_id_cliente
            )), 
            (JSON_OBJECT (
            KEY 'cliente_id_cliente' IS :NEW.cliente_id_cliente
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('estado_id_estado') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'RESERVACION',             
            (JSON_OBJECT (
            KEY 'estado_id_estado' IS :OLD.estado_id_estado
            )), 
            (JSON_OBJECT (
            KEY 'estado_id_estado' IS :NEW.estado_id_estado
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('especialidad_especialista_id_especialidad_especialista') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'RESERVACION',             
            (JSON_OBJECT (
            KEY 'especialidad_especialista_id_especialidad_especialista' IS :OLD.especialidad_especialista_id_especialidad_especialista
            )), 
            (JSON_OBJECT (
            KEY 'especialidad_especialista_id_especialidad_especialista' IS :NEW.especialidad_especialista_id_especialidad_especialista
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('clinica_especialidad_id_clinica_especialidad') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'RESERVACION',             
            (JSON_OBJECT (
            KEY 'clinica_especialidad_id_clinica_especialidad' IS :OLD.clinica_especialidad_id_clinica_especialidad
            )), 
            (JSON_OBJECT (
            KEY 'clinica_especialidad_id_clinica_especialidad' IS :NEW.clinica_especialidad_id_clinica_especialidad
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF deleting THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'RESERVACION', 
            (JSON_OBJECT (
            KEY 'id_reservacion' IS :OLD.id_reservacion,
            KEY 'datos_reservacion' IS :OLD.datos_reservacion,
            KEY 'fecha_reservacion' IS :OLD.fecha_reservacion,
            KEY 'horario_id_horario' IS :OLD.horario_id_horario,
            KEY 'cliente_id_cliente' IS :OLD.cliente_id_cliente,
            KEY 'estado_id_estado' IS :OLD.estado_id_estado,
            KEY 'especialidad_especialista_id_especialidad_especialista' IS :OLD.especialidad_especialista_id_especialidad_especialista,
            KEY 'clinica_especialidad_id_clinica_especialidad' IS :OLD.clinica_especialidad_id_clinica_especialidad
            )),
            NULL, systimestamp, 'DELETE', user);
        END IF;
    END;

/

-- TRIGGER FACTURA
CREATE OR REPLACE TRIGGER tr_factura
BEFORE UPDATE OR DELETE
ON factura
    FOR EACH ROW
    BEGIN
        IF updating('numero_factura') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'FACTURA',             
            (JSON_OBJECT (
            KEY 'numero_factura' IS :OLD.numero_factura
            )), 
            (JSON_OBJECT (
            KEY 'numero_factura' IS :NEW.numero_factura
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('serie_factura') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'FACTURA',             
            (JSON_OBJECT (
            KEY 'serie_factura' IS :OLD.serie_factura
            )), 
            (JSON_OBJECT (
            KEY 'serie_factura' IS :NEW.serie_factura
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('factura_tipo_pago_id_factura_tipo_pago') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'FACTURA',             
            (JSON_OBJECT (
            KEY 'factura_tipo_pago_id_factura_tipo_pago' IS :OLD.factura_tipo_pago_id_factura_tipo_pago
            )), 
            (JSON_OBJECT (
            KEY 'factura_tipo_pago_id_factura_tipo_pago' IS :NEW.factura_tipo_pago_id_factura_tipo_pago
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('estado_id_estado') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'FACTURA',             
            (JSON_OBJECT (
            KEY 'estado_id_estado' IS :OLD.estado_id_estado
            )), 
            (JSON_OBJECT (
            KEY 'estado_id_estado' IS :NEW.estado_id_estado
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF deleting THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'FACTURA', 
            (JSON_OBJECT (
            KEY 'id_factura' IS :OLD.id_factura,
            KEY 'numero_factura' IS :OLD.numero_factura,
            KEY 'serie_factura' IS :OLD.serie_factura,
            KEY 'factura_tipo_pago_id_factura_tipo_pago' IS :OLD.factura_tipo_pago_id_factura_tipo_pago,
            KEY 'estado_id_estado' IS :OLD.estado_id_estado
            )),
            NULL, systimestamp, 'DELETE', user);
        END IF;
    END;
/


-- TRIGGER FACTURA TIPO PAGO
CREATE OR REPLACE TRIGGER tr_factura_tipo_pago
BEFORE UPDATE OR DELETE
ON factura_tipo_pago
    FOR EACH ROW
    BEGIN
        IF updating('cantidad') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'FACTURA TIPO PAGO',             
            (JSON_OBJECT (
            KEY 'cantidad' IS :OLD.cantidad
            )), 
            (JSON_OBJECT (
            KEY 'cantidad' IS :NEW.cantidad
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('tipo_pago_id_tipo_pago') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'FACTURA TIPO PAGO',             
            (JSON_OBJECT (
            KEY 'tipo_pago_id_tipo_pago' IS :OLD.tipo_pago_id_tipo_pago
            )), 
            (JSON_OBJECT (
            KEY 'tipo_pago_id_tipo_pago' IS :NEW.tipo_pago_id_tipo_pago
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF updating('fecha') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'FACTURA TIPO PAGO',             
            (JSON_OBJECT (
            KEY 'fecha' IS :OLD.fecha
            )), 
            (JSON_OBJECT (
            KEY 'fecha' IS :NEW.fecha
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF deleting THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'FACTURA TIPO PAGO', 
            (JSON_OBJECT (
            KEY 'id_factura_tipo_pago' IS :OLD.id_factura_tipo_pago,
            KEY 'cantidad' IS :OLD.cantidad,
            KEY 'tipo_pago_id_tipo_pago' IS :OLD.tipo_pago_id_tipo_pago,
            KEY 'fecha' IS :OLD.fecha
            )),
            NULL, systimestamp, 'DELETE', user);
        END IF;
    END;
/

-- TRIGGER TIPO IDENTIDAD
CREATE OR REPLACE TRIGGER tr_tipo_identidad
BEFORE UPDATE OR DELETE
ON tipo_identidad
    FOR EACH ROW
    BEGIN
        IF updating('tipo_identidad') THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'TIPO IDENTIDAD',             
            (JSON_OBJECT (
            KEY 'tipo_identidad' IS :OLD.tipo_identidad
            )), 
            (JSON_OBJECT (
            KEY 'tipo_identidad' IS :NEW.tipo_identidad
            )), systimestamp, 'UPDATE', user);
        END IF;
        IF deleting THEN
            INSERT INTO bitacora(id_bitacora, tabla, valor_anterior, valor_nuevo, fecha, accion, usuario) 
            VALUES(SQC_BITACORA.NEXTVAL, 'TIPO IDENTIDAD', 
            (JSON_OBJECT (
            KEY 'id_tipo_identidad' IS :OLD.id_tipo_identidad,
            KEY 'tipo_identidad' IS :OLD.tipo_identidad
            )),
            NULL, systimestamp, 'DELETE', user);
        END IF;
    END;


-------------------------------------------------------VISTAS-------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------

-- Vista para mostrar datos de un Usuario
CREATE VIEW VISTA_USUARIO AS
    SELECT (nombre||' '||p.apellido) AS nombre, edad,
    u.usuario AS usuario
    FROM persona p
    JOIN usuario u
    ON id_usuario = id_persona;
    
SELECT * FROM VISTA_USUARIO;


-- Vista para mostrar datos de la direccion
CREATE VIEW VISTA_DIRECCION AS
    SELECT (d.calle||' '||d.avenida||' '||d.otros) AS direccion,
    m.municipio AS municipio
    FROM direccion d
    JOIN municipio m
    ON id_municipio = id_direccion;
    
SELECT * FROM VISTA_DIRECCION;

/
