
Create table titulacion (
Idtitulacion varchar2(6) primary key,
Nombre varchar2(30)
);


Create table persona (
dni varchar2(11) primary key,
Nombre varchar2(30),
Apellido varchar2(30),
Ciudad varchar2(15),
Direccioncalle varchar2(30),
Direccionnum number,
Telefono varchar2(9),
Fecha_nacimiento date,
Varon number
);



create table alumno (
idalumno varchar2(7) primary key,
dni varchar2(11),
foreign key (dni) references persona(dni)
);

Create table profesor (
Idprofesor varchar2(4) primary key,
Dni varchar2(11),
Foreign key(dni) references persona(dni)
);

Create table asignatura (
Idasignatura varchar2(6) primary key,
Nombre varchar2(20),
Creditos number,
Cuatrimestre number,
Costebasico number,
Idprofesor varchar2(4),
Idtitulacion varchar2(6),
Curso number,
Foreign key(idprofesor) references profesor(idprofesor),
Foreign key (idtitulacion) references titulacion(idtitulacion)
);

Create table  alumno_asignatura (
Idalumno varchar2(7),
Idasignatura varchar2(6),
Numeromatricula number,
  PRIMARY KEY(idalumno,idasignatura,numeromatricula),
Foreign key(idalumno) references alumno(idalumno),
Foreign key(idasignatura) references asignatura(idasignatura)
);


insert into persona values ('16161616A','Luis','Ramirez','Haro','Pez','34','941111111',to_date('1/1/1969','dd/mm/yyyy'),'1');
insert into persona values ('17171717A','Laura','Beltran','Madrid','Gran Va','23','912121212',to_date('8/8/1974','dd/mm/yyyy'),'0');
insert into persona values ('18181818A','Pepe','Perez','Madrid','Percebe','13','913131313',to_date('2/2/1980','dd/mm/yyyy'),'1');
insert into persona values ('19191919A','Juan','Sanchez','Bilbao','Melancola','7','944141414',to_date('3/2/1966','dd/mm/yyyy'),'1');
insert into persona values ('20202020A','Luis','Jimenez','Najera','Cigea','15','941151515',to_date('3/3/1979','dd/mm/yyyy'),'1');
insert into persona values ('21212121A','Rosa','Garcia','Haro','Alegra','16','941161616',to_date('4/4/1978','dd/mm/yyyy'),'0');
insert into persona values ('23232323A','Jorge','Saenz','Sevilla','Luis Ulloa','17','941171717',to_date('9/9/1978','dd/mm/yyyy'),'1');
insert into persona values ('24242424A','Mara','Gutierrez','Sevilla','Avda. de la Paz','18','941181818',to_date('10/10/1964','dd/mm/yyyy'),'0');
insert into persona values ('25252525A','Rosario','Diaz','Sevilla','Percebe','19','941191919',to_date('11/11/1971','dd/mm/yyyy'),'0');
insert into persona values ('26262626A','Elena','Gonzalez','Sevilla','Percebe','20','941202020',to_date('5/5/1975','dd/mm/yyyy'),'0');


insert into alumno values ('A010101','21212121A');
insert into alumno values ('A020202','18181818A');
insert into alumno values ('A030303','20202020A');
insert into alumno values ('A040404','26262626A');
insert into alumno values ('A121212','16161616A');
insert into alumno values ('A131313','17171717A');


insert into profesor values ('P101','19191919A');
insert into profesor values ('P117','25252525A');
insert into profesor values ('P203','23232323A');
insert into profesor values ('P204','26262626A');
insert into profesor values ('P304','24242424A');


insert into titulacion values ('130110','Matematicas');
insert into titulacion values ('150210','Quimicas');
insert into titulacion values ('160000','Empresariales');


insert into asignatura values ('000115','Seguridad Vial','4','1','30 ','P204',null,null);
insert into asignatura values ('130113','Programacion I', '9','1','60 ','P101','130110','1');
insert into asignatura values ('130122','Analisis II',    '9','2','60 ','P203','130110','2');
insert into asignatura values ('150212','Quimica Fisica','4','2','70','P304','150210','1');
insert into asignatura values ('160002','Contabilidad','6','1','70','P117','160000','1');


insert into alumno_asignatura values('A010101','150212','1');
insert into alumno_asignatura values('A020202','130113','1');
insert into alumno_asignatura values('A020202','150212','2');
insert into alumno_asignatura values('A030303','130113','3');
insert into alumno_asignatura values('A030303','150212','1');
insert into alumno_asignatura values('A030303','130122','2');
insert into alumno_asignatura values('A040404','130122','1');
insert into alumno_asignatura values('A121212','000115','1');
insert into alumno_asignatura values('A131313','160002','4');






--1. Mostrar los nombres y los créditos de cada una de las asignaturas.

SELECT ASIGNATURA.NOMBRE, ASIGNATURA.CREDITOS
FROM ASIGNATURA;


--2. Obtener los posibles distintos créditos de las asignaturas que hay en la base de datos.

SELECT DISTINCT ASIGNATURA.CREDITOS
FROM ASIGNATURA;

--3. Mostrar todos los datos de todas de las personas

SELECT * FROM PERSONA;

--4. Mostrar el nombre y créditos de las asignaturas del primer cuatrimestre.

SELECT ASIGNATURA.NOMBRE, ASIGNATURA.CREDITOS
FROM ASIGNATURA
WHERE ASIGNATURA.CUATRIMESTRE = 1;


--5. Mostrar el nombre y el apellido de las personas nacidas antes del 1 de enero de 1975.

SELECT PERSONA.NOMBRE, PERSONA.APELLIDO, FECHA_NACIMIENTO 
FROM PERSONA 
WHERE FECHA_NACIMIENTO < TO_DATE('01/01/1975', 'DD/MM/YYYY');

--6. Mostrar el nombre y el coste básico de las asignaturas de más de 4,5 créditos.


SELECT ASIGNATURA.NOMBRE, ASIGNATURA.COSTEBASICO 
FROM ASIGNATURA
WHERE ASIGNATURA.CREDITOS > 4.5;

--7. Mostrar el nombre de las asignaturas cuyo coste básico está entre 25 y 35 euros.

SELECT ASIGNATURA.NOMBRE
FROM ASIGNATURA
WHERE ASIGNATURA.COSTEBASICO BETWEEN 25 AND 35;


--8. Mostrar el identificador de los alumnos matriculados en la asignatura '150212' o en la '130113' o en ambas.


SELECT ALUMNO.IDALUMNO 
FROM ALUMNO, ALUMNO_ASIGNATURA
WHERE (ALUMNO_ASIGNATURA.IDASIGNATURA LIKE '150212' OR ALUMNO_ASIGNATURA.IDASIGNATURA LIKE '130113' 
OR (ALUMNO_ASIGNATURA.IDASIGNATURA LIKE '150212' AND ALUMNO_ASIGNATURA.IDASIGNATURA LIKE '130113'));

--9. Obtener el nombre de las asignaturas del 2º cuatrimestre que no sean de 6 créditos.

SELECT ASIGNATURA.NOMBRE
FROM ASIGNATURA
WHERE ASIGNATURA.CUATRIMESTRE = 2
AND ASIGNATURA.CREDITOS != 6;


--10. Mostrar el nombre y el apellido de las personas cuyo apellido comience por 'G'.

SELECT PERSONA.NOMBRE, PERSONA.APELLIDO 
FROM PERSONA 
WHERE PERSONA.APELLIDO LIKE 'G%'

--11. Obtener el nombre de las asignaturas que no tienen dato para el IdTitulacion. 

SELECT ASIGNATURA.NOMBRE 
FROM ASIGNATURA
WHERE ASIGNATURA.IDTITULACION IS NULL;

--12. Obtener el nombre de las asignaturas que tienen dato para el IdTitulacion.
SELECT ASIGNATURA.NOMBRE 
FROM ASIGNATURA
WHERE ASIGNATURA.IDTITULACION IS NOT NULL;


--13. Mostrar el nombre de las asignaturas cuyo coste por cada crédito sea mayor de 8 euros. 

SELECT ASIGNATURA.NOMBRE 
FROM ASIGNATURA
WHERE ASIGNATURA.CREDITOS > 8;

--14. Mostrar el nombre y el número de horas de las asignaturas de la base de datos. (1cred.=10 horas).

SELECT ASIGNATURA.NOMBRE, ASIGNATURA.CREDITOS*10 AS NUMERO_HORAS
FROM ASIGNATURA;

--15. Mostrar todos los datos de las asignaturas del 2º cuatrimestre ordenados por el identificador de asignatura.

SELECT * FROM ASIGNATURA 
WHERE ASIGNATURA.CUATRIMESTRE = 2
ORDER BY IDASIGNATURA ;

--16. Mostrar el nombre de todas las mujeres que viven en “Madrid”.











