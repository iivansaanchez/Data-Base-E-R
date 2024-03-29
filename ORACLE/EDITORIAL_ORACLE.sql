ALTER SESSION SET "_oracle_script"=TRUE;
CREATE USER EDITORIAL IDENTIFIED BY EDITORIAL;
GRANT CONNECT, RESOURCE, DBA TO EDITORIAL;

DROP TABLE LIBRO_AUTOR CASCADE CONSTRAINT;
DROP TABLE PUBLICACIONES CASCADE CONSTRAINT;
DROP TABLE EDITORIAL CASCADE CONSTRAINT;
DROP TABLE AUTOR CASCADE CONSTRAINT;
DROP TABLE LIBRO CASCADE CONSTRAINT;
DROP TABLE TEMA CASCADE CONSTRAINT;

CREATE TABLE TEMA (

cod_tema NUMBER(10),
denominacion VARCHAR2(10),
cod_tema_padre NUMBER(10) NOT NULL,

CONSTRAINT pk_tema PRIMARY KEY (cod_tema),
CONSTRAINT fk_tema FOREIGN KEY (cod_tema_padre) REFERENCES TEMA(cod_tema)

);

CREATE TABLE LIBRO(
cod_libro VARCHAR2(10),
titulo VARCHAR2(10),
f_creacion DATE,
cod_tema NUMBER(10) NOT NULL,
autor_principal VARCHAR2(10) NOT NULL,

CONSTRAINT PK_LIBRO PRIMARY KEY (cod_libro),
CONSTRAINT FK1_LIBRO FOREIGN KEY (cod_tema) REFERENCES TEMA(cod_tema)
);

CREATE TABLE AUTOR (

cod_autor VARCHAR2(10),
nombre VARCHAR2(10),
f_nacimiento DATE,
libro_principal VARCHAR2(20) NOT NULL,

CONSTRAINT PK_AUTOR PRIMARY KEY (cod_autor),
CONSTRAINT FK_AUTOR FOREIGN KEY (libro_principal) REFERENCES LIBRO(cod_libro)
);

ALTER TABLE LIBRO ADD CONSTRAINT FK2_LIBRO FOREIGN KEY (autor_principal) REFERENCES AUTOR(cod_autor);

CREATE TABLE LIBRO_AUTOR(
cod_libro VARCHAR2(10),
cod_autor VARCHAR2(10),
orden NUMBER(5),

CONSTRAINT PK_LIBRO_a PRIMARY KEY (cod_libro, cod_autor),
CONSTRAINT FK1_LIBRO_a FOREIGN KEY (cod_libro) REFERENCES LIBRO(cod_libro),
CONSTRAINT FK2_LIBRO_a FOREIGN KEY (cod_autor) REFERENCES AUTOR(cod_autor)
);

CREATE TABLE EDITORIAL(
cod_editorial VARCHAR2(10) NOT NULL,
denominacion VARCHAR2(10),

CONSTRAINT PK_EDITORIAL PRIMARY KEY (cod_editorial)
);

CREATE TABLE PUBLICACIONES(

cod_editorial VARCHAR2(10),
cod_libro VARCHAR2(10),
precio NUMBER(5,2),
f_publicacion DATE,

CONSTRAINT PK_PUBLICACIONES PRIMARY KEY (cod_editorial, cod_libro),
CONSTRAINT FK_PUBLICACIONES FOREIGN KEY (cod_editorial) REFERENCES EDITORIAL(cod_editorial) ON DELETE CASCADE,
CONSTRAINT FK2_PUBLICACIONES FOREIGN KEY (cod_libro) REFERENCES LIBRO(cod_libro)

);


--CONSTRAINT
-- 1. El campo orden solo podrá tomar valores de 1 a 5 (ambos inclusive), ya que no tiene 
-- sentido que haya más de cinco escritores.

ALTER TABLE LIBRO_AUTOR ADD CONSTRAINT CHK1_LIBRO_a CHECK (orden BETWEEN 1 AND 5);

-- 2. El código del Tema tendrá que ser numérico, y el cod_tema_padre no podrá ser menor que el código del tema.

ALTER TABLE TEMA ADD CONSTRAINT CHK2_TEMA CHECK (NOT cod_tema_padre < cod_tema);

-- 3. El campo “f_publicacion” tendrá que tomar como valor por defecto la fecha del día 
-- actual en que se inserte el registro.

ALTER TABLE PUBLICACIONES MODIFY f_publicacion DATE DEFAULT SYSDATE;

--4. No se deberá permitir que se borre un autor que sea el autor principal de un libro ya existente en la base de datos.
-- NO SE PONE NADA EN LA FK

--5. Si se borra una editorial se deberán borrar todas las publicaciones realizadas por la editorial.
-- SE PONE EN LA FK LA COLETILLA ON DELETE CASCADE

--6. El precio de una publicación no podrá ser nulo y además debe ser mayor que cero.
ALTER TABLE PUBLICACIONES MODIFY precio NUMBER(5,2) NOT NULL;
ALTER TABLE PUBLICACIONES ADD CONSTRAINT CHK3_PUBLICACIONES CHECK (precio > 0);




















