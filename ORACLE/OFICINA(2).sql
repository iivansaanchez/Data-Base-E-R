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









