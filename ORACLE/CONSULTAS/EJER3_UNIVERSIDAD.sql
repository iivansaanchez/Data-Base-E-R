--1. Cuantos costes básicos hay.

SELECT COUNT(COSTEBASICO) AS CANTIDAD_COSTESBASICO
FROM ASIGNATURA;

--2. Para cada titulación mostrar el número de asignaturas que hay junto con el nombre de la titulación.
SELECT COUNT(A.NOMBRE) AS AISNATURAS, T.NOMBRE AS NOMBRE_TITULACION
FROM ASIGNATURA A, TITULACION T
GROUP BY T.NOMBRE;

--3 Para cada titulación mostrar el nombre de la titulación junto con el precio total de todas sus asignaturas.
SELECT T.NOMBRE, SUM(A.COSTEBASICO)
FROM TITULACION T, ASIGNATURA A
WHERE T.IDTITULACION = A.IDTITULACION 
GROUP BY T.NOMBRE;

--4 Cual sería el coste global de cursar la titulación de Matemáticas si el coste de cada asignatura fuera incrementado en un 7%. 
SELECT T.NOMBRE, SUM(A.COSTEBASICO*0.7)
FROM ASIGNATURA A, TITULACION T
WHERE T.IDTITULACION = A.IDTITULACION
AND T.NOMBRE LIKE 'MATEMATICAS'
GROUP BY NOMBRE;

--5 Cuantos alumnos hay matriculados en cada asignatura, junto al id de la asignatura. 
SELECT COUNT(AA.NUMEROMATRICULA) AS ALUMNOS_MATRICULADOS, AA.IDASIGNATURA
FROM ALUMNO_ASIGNATURA aa
GROUP BY AA.IDASIGNATURA;

--6 Igual que el anterior pero mostrando el nombre de la asignatura.
SELECT COUNT(AA.NUMEROMATRICULA) AS ALUMNOS_MATRICULADOS, A.NOMBRE
FROM ALUMNO_ASIGNATURA AA, ASIGNATURA A
WHERE AA.IDASIGNATURA = A.IDASIGNATURA 
GROUP BY A.NOMBRE ;

--7 Mostrar para cada alumno, el nombre del alumno junto con lo que tendría que pagar por el total de todas las asignaturas en las que está matriculada. Recuerda que el precio de la matrícula tiene un incremento de un 10% por cada año en el que esté matriculado. 
SELECT P.NOMBRE, A.IDASIGNATURA, SUM(A.COSTEBASICO)
FROM PERSONA P, ASIGNATURA A, PROFESOR PR
WHERE P.DNI = PR.DNI AND PR.IDPROFESOR = A.IDPROFESOR
GROUP BY P.NOMBRE AND A.IDASIGNATURA;

--8 Coste medio de las asignaturas de cada titulación, para aquellas titulaciones en el que el coste total de la 1ª matrícula sea mayor que 60 euros. 
SELECT AVG(A.COSTEBASICO) AS COSTE_MEDIO, A.NOMBRE AS NOMBRE_ASIGNATURA, T.NOMBRE AS NOMBRE_TITULACION
FROM ASIGNATURA A, TITULACION T
WHERE A.IDTITULACION = T.IDTITULACION 
AND A.COSTEBASICO > 60
GROUP BY A.NOMBRE, T.NOMBRE;

--9 Nombre de las titulaciones  que tengan más de tres alumnos.
SELECT T.NOMBRE AS NOMBRE_TITULACIONES
FROM TITULACION T, ASIGNATURA A, ALUMNO_ASIGNATURA AA
WHERE T.IDTITULACION = A.IDTITULACION AND A.IDASIGNATURA = AA.IDASIGNATURA 
AND AA.IDALUMNO > 3;

--10 Nombre de cada ciudad junto con el número de personas que viven en ella.
SELECT CIUDAD, COUNT(NOMBRE) AS NUMERO_PERSONAS
FROM PERSONA
GROUP BY CIUDAD;

--11 Nombre de cada profesor junto con el número de asignaturas que imparte.
SELECT P.NOMBRE, COUNT(A.NOMBRE) AS NUMERO_ASIGNATURA
FROM PERSONA P, PROFESOR PR, ASIGNATURA A
WHERE P.DNI = PR.DNI AND PR.IDPROFESOR = A.IDPROFESOR
GROUP BY P.NOMBRE;

--12 Nombre de cada profesor junto con el número de alumnos que tiene, para aquellos profesores que tengan dos o más de 2 alumnos.
SELECT P.NOMBRE, COUNT(AA.IDALUMNO) AS NUMERO_ALUMNO
FROM PERSONA P, ALUMNO A, ALUMNO_ASIGNATURA AA
WHERE P.DNI = A.DNI AND A.IDALUMNO = AA.IDALUMNO 
GROUP BY P.NOMBRE
HAVING COUNT(AA.IDALUMNO) >= 2;

--13 Obtener el máximo de las sumas de los costesbásicos de cada cuatrimestre
SELECT CUATRIMESTRE, MAX(SUM(COSTEBASICO)) AS MAX_COSTEBASICO
FROM ASIGNATURA
GROUP BY CUATRIMESTRE;
 
--14 Suma del coste de las asignaturas
SELECT SUM(COSTEBASICO) SUMA_COSTE, NOMBRE AS NOMBRE_ASIGNATURA
FROM ASIGNATURA
GROUP BY NOMBRE;

--15 ¿Cuántas asignaturas hay?
SELECT COUNT(IDASIGNATURA) AS ASIGNATURAS
FROM ASIGNATURA;

--16 Coste de la asignatura más cara y de la más barata
SELECT MAX(COSTEBASICO) AS ASIGNATURA_CARA, MIN(COSTEBASICO) AS ASIGNATURA_BARATA, NOMBRE
FROM ASIGNATURA 
GROUP BY NOMBRE;

--17 ¿Cuántas posibilidades de créditos de asignatura hay?
SELECT CREDITOS
FROM ASIGNATURA;
--FALTA

--18 ¿Cuántos cursos hay?
SELECT COUNT(CURSO) AS NUMERO_CURSOS
FROM ASIGNATURA;

--19 ¿Cuántas ciudades hay?
SELECT COUNT(CIUDAD) AS NUMERO_CIUDADES
FROM PERSONA;

--20 Nombre y número de horas de todas las asignaturas.
SELECT A.NOMBRE
FROM ASISGNATURAS A

--21 Mostrar las asignaturas que no pertenecen a ninguna titulación.
SELECT A.NOMBRE
FROM ASIGNATURA A
WHERE A.IDTITULACION IS NULL;

--22 Listado del nombre completo de las personas, sus teléfonos y sus direcciones, llamando a la columna del nombre "NombreCompleto" y a la de direcciones "Direccion".
SELECT P.NOMBRE AS NOMBRE_COMPLETO, P.TELEFONO, P.DIRECCIONCALLE AS DIRECCION
FROM PERSONA P;

--23 Cual es el día siguiente al día en que nacieron las personas de la B.D.
SELECT APELLIDO,NOMBRE, ADD_MONTHS(FECHA_NACIMIENTO,1) AS DIA_SIGUIENTE
FROM PERSONA;


--24 Años de las personas de la Base de Datos, esta consulta tiene que valor para cualquier momento
SELECT APELLIDO, NOMBRE, TRUNC((TO_NUMBER(TO_CHAR(SYSDATE,'YYYYMMDD'))-TO_NUMBER(TO_CHAR(FECHA_NACIMIENTO,'YYYYMMDD')))/10000) AS EDAD
FROM PERSONA;

--25 Listado de personas mayores de 25 años ordenadas por apellidos y nombre, esta consulta tiene que valor para cualquier momento
SELECT APELLIDO, NOMBRE, TRUNC((TO_NUMBER(TO_CHAR(SYSDATE,'YYYYMMDD'))-TO_NUMBER(TO_CHAR(FECHA_NACIMIENTO,'YYYYMMDD')))/10000) AS EDAD
FROM PERSONA 
WHERE TRUNC((TO_NUMBER(TO_CHAR(SYSDATE,'YYYYMMDD'))-TO_NUMBER(TO_CHAR(FECHA_NACIMIENTO,'YYYYMMDD')))/10000) > 25
ORDER BY APELLIDO, NOMBRE;

--26 Nombres completos de los profesores que además son alumnos
SELECT P.NOMBRE, P.APELLIDO
FROM PERSONA P, PROFESOR PR, ALUMNO AL
WHERE PR.DNI = P.DNI AND P.DNI = AL.DNI;

--27 Suma de los créditos de las asignaturas de la titulación de Matemáticas
SELECT SUM(A.CREDITOS)
FROM ASIGNATURA A, TITULACION T
WHERE A.IDTITULACION = T.IDTITULACION 
AND T.NOMBRE LIKE 'Matematicas';

--28 Número de asignaturas de la titulación de Matemáticas
SELECT COUNT(A.IDASIGNATURA)
FROM ASIGNATURA A, TITULACION T
WHERE A.IDTITULACION = T.IDTITULACION 
AND T.NOMBRE LIKE 'Matematicas';

--29 ¿Cuánto paga cada alumno por su matrícula?
SELECT P.NOMBRE, SUM(ASI.COSTEBASICO) AS COSTE_MATRICULA
FROM PERSONA P, ALUMNO A, ALUMNO_ASIGNATURA AA, ASIGNATURA ASI
WHERE P.DNI=A.DNI AND A.IDALUMNO = AA.IDALUMNO AND AA.IDASIGNATURA = ASI.IDASIGNATURA
GROUP BY P.NOMBRE;


--30 ¿Cuántos alumnos hay matriculados en cada asignatura?
SELECT COUNT(P.NOMBRE) AS ALUMNOS
FROM PERSONA P, ALUMNO A, ALUMNO_ASIGNATURA AL, ASIGNATURA ASI
WHERE P.DNI = A.DNI AND A.IDALUMNO = AL.IDALUMNO AND AL.IDASIGNATURA = ASI.IDASIGNATURA
GROUP BY ASI.IDASIGNATURA;



