CREATE DATABASE GARAJE;
USE GARAJE;

CREATE TABLE VEHICULO 
(
MATRICULA VARCHAR(7),
MARCA VARCHAR(10) NOT NULL,
MODELO VARCHAR(10) NOT NULL,
FECHA_COMPRA DATE,
PRECIO_DIA INTEGER(5.2),

CONSTRAINT PK_VEHI PRIMARY KEY (MATRICULA),
CONSTRAINT CHK_VEHI CHECK (EXTRACT(YEAR FROM FECHA_COMPRA)>=2001),
CONSTRAINT CHK_VEHI2 CHECK (PRECIO_DIA > 0.0)
);

CREATE TABLE CLIENTES 
(
DNI VARCHAR(9),
NOMBRE VARCHAR(30) NOT NULL,
NACIONALIDAD VARCHAR(30),
FECHA_NAC DATE,
DIRECCION VARCHAR(50),

CONSTRAINT PK_CLI PRIMARY KEY (DNI)
);

CREATE TABLE ALQUILERES 
(
MATRICULA VARCHAR(7),
DNI VARCHAR(9),
FECHA_HORA DATE,
NUM_DIAS INTEGER(2) NOT NULL,
KILOMETROS INTEGER(4) DEFAULT 0,

CONSTRAINT PK_ALQ PRIMARY KEY (MATRICULA, DNI, FECHA_HORA),
CONSTRAINT FK_ALQ FOREIGN KEY (MATRICULA) REFERENCES VEHICULO(MATRICULA),
CONSTRAINT FK2_ALQ FOREIGN KEY (DNI) REFERENCES CLIENTES(DNI)
);


--RESTRICCIONES

ALTER TABLE CLIENTES ADD CONSTRAINT CHK_CLI CHECK(regexp_like(DNI, '[1-9]{8}-[A-Z]{1}'));
ALTER TABLE VEHICULO ADD CONSTRAINT CHK_VEHI3 CHECK (regexp_like(MATRICULA, '[1-9]{4}[A-Z]{3}'));
ALTER TABLE VEHICULO ADD KM_TOTALES INTEGER(9);

-----------------------------------------------------------------------------------------------