DROP DATABASE IF EXISTS COSECHANDO;
CREATE DATABASE IF NOT EXISTS COSECHANDO;
USE COSECHANDO;




DROP TABLE IF EXISTS USUARIO;
CREATE TABLE IF NOT EXISTS USUARIO(
USUARIO_ID	VARCHAR(8)	PRIMARY KEY,
NOMBRE_U	VARCHAR(50)	NOT NULL,
APELLIDO_U	VARCHAR(50)	NOT NULL,
CORREO_U	VARCHAR(70)	NOT NULL UNIQUE,
PASSWORD_U	VARCHAR(50) NOT NULL,
FECHA_NAC	DATE,
CUENTA_ACCESO_U	TINYINT,
NIVEL_ID	CHAR(8),
TIPOUSUARIO_ID CHAR(8)
);


DROP TABLE IF EXISTS TIPOUSUARIO;
CREATE TABLE IF NOT EXISTS TIPOUSUARIO(
TIPOUSUARIO_ID	CHAR(8)	PRIMARY KEY,
TIPO	VARCHAR(50)	NOT NULL,
DESCRIPCION	VARCHAR(100)
);


DROP TABLE IF EXISTS TERRENO;
CREATE TABLE IF NOT EXISTS TERRENO(
TERRENO_ID	CHAR(8)	PRIMARY KEY,
COORDENADAS	VARCHAR(50) NOT NULL,
USUARIO_ID	CHAR(8),
REGION_ID	CHAR(8),
DIRECCION_ID CHAR(8)
);

DROP TABLE IF EXISTS DIRECCION;
CREATE TABLE DIRECCION(
DIRECCION_ID	CHAR(8) PRIMARY KEY,
CALLE	VARCHAR(30),
NUMERO	VARCHAR(6),
COLONIA	VARCHAR(30));

DROP TABLE IF EXISTS REGION;
CREATE TABLE IF NOT EXISTS REGION(
REGION_ID	CHAR(8)	PRIMARY KEY,
NOMBRE_RE	VARCHAR(50)	NOT NULL,
MUNICIPIO_ID	VARCHAR(50),
TIPOSUELO_ID	CHAR(8)
);


DROP TABLE IF EXISTS TIPOSUELO;
CREATE TABLE IF NOT EXISTS TIPOSUELO(
TIPOSUELO_ID	CHAR(8)	PRIMARY KEY,
NOMBRE	VARCHAR(100)	NOT NULL,
REGION_ID	CHAR(8)
);


DROP TABLE IF EXISTS NIVEL;
CREATE TABLE IF NOT EXISTS NIVEL(
NIVEL_ID	CHAR(8)	PRIMARY KEY,
NOMBRE_N	VARCHAR(30)	NOT NULL,
DESCRIPCION_N	VARCHAR(100)
);


DROP TABLE IF EXISTS RECOMPENSA;
CREATE TABLE IF NOT EXISTS RECOMPENSA(
RECOMPENSA_ID	CHAR(8)	PRIMARY KEY,
RECOMPENSA_R	VARCHAR(30)	NOT NULL,
DESCRIPCION_R	VARCHAR(100)	NOT NULL,
PROMOTOR_ID	CHAR(8)
);


DROP TABLE IF EXISTS NIVEL_RECOMPENSA;
CREATE TABLE IF NOT EXISTS NIVEL_RECOMPENSA(
NIVEL_ID	CHAR(8),
RECOMPENSA_ID	CHAR(8)
);


DROP TABLE IF EXISTS PLANTA;
CREATE TABLE IF NOT EXISTS PLANTA(
PLANTA_ID	VARCHAR(8) 	PRIMARY KEY,
NOMBRE_P  VARCHAR(50)   NOT NULL,
TAMANO_P	VARCHAR(50),
TIPO	VARCHAR(50)	NOT NULL,
DESCRIPCION_P    TEXT    NOT NULL
);


DROP TABLE IF EXISTS CUIDADOS;
CREATE TABLE IF NOT EXISTS CUIDADOS(
CUIDADO_ID	CHAR(8)	PRIMARY KEY,
TIEMPOEJECUCION_CU	TIME,
FECHAAPLICACION_CU	DATE	NOT NULL,
RECURSOS_CU	VARCHAR(255)	NOT NULL
);


DROP TABLE IF EXISTS CUIDADOS_PLANTA;
CREATE TABLE IF NOT EXISTS CUIDADOS_PLANTA(
PLANTA_ID	varchar(8),
CUIDADO_ID	CHAR(8)
);


DROP TABLE IF EXISTS REGIONPLANTA;
CREATE TABLE IF NOT EXISTS REGIONPLANTA(
REGION_ID	CHAR(8),
PLANTA_ID	VARCHAR(8)
);


DROP TABLE IF EXISTS MUNICIPIO;
CREATE TABLE IF NOT EXISTS MUNICIPIO(
MUNICIPIO_ID	CHAR(8)	PRIMARY KEY,
NOMBRE_M	VARCHAR(100)	NOT NULL,
ESTADO_M	VARCHAR(100)	NOT NULL
);


DROP TABLE IF EXISTS PROMOTORES;
CREATE TABLE IF NOT EXISTS PROMOTORES(
PROMOTOR_ID CHAR(8)	PRIMARY KEY,
NOMBRE_PR	VARCHAR(25)	NOT NULL,
DESCRIPCION_PR	VARCHAR(255),
NUMCONVENIO_PR	CHAR(7) NOT NULL
);


ALTER TABLE USUARIO ADD FOREIGN KEY (NIVEL_ID) REFERENCES NIVEL(NIVEL_ID);
ALTER TABLE USUARIO ADD FOREIGN KEY (TIPOUSUARIO_ID) REFERENCES TIPOUSUARIO(TIPOUSUARIO_ID);
ALTER TABLE TERRENO ADD FOREIGN KEY (USUARIO_ID) REFERENCES USUARIO(USUARIO_ID);
ALTER TABLE TERRENO ADD FOREIGN KEY (REGION_ID) REFERENCES REGION(REGION_ID);
ALTER TABLE TERRENO ADD FOREIGN KEY (DIRECCION_ID) REFERENCES DIRECCION(DIRECCION_ID);
ALTER TABLE NIVEL_RECOMPENSA ADD FOREIGN KEY (NIVEL_ID) REFERENCES NIVEL(NIVEL_ID);
ALTER TABLE NIVEL_RECOMPENSA ADD FOREIGN KEY (RECOMPENSA_ID) REFERENCES RECOMPENSA(RECOMPENSA_ID);
ALTER TABLE CUIDADOS_PLANTA ADD FOREIGN KEY (CUIDADO_ID) REFERENCES CUIDADOS(CUIDADO_ID);
ALTER TABLE CUIDADOS_PLANTA ADD FOREIGN KEY (PLANTA_ID) REFERENCES PLANTA(PLANTA_ID);
ALTER TABLE RECOMPENSA ADD FOREIGN KEY (PROMOTOR_ID) REFERENCES PROMOTORES(PROMOTOR_ID);
ALTER TABLE REGIONPLANTA ADD FOREIGN KEY(REGION_ID) REFERENCES REGION(REGION_ID);
ALTER TABLE REGIONPLANTA ADD FOREIGN KEY(PLANTA_ID) REFERENCES PLANTA(PLANTA_ID);
ALTER TABLE REGION ADD FOREIGN KEY(MUNICIPIO_ID) REFERENCES MUNICIPIO(MUNICIPIO_ID);
ALTER TABLE REGION ADD FOREIGN KEY(TIPOSUELO_ID) REFERENCES TIPOSUELO(TIPOSUELO_ID);


INSERT INTO PROMOTORES(PROMOTOR_ID, NOMBRE_PR, DESCRIPCION_PR, NUMCONVENIO_PR) VALUES
('PROMO001','SAGARPA','SECRETARIA DE AGRICULTURA Y DESARROLLO RURAL','0000001'),
('PROMO002','DDRT','DISTRITO DE DESARROLLO RURAL DE TULANCINGO','0000002'),
('PROMO003','CADER','CENTRO DE APOYO AL DESARROLLO RURAL','0000003');

INSERT INTO MUNICIPIO(MUNICIPIO_ID, NOMBRE_M, ESTADO_M)VALUES
('MUNIC001', 'TULANCINGO DE BRAVO', 'HIDALGO'),
('MUNIC002', 'CUAUTEPEC DE HINOJOSA','HIDALGO'),
('MUNIC003', 'SANTIAGO TULANTEPEC DE LUGO GUERRERO', 'HIDALGO');

INSERT INTO NIVEL(NIVEL_ID, NOMBRE_N, DESCRIPCION_N) VALUES
('NIVEL001','INICIAL','NIVEL DE INICIO PARA LOS USUARIOS'),
('NIVEL002','PRINCIPIANTE','EL SEGUNDO NIVEL ALCANZADO POR UN USUARIO'),
('NIVEL003','INTERMEDIO','EL NIVEL MEDIO PARA CADA UNO DE LOS USUARIOS'),
('NIVEL004','AVANZADO 1', 'EL ULTIMO NIVEL DE UN USUARIO'),
('NIVEL005','AVANZADO 2', 'NIVEL OTORGADO A LOS USUARIOS MAS ANTIGUOS');

INSERT INTO TIPOUSUARIO(TIPOUSUARIO_ID,TIPO,DESCRIPCION) VALUES
('TUSER001','ADMINISTRADOR','USUARIO CAPAZ DE MODIFICAR ARTICULOS'),
('TUSER002','PROMOTOR','USUARIO CAPAZ DE PUBLICAR INFORMACION'),
('TUSER003','ORDINARIO','USUARIO PROMEDIO');

INSERT INTO TIPOSUELO(TIPOSUELO_ID,NOMBRE,REGION_ID) VALUES
('SUELO001','ANDOSOL','REGION_I'),
('SUELO002','LUBISOL','REGION_I'),
('SUELO003','PAHEOZEM','REGION_I'),
('SUELO004','REGOSOL','REGION_I'),
('SUELO005','VERTISOL','REGION_I');


INSERT INTO PLANTA (PLANTA_ID, NOMBRE_P, TAMANO_P,TIPO, DESCRIPCION_P) VALUES
('PLAN0','ENCINO', 'GRANDE', 'MADEDERO', 'UN ARBOL QUE PUEDE PRACTICAMENTE EN CUALQUIER PARTE'),
('PLAN1','PINO','MED-GDE','MADEDERO','ESTE ARBOL SE DESARROLLA DE MEJOR MANERA DENTRO DEL SUELO LUVISOL'),
('PLAN2','OYAMEL','MED-GDE','ARBOL','UN TIPO DE ARBOL MUY COMUN DE VER CERCA DE SUELO VOLCANICO'),
('PLAN3','PALO ZOPILOTE','GRANDE','MEDICINAL','LA SEMILLA DE ESTE ARBOL SE UTILIZA PARA EL TRATAMIENTO CONTRA LA DIABETES'),
('PLAN4','OCOTE','GRANDE','ARBOL','ESTE ARBOL SE DESARROLLA DE MEJOR MANERA DENTRO DEL SUELO LUVISOL'),
('PLAN5','JUNIPERUS','PEQUEÑO','ARBUSTO','UNA SUB-ESPECIE DE PINO QUE PODEMOS VER EN CALLES Y CARRETERAS'),
('PLAN6','AYACAHUITE','GRANDE','MADEDERO','SUB-ESPECIE DEL PINO QUE CRECE EN SUELO LUVISOL'),
('PLAN7','PINO CHIMONQUE','MEDIANO','MEDICINAL','CRECE EN SUELO LUVISOL, SE PUEDE HACER TE CON SU CORTEZA PARA LA TOS'),
('PLAN8','OOCARPA','MED-GDE','ARBOL','CRECE CERCA DE RIOS EN SUELO REGOSOL, SE CREE QUE ES UNA ESPECIE MADRE'),
('PLAN9','MAGUEY','MED','COSECHA/EXTRACCION','CRECE EN EL SUELO REGOZOL, EN TEMPORADA SE EXTRAEN LOS GUSANOS DE MAGUEY Y EL AGAVE'),
('PLAN10','NOPAL','MEDIANO','COSECHA/COMESTIBLE','CRECE EN SUELO REGOZOL, DE EL SE EXTRAEN LAS TUNAS, Y TAMBIEN SON COMESTIBLES'),
('PLAN11','MEZQUITE','CH-MED','MEDICINAL-MADERERO','FACIL DE ENCONTRAR EN SUELO REGOZOL, SU MADERA SE UTILIZA PARA HACER MUEBLES Y SUS HOJAS SIRVEN PARA EL TRATAMIENTO DE ENFERMEDADES OCULARES'),
('PLAN12','CARDON','MEDIANO','CACTUS','SE PUEDE ENCONTRAR EN CUALQUIER TIPO DE SUELO'),
('PLAN13','PIRUL','CH-MED','MEDICINAL','ESTA PLANTA SE UTILIZA COMO CICATRIZANTE NATURAL, FACIL DE ENCONTRAR EN SUELO LUVISOL');

#Procedimiento que crea el identidicador de la tabla planta automáticamente
DROP PROCEDURE IF EXISTS Creacion_id_planta;

DELIMITER //
CREATE PROCEDURE Creacion_id_planta(
	IN PRO_NOMBRE	VARCHAR(50),
    IN PRO_TAMANO	VARCHAR(50),
    IN PRO_TIPO		VARCHAR(50),
    IN PRO_DESCRIPCION	TEXT)
    BEGIN
    
		SET @CONTADOR = (SELECT COUNT(*) FROM PLANTA);
		SET @YUKO = (SELECT(CONCAT('PLAN',@CONTADOR)));
		INSERT INTO PLANTA(PLANTA_ID,NOMBRE_P,TAMANO_P,TIPO,DESCRIPCION_P) 
        VALUES (@YUKO,PRO_NOMBRE,PRO_TAMANO,PRO_TIPO,PRO_DESCRIPCION);    
        
    END //
DELIMITER ;

SELECT * FROM PLANTA;
call Creacion_id_planta('Marihuana','tres cabezas','droga','holk ase');

#Procedimiento que crea el identidicador de la tabla usuario automáticamente
DROP PROCEDURE IF EXISTS Creacion_id_terreno;

DELIMITER //
CREATE PROCEDURE Creacion_id_terreno(
	IN PRO_COORDENADAS	VARCHAR(50),
    IN PRO_CORREO	VARCHAR(70))
    BEGIN
    
		SET @CONTADOR = (SELECT COUNT(*) FROM TERRENO);
		SET @YUKO = (SELECT(CONCAT('TERR',@CONTADOR)));
		SET @USUARIO = (SELECT USUARIO_ID FROM USUARIO WHERE USUARIO_ID = PRO_CORREO);
		INSERT INTO TERRENO(TERRENO_ID,COORDENADAS,USUARIO_ID) 
        VALUES (@YUKO,PRO_COORDENADAS,@USUARIO);    
        
    END //
DELIMITER ;

SELECT * FROM TERRENO;

#Procedimiento que crea el identidicador de la tabla usuario automáticamente
DROP PROCEDURE IF EXISTS Creacion_id_usuario;

DELIMITER //
CREATE PROCEDURE Creacion_id_usuario(
	IN PRO_NOMBRE_U	VARCHAR(50),
    IN PRO_APELLIDO_U	VARCHAR(50),
    IN PRO_CORREO_U	VARCHAR(70),
    IN PRO_PASSWORD_U VARCHAR(50),
    IN PRO_FECHA_NAC DATE)
    BEGIN
    
		SET @CONTADOR = (SELECT COUNT(*) FROM USUARIO);
		SET @YUKO = (SELECT(CONCAT('USER',@CONTADOR)));
		INSERT INTO USUARIO(USUARIO_ID,NOMBRE_U,APELLIDO_U,CORREO_U,PASSWORD_U,FECHA_NAC)
        VALUES (@YUKO,PRO_NOMBRE_U,PRO_APELLIDO_U,PRO_CORREO_U,PRO_PASSWORD_U,PRO_FECHA_NAC);    
        
    END //
DELIMITER ;

CALL Creacion_id_usuario('Adrian','Cruz San Juan','natsuboladefuego@gmail.com',MD5('estaes_la_password'),'1998-05-22');
SELECT * FROM USUARIO;

create role 'usuario';
create role 'encargado';

create user 'Paulina'@'localhost' identified by 'yuko';
create user 'Adrian'@'localhost' identified by 'yuko';

grant all on COSECHANDO.* to 'encargado';
grant update on COSECHANDO.USUARIO to 'usuario';
grant insert on COSECHANDO.USUARIO to 'usuario';

flush privileges;

grant 'encargado'  to 'Adrian'@'localhost';
grant 'usuario'  to 'Paulina'@'localhost';

show grants for 'Adrian'@'localhost';
show grants for 'Paulina'@'localhost';

#TRIGGERS#
DROP TABLE IF EXISTS USUARIO_ESPEJO;
CREATE TABLE IF NOT EXISTS USUARIO_ESPEJO(
USUARIO_ID	VARCHAR(8)	PRIMARY KEY,
NOMBRE_U	VARCHAR(50)	NOT NULL,
APELLIDO_U	VARCHAR(50)	NOT NULL,
CORREO_U	VARCHAR(70)	NOT NULL UNIQUE,
PASSWORD_U	VARCHAR(50) NOT NULL,
FECHA_NAC	DATE,
CUENTA_ACCESO_U	TINYINT,
NIVEL_ID	CHAR(8),
TIPOUSUARIO_ID CHAR(8),
FECHA          DATETIME
);

DROP TRIGGER IF EXISTS TR_USUARIO;
CREATE TRIGGER TR_USUARIO AFTER INSERT ON USUARIO
FOR EACH ROW
INSERT INTO USUARIO_ESPEJO(USUARIO_ID, NOMBRE_U, APELLIDO_U, CORREO_U, PASSWORD_U, FECHA_NAC, CUENTA_ACCESO_U, NIVEL_ID, TIPOUSUARIO_ID, FECHA)
VALUES (NEW.USUARIO_ID, NEW.NOMBRE_U, NEW.APELLIDO_U, NEW.CORREO_U, NEW.PASSWORD_U, NEW.FECHA_NAC, NEW.CUENTA_ACCESO_U, NEW.NIVEL_ID, NEW.TIPOUSUARIO_ID, NOW());

DROP TABLE IF EXISTS TIPOUSUARIO_ESPEJO;
CREATE TABLE IF NOT EXISTS TIPOUSUARIO_ESPEJO(
TIPOUSUARIO_ID	CHAR(8)	PRIMARY KEY,
TIPO	VARCHAR(50)	NOT NULL,
DESCRIPCION	VARCHAR(100),
FECHA		DATETIME
);

DROP TRIGGER IF EXISTS TR_TIPOUSUARIO;
CREATE TRIGGER TR_TIPOUSUARIO AFTER INSERT ON TIPOUSUARIO
FOR EACH ROW
INSERT INTO TIPOUSUARIO_ESPEJO(TIPOUSUARIO_ID, TIPO, DESCRIPCION, FECHA)
VALUES (NEW.TIPOUSUARIO_ID, NEW.TIPO, NEW.DESCRIPCION, NOW());

DROP TABLE IF EXISTS TERRENO_ESPEJO;
CREATE TABLE IF NOT EXISTS TERRENO_ESPEJO(
TERRENO_ID	CHAR(8)	PRIMARY KEY,
COORDENADAS	VARCHAR(50) NOT NULL,
TAMANIO_T	VARCHAR(20),
USUARIO_ID	CHAR(8),
REGION_ID	CHAR(8),
DIRECCION_ID CHAR(8),
FECHA 		DATETIME 
);
DROP TRIGGER IF EXISTS TR_TERRENO;
CREATE TRIGGER TR_TERRENO AFTER INSERT ON TERRENO
FOR EACH ROW
INSERT INTO TERRENO_ESPEJO(TERRENO_ID, COORDENADAS, TAMANIO_T, USUARIO_ID, REGION_ID, DIRECCION_ID, FECHA)
VALUES (NEW.TERRENO_ID, NEW.COORDENADAS, NEW.TAMANIO_T, NEW.USUARIO_ID, NEW.REGION_ID, NEW.DIRECCION_ID, NOW());

DROP TABLE IF EXISTS DIRECCION_EPEJO;
CREATE TABLE DIRECCION_ESPEJO(
DIRECCION_ID	CHAR(8) PRIMARY KEY,
CALLE	VARCHAR(30),
NUMERO	VARCHAR(6),
COLONIA	VARCHAR(30),
FECHA   DATETIME
);
DROP TRIGGER IF EXISTS TR_TERRENO;
CREATE TRIGGER TR_TERRENO AFTER INSERT ON TERRENO
FOR EACH ROW
INSERT INTO TERRENO_ESPEJO(TERRENO_ID, COORDENADAS, TAMANIO_T, USUARIO_ID, REGION_ID, DIRECCION_ID, FECHA)
VALUES (NEW.TERRENO_ID, NEW.COORDENADAS, NEW.TAMANIO_T, NEW.USUARIO_ID, NEW.REGION_ID, NEW.DIRECCION_ID, NOW());

DROP TABLE IF EXISTS REGION_ESPEJO;
CREATE TABLE IF NOT EXISTS REGION_ESPEJO(
REGION_ID	CHAR(8)	PRIMARY KEY,
NOMBRE_RE	VARCHAR(50)	NOT NULL,
MUNICIPIO_ID	VARCHAR(50),
TIPOSUELO_ID	CHAR(8),
FECHA			DATETIME
);
DROP TRIGGER IF EXISTS TR_REGION;
CREATE TRIGGER TR_REGION AFTER INSERT ON REGION
FOR EACH ROW
INSERT INTO REGION_ESPEJO(REGION_ID, NOMBRE_RE, MUNICIPIO_ID, TIPOSUELO_ID, FECHA)
VALUES (NEW.REGION_ID, NEW.NOMBRE_RE, NEW.MUNICIPIO_ID, NEW.TIPOSUELO_ID, NOW());

DROP TABLE IF EXISTS TIPOSUELO_ESPEJO;
CREATE TABLE IF NOT EXISTS TIPOSUELO_ESPEJO(
TIPOSUELO_ID	CHAR(8)	PRIMARY KEY,
NOMBRE	VARCHAR(100)	NOT NULL,
REGION_ID	CHAR(12)
);
DROP TRIGGER IF EXISTS TR_TIPOSUELO;
CREATE TRIGGER TR_TIPOSUELO AFTER INSERT ON TIPOSUELO
FOR EACH ROW
INSERT INTO TIPOSUELO_ESPEJO(TIPOSUELO_ID, NOMBRE, REGION_ID, FECHA)
VALUES (NEW.TIPOSUELO_ID, NEW.NOMBRE, NEW.REGION_ID, NOW());

#VISTAS#
CREATE INDEX  NOMBRE_U ON USUARIO (NOMBRE_U);
SHOW INDEX FROM USUARIO ;

CREATE INDEX  PLANTA_ID ON PLANTA (PLANTA_ID);
SHOW INDEX FROM PLANTA ;

CREATE INDEX  RECOMPENSA_ID ON RECOMPENSA (RECOMPENSA_ID);
SHOW INDEX FROM RECOMPENSA ;

#CREATE OR REPLACE VIEW VISTA_TERRENO AS 
#/SELECT TE.DIRECCION_ID, TE.COORDENADAS, TE.TAMANIO_T, TE.USUARIO_ID, RE.REGION_ID, RE.NOMBRE_RE FROM TERRENO AS TE
#/INNER JOIN REGION AS RE ON TE.TERRENO_ID = TE.TERRENO_ID WHERE REGION_ID ='REGI001'; 

