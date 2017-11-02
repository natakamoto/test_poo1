/*-------- Creacion DATABASE ---------*/

CREATE DATABASE bd_empresa;

/*-------- Usando la BD ---------*/

USE bd_empresa;

/*-------- Creacion Tablas ---------*/

CREATE TABLE trabajador(
	id INT AUTO_INCREMENT,
    	nombre VARCHAR(50),
	edad INT,
	sexo VARCHAR(1),
	jefe TINYINT(1),
    	PRIMARY KEY(id)
);

CREATE TABLE departamento(
	id INT AUTO_INCREMENT,
    	nombre VARCHAR(50),
    	PRIMARY KEY(id)
);

CREATE TABLE profesion(
	id INT AUTO_INCREMENT,
	nombre VARCHAR(100),
	PRIMARY KEY(id)
);


CREATE TABLE empresa(
	id INT AUTO_INCREMENT,
	nombre Varchar(100),
	PRIMARY KEY(id)
);

CREATE TABLE trabdep(
	id INT AUTO_INCREMENT,
    id_trabajador INT,
    id_dpto INT,
	PRIMARY KEY(id),
	FOREIGN KEY(id_dpto)REFERENCES departamento(id),
	FOREIGN KEY(id_trabajador)REFERENCES trabajador(id)
);

CREATE TABLE proftrab(
	id INT AUTO_INCREMENT,
    id_trabajador INT,
    id_prof INT,
	PRIMARY KEY(id),
	FOREIGN KEY(id_prof)REFERENCES profesion(id),
	FOREIGN KEY(id_trabajador)REFERENCES trabajador(id)

);
	


/*-------- Inserts ---------*/

INSERT INTO trabajador VALUES(NULL,'Juan Maldonado','25','m');
INSERT INTO trabajador VALUES(NULL,'Manuel Sanchez', '32','m');
INSERT INTO trabajador VALUES(NULL,'Maria Jara', '22','f');
INSERT INTO trabajador VALUES(NULL,'Pedro Faune', '40','m');
INSERT INTO trabajador VALUES(NULL,'Elias Gonzales', '52', 'm');
INSERT INTO trabajador VALUES(NULL,'Josefina Aguilera', '33', 'f');
INSERT INTO trabajador VALUES(NULL,'Oswaldo Brito', '70', 'm');
INSERT INTO trabajador VALUES(NULL,'Alexandra Núñez', '30', 'f');
INSERT INTO trabajador VALUES(NULL,'Arnoldo Covarrubias', '49', 'm');



INSERT INTO departamento VALUES(NULL, 'Departamento de Recursos Humanos')
INSERT INTO departamento VALUES(NULL, 'Departamento de Finanzas')
INSERT INTO departamento VALUES(NULL, 'Departamento de Producción')
INSERT INTO departamento VALUES(NULL, 'Departamento de Ventas')


INSERT INTO profesion VALUES(NULL, 'Administración de Empresas')
INSERT INTO profesion VALUES(NULL, 'Ingeniería en Informática')
INSERT INTO profesion VALUES(NULL, 'Publicista')
INSERT INTO profesion VALUES(NULL, 'Ingeniería en Prevención de Riesgos')
INSERT INTO profesion VALUES(NULL, 'Secretaria')
INSERT INTO profesion VALUES(NULL, 'Consultor')


/*-------- Inicio Modificaciones ---------*/

/* 1) Renombar la tabla departamento a "Area". */

RENAME TABLE departamento TO area;

/* 2) El ID del departamento debe llamarse "Código_Departamento". (Investigar tema PK) */

ALTER TABLE departamento CHANGE id codigo_departamento INT AUTO_INCREMENT;

/* 3) El largo del nombre del departamento modificarlo a "200". */

ALTER TABLE departamento MODIFY nombre VARCHAR(200);

/* 4) Añada un campo llamado "Direccion" VARCHAR(200) a la tabla Trabajador. (Colocar direccion después del campo "Nombre".) */

ALTER TABLE trabajador ADD direccion VARCHAR(200) AFTER nombre;

/* 5) Renombar el nombre jefe de la tabla departamento (Area) a Jefesito VARCHAR(1000). */

ALTER TABLE departamento CHANGE jefe jefesito VARCHAR(1000);


/*-------- Inicio Consultas ---------*/

/* Listado de todos los trabajadores del departamento de ventas. */

SELECT departamento FROM nombre WHERE (id = 4);

/* Nombre y edad de las mujeres entre 30 y 40 años inclusive del departamento de recursos humanos. */

SELECT departamento from nombre WHERE sexo = 'f' AND edad BETWEEN 30 AND 40;

/* Listado de todas las tablas relacionadas. (Debe mostrar datos del trabajador, titulos y area) */