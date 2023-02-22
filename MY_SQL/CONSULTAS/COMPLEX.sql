alter session set "_oracle_script"=true;  
create user COMPLEX identified by COMPLEX
GRANT CONNECT, RESOURCE, DBA TO COMPLEX;

CREATE TABLE fabricante 
(
id_fab integer(20),
nombre varchar(20),
pais varchar(30),

CONSTRAINT pk_fabri PRIMARY KEY (id_fab)
);

CREATE TABLE programa 
(
codigo integer(20),
nombre varchar(20),
version varchar(20),

CONSTRAINT pk_prog PRIMARY KEY (codigo)
);

CREATE TABLE comercio 
(
cif integer(5),
nombre varchar(30),
ciudad varchar(20),

CONSTRAINT pk_comercio PRIMARY KEY (cif)
);

CREATE TABLE desarrolla 
(
id_fab integer(20),
codigo integer(20),

CONSTRAINT pk_desarrolla PRIMARY KEY (id_fab, codigo),
CONSTRAINT fk_id FOREIGN KEY (id_fab) REFERENCES fabricante(id_fab),
CONSTRAINT fk_cod FOREIGN KEY (codigo) REFERENCES programa(codigo)
);

CREATE TABLE distribuye 
(
cif integer(5),
codigo integer(20),
cantidad integer(20),

CONSTRAINT pk_dis PRIMARY KEY (cif, codigo),
CONSTRAINT fk_codigo FOREIGN KEY (codigo) REFERENCES programa(codigo),
CONSTRAINT fk_cif FOREIGN KEY (cif) REFERENCES comercio(cif)
);

CREATE TABLE cliente 
(
dni integer(10),
nombre varchar(30),
edad integer(5),

CONSTRAINT pk_cli PRIMARY KEY (dni)
);

CREATE TABLE registra
(
cif integer(5),
dni integer(10),
codigo integer(20),
medio varchar(20),

CONSTRAINT pk_reg PRIMARY KEY (cif, dni, codigo),
CONSTRAINT fk_ciif FOREIGN KEY (cif) REFERENCES comercio(cif),
CONSTRAINT fk_dni FOREIGN KEY (dni) REFERENCES cliente(dni),
CONSTRAINT fk_codigoo FOREIGN KEY (codigo) REFERENCES programa(codigo)
);

INSERT INTO fabricante values (1,'Oracle','Estados Unidos');
INSERT INTO fabricante values (2,'Microsoft','Estados Unidos');
INSERT INTO fabricante values (3,'IBM','Estados Unidos');
INSERT INTO fabricante values (4,'Dinamic','Espa�a');
INSERT INTO fabricante values (5,'Borland','Estados Unidos');
INSERT INTO fabricante values (6,'Symantec','Estados Unidos');

INSERT INTO programa values (1,'Aplication Server','9i');
INSERT INTO programa values (2,'Database','8i');
INSERT INTO programa values (3,'Database','9i');
INSERT INTO programa values (4,'Database','10g');
INSERT INTO programa values (5,'Developer','6i');
INSERT INTO programa values (6,'Access','97');
INSERT INTO programa values (7,'Access','2000');
INSERT INTO programa values (8,'Access','XP');
INSERT INTO programa values (9,'Windows','98');
INSERT INTO programa values (10,'Windows','XP Profesional');
INSERT INTO programa values (11,'Windows','XP Home Edition');
INSERT INTO programa values (12,'Windows','2003 Server');
INSERT INTO programa values (13,'Norton Security','2004');
INSERT INTO programa values (14,'Freddy Hardest','-');
INSERT INTO programa values (15,'Paradox','2');
INSERT INTO programa values (16,'C++Builder','55');
INSERT INTO programa values (17,'DB/2','20');
INSERT INTO programa values (18,'OS/2','10');
INSERT INTO programa values (19,'JBuilder','X');
INSERT INTO programa values (20,'La prision','10');


INSERT INTO comercio values (1,'El Corte Ingles','Sevilla');
INSERT INTO comercio values (2,'El Corte Ingles','Madrid');
INSERT INTO comercio values (3,'Jump','Valencia');
INSERT INTO comercio values (4,'Centro Mail','Sevilla');
INSERT INTO comercio values (5,'FNAC','Barcelona');

INSERT INTO cliente values (1,'Pepe Perez',45);
INSERT INTO cliente values (2,'Juan Gonzalez',45);
INSERT INTO cliente values (3,'Maria Gomez',33);
INSERT INTO cliente values (4,'Javier Casado',18);
INSERT INTO cliente values (5,'Nuria Sanchez',29);
INSERT INTO cliente values (6,'Antonio Navarro',58);


INSERT INTO desarrolla values (1,1);
INSERT INTO desarrolla values (1,2);
INSERT INTO desarrolla values (1,3);
INSERT INTO desarrolla values (1,4);
INSERT INTO desarrolla values (1,5);
INSERT INTO desarrolla values (2,6);
INSERT INTO desarrolla values (2,7);
INSERT INTO desarrolla values (2,8);
INSERT INTO desarrolla values (2,9);
INSERT INTO desarrolla values (2,10);
INSERT INTO desarrolla values (2,11);
INSERT INTO desarrolla values (2,12);
INSERT INTO desarrolla values (6,13);
INSERT INTO desarrolla values (4,14);
INSERT INTO desarrolla values (5,15);
INSERT INTO desarrolla values (5,16);
INSERT INTO desarrolla values (3,17);
INSERT INTO desarrolla values (3,18);
INSERT INTO desarrolla values (5,19);
INSERT INTO desarrolla values (4,20);


INSERT INTO distribuye values (1,1,10);
INSERT INTO distribuye values (1,2,11);
INSERT INTO distribuye values (1,6,5);
INSERT INTO distribuye values (1,7,3);
INSERT INTO distribuye values (1,10,5);
INSERT INTO distribuye values (1,13,7);
INSERT INTO distribuye values (2,1,6);
INSERT INTO distribuye values (2,2,6);
INSERT INTO distribuye values (2,6,4);
INSERT INTO distribuye values (2,7,7);
INSERT INTO distribuye values (3,10,8);
INSERT INTO distribuye values (3,13,5);
INSERT INTO distribuye values (4,14,3);
INSERT INTO distribuye values (4,20,6);
INSERT INTO distribuye values (5,15,8);
INSERT INTO distribuye values (5,16,2);
INSERT INTO distribuye values (5,19,6);
INSERT INTO distribuye values (5,8,8);


INSERT INTO registra values (1,1,1,'Internet');
INSERT INTO registra values (1,3,4,'Tarjeta postal');
INSERT INTO registra values (1,1,1,'Telefono');

---------------------------------------------------
--1
SELECT DNI FROM CLIENTE;
--2
SELECT * FROM PROGRAMA;
--3
SELECT NOMBRE FROM PROGRAMA;
--4
SELECT NOMBRE FROM COMERCIO;
--5
SELECT DISTINCT C.NOMBRE 
FROM COMERCIO C, DISTRIBUYE D
WHERE C.CIF=D.CIF;
--6
SELECT DISTINCT NOMBRE FROM PROGRAMA;
--7
SELECT DNI 
FROM CLIENTE
WHERE DNI>4;
--8
SELECT CODIGO*7 FROM PROGRAMA;
--9
SELECT CODIGO FROM PROGRAMA 
WHERE CODIGO<=10;
--10
SELECT NOMBRE FROM PROGRAMA WHERE CODIGO=11;
--11
SELECT NOMBRE FROM FABRICANTE
WHERE PAIS LIKE 'Estados Unidos';
--12
SELECT NOMBRE FROM FABRICANTE 
WHERE 'Espa�a' NOT IN (NOMBRE);
--13
SELECT CODIGO FROM PROGRAMA 
WHERE NOMBRE LIKE 'Windows';
--14
SELECT C.CIUDAD FROM COMERCIO C, DISTRIBUYE D
WHERE D.CIF=C.CIF AND C.NOMBRE LIKE 'El Corte Ingles';
--15
SELECT NOMBRE FROM COMERCIO 
WHERE 'El Corte Ingles' NOT IN (nombre);
--16
SELECT CODIGO FROM PROGRAMA 
WHERE 'Windows' IN (NOMBRE) or 'Access' IN (NOMBRE);
--17
SELECT NOMBRE FROM CLIENTE 
WHERE EDAD BETWEEN 10 AND 25 OR EDAD>50;

SELECT NOMBRE FROM CLIENTE 
WHERE EDAD>=10 AND EDAD<=25 OR EDAD>50;
--18
SELECT DISTINCT NOMBRE FROM COMERCIO 
WHERE CIUDAD LIKE 'Sevilla' or CIUDAD LIKE 'Madrid';
--19
SELECT NOMBRE FROM CLIENTE 
WHERE NOMBRE LIKE '%o';
--20
SELECT NOMBRE FROM CLIENTE 
WHERE NOMBRE LIKE '%o' AND EDAD>30;
--21
SELECT * FROM PROGRAMA
WHERE VERSION LIKE '%i' OR nombre LIKE 'A%' OR 
nombre LIKE 'W%';
--22
SELECT * FROM PROGRAMA
WHERE VERSION LIKE '%i'OR 
(nombre LIKE 'A%' AND nombre LIKE '%S');
--23
SELECT * FROM PROGRAMA
WHERE VERSION LIKE '%i' AND 'A%' NOT IN NOMBRE;
--24
SELECT NOMBRE FROM FABRICANTE 
ORDER BY NOMBRE ASC;
--25
SELECT NOMBRE FROM FABRICANTE 
ORDER BY NOMBRE DESC;