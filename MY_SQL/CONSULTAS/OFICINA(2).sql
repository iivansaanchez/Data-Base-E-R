# 1. Mostrar el apellido, oficio y número de departamento de cada empleado.

SELECT APELLIDO, OFICIO, DEPT_NO
FROM EMPLE;

#2. Mostrar el número, nombre y localización de cada departamento.

SELECT * FROM DEPART;

#3. Mostrar todos los datos de todos los empleados

SELECT * FROM EMPLE;

#4. Datos de los empleados ordenados por apellidos.

SELECT * FROM EMPLE 
ORDER BY APELLIDO;

#5. Datos de los empleados ordenados por número de departamento
#descendentemente.

SELECT * FROM EMPLE 
ORDER BY DEPT_NO DESC;

#6. Datos de los empleados ordenados por número de departamento
#descendentemente y dentro de cada departamento ordenados por apellido
#ascendentemente.

SELECT * FROM EMPLE 
ORDER BY DEPT_NO DESC, APELLIDO ASC;

#7.  Mostrar los datos de los empleados cuyo salario sea mayor que 2000000

SELECT * FROM EMPLE 
WHERE SALARIO > 2000000;

#8.  Mostrar los datos de los empleados cuyo oficio sea ʻANALISTAʼ.

SELECT * FROM EMPLE 
WHERE OFICIO LIKE 'ANALISTA';

#9. Seleccionar el apellido y oficio de los empleados del departamento número
#20.

SELECT APELLIDO, OFICIO 
FROM EMPLE 
WHERE DEPT_NO = 20;

#10. Mostrar todos los datos de los empleados ordenados por apellido.

SELECT * FROM EMPLE 
ORDER BY APELLIDO;

#11. Seleccionar los empleados cuyo oficio sea ʻVENDEDORʼ. Mostrar los datos
#ordenados por apellido.

SELECT * FROM EMPLE 
WHERE OFICIO LIKE 'VENDEDOR'
ORDER BY APELLIDO;

#12. Mostrar los empleados cuyo departamento sea 10 y cuyo oficio sea
#ʻANALISTAʼ. Ordenar el resultado por apellido.

SELECT * FROM EMPLE 
WHERE DEPT_NO = 10
AND OFICIO LIKE 'ANALISTA'
ORDER BY APELLIDO;

#13. Mostrar los empleados que tengan un salario mayor que 200000 o que
#pertenezcan al departamento número 20.


SELECT * FROM EMPLE 
WHERE (SALARIO > 2000000 OR DEPT_NO = 20);

#14. Ordenar los empleados por oficio, y dentro de oficio por apellido

SELECT * FROM EMPLE 
ORDER BY OFICIO, APELLIDO;

#15. Seleccionar de la tabla EMPLE los empleados cuyo apellido empiece por
#ʻAʼ.

SELECT * FROM EMPLE 
WHERE APELLIDO LIKE 'A%';

#16. Seleccionar de la tabla EMPLE los empleados cuyo apellido termine por ʻZʼ.

SELECT * FROM EMPLE 
WHERE APELLIDO LIKE '%Z';

#17. Seleccionar de la tabla EMPLE aquellas filas cuyo APELLIDO empiece por
#ʻAʼ y el OFICIO tenga una ʻEʼ en cualquier posición.

SELECT * FROM EMPLE 
WHERE APELLIDO LIKE 'A%'
AND OFICIO LIKE '%E%';

#18. Seleccionar los empleados cuyo salario esté entre 100000 y 200000. Utilizar
#el operador BETWEEN

SELECT * FROM EMPLE 
WHERE SALARIO BETWEEN 100000 AND 200000;

#19. Obtener los empleados cuyo oficio sea ʻVENDEDORʼ y tengan una comisión
#superior a 100000.

SELECT * FROM EMPLE 
WHERE OFICIO LIKE 'VENDEDOR'
AND COMISION > 100000;


#20. Seleccionar los datos de los empleados ordenados por número de
#departamento, y dentro de cada departamento ordenados por apellido.

SELECT * FROM EMPLE
ORDER BY DEPT_NO, APELLIDO;

#21. Número y apellidos de los empleados cuyo apellido termine por ʻZʼ y tengan
#un salario superior a 300000.

SELECT DEPT_NO, APELLIDO 
FROM EMPLE 
WHERE APELLIDO LIKE '%Z'
AND SALARIO > 300000;

#22. Datos de los departamentos cuya localización empiece por ʻBʼ.

SELECT * FROM DEPART 
WHERE LOC LIKE 'B%';

#23. Datos de los empleados cuyo oficio sea ʻEMPLEADOʼ, tengan un salario
#superior a 100000 y pertenezcan al departamento número 10.

SELECT * FROM EMPLE 
WHERE OFICIO LIKE 'EMPLEADO'
AND SALARIO > 100000
AND DEPT_NO = 10;


#24. Mostrar los apellidos de los empleados que no tengan comisión

SELECT APELLIDO
FROM EMPLE 
WHERE COMISION IS NULL;

#25. Mostrar los apellidos de los empleados que no tengan comisión y cuyo
#apellido empiece por ʻJʼ

SELECT APELLIDO
FROM EMPLE 
WHERE COMISION IS NULL
AND APELLIDO LIKE 'J%';


#26. Mostrar los apellidos de los empleados cuyo oficio sea ʻVENDEDORʼ,
#ʻANALISTAʼ o ʻEMPLEADOʼ.

SELECT APELLIDO
FROM EMPLE 
WHERE (OFICIO LIKE 'VENDEDOR' OR OFICIO LIKE 'ANALISTA' OR OFICIO LIKE 'EMPLEADO');

#27.Mostrar los apellidos de los empleados cuyo oficio no sea ni ʻANALISTAʼ ni
#ʻEMPLEADOʼ, y además tengan un salario mayor de 200000.

SELECT APELLIDO
FROM EMPLE 
WHERE NOT (OFICIO LIKE 'ANALISTA' OR OFICIO LIKE 'EMPLEADO')
AND SALARIO > 200000;

#28. Seleccionar de la tabla EMPLE los empleados cuyo salario esté entre
#2000000 y 3000000 (utilizar BETWEEN).

SELECT * FROM EMPLE
WHERE SALARIO BETWEEN 2000000 AND 3000000;

#29. Seleccionar el apellido, salario y número de departamento de los empleados
#cuyo salario sea mayor que 200000 en los departamentos 10 ó 30.

SELECT APELLIDO, SALARIO, DEPT_NO
FROM EMPLE 
WHERE SALARIO > 200000
AND (DEPT_NO=10 OR DEPT_NO=30);


#30. Mostrar el apellido y número de los empleados cuyo salario no esté entre
#100000 y 200000 (utilizar BETWEEN).

SELECT APELLIDO, DEPT_NO 
FROM EMPLE 
WHERE SALARIO BETWEEN 100000 AND 200000;


#31. Obtener el apellidos de todos los empleados en minúscula

SELECT APELLIDO
FROM EMPLE
WHERE LOWER(APELLIDO)=APELLIDO;

#32. En una consulta concatena el apellido de cada empleado con su oficio

SELECT CONCAT(APELLIDO, ' ', OFICIO)
FROM EMPLE;

#33. Mostrar el apellido y la longitud del apellido (función LENGTH) de todos
#los empleados, ordenados por la longitud de los apellidos de los
#empleados descendentemente.

SELECT APELLIDO, LENGTH(APELLIDO)
FROM EMPLE 
ORDER BY LENGTH(APELLIDO) DESC;

#34. Obtener el año de contratación de todos los empleados (función YEAR)

SELECT YEAR(FECHA_ALTA) FROM EMPLE ;

#35. Mostrar los datos de los empleados que hayan sido contratados en el
#año 1992

SELECT * FROM EMPLE
WHERE YEAR(FECHA_ALTA)=1992;

#36. Mostrar los datos de los empleados que hayan sido contratados en el
#mes de febrero de cualquier año (función MONTHNAME).

SELECT * FROM EMPLE 
WHERE MONTHNAME(FECHA_ALTA)='FEBRUARY';

#37. Para cada empleado mostrar el apellido y el mayor valor del salario y la
#comisión que tienen.

#38. Mostrar los datos de los empleados cuyo apellido empiece por 'A' y
#hayan sido contratados en el año 1990.

SELECT * FROM EMPLE 
WHERE APELLIDO LIKE 'A%'
AND YEAR(FECHA_ALTA)=1990;

#39. Mostrar los datos de los empleados del departamento 10 que no tengan
#comisión.

SELECT * FROM EMPLE
WHERE DEPT_NO = 10
AND COMISION IS NULL;







