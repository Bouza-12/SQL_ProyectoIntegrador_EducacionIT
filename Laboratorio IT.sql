-- Antes de crear una base de datos, elimino la base de datos si existe una de igual nombre
DROP DATABASE IF EXISTS LABORATORIO;

-- creamos la base de datos que vamos a usar
CREATE DATABASE LABORATORIO;

-- Al iniciar el programos damos la instruccion que vamos a trabajar con la base de datos, esto se debe hacer cada vez que se abre el programa
USE LABORATORIO;

-- creamos una tabla dentro de la BDD. Usamos las palabras reservadas para ello y le damos un nombre a la tabla y debemos especificar los campos
-- o "columnas" con el tipo de dato que va a tener nuestra tabla
CREATE TABLE facturas(  Letra CHAR,
						Numero INT,
                        ClienteID INT,
                        ArticuloID INT,
                        Fecha date,
                        Monto double,
                        PRIMARY KEY(Letra, Numero)
);

-- otra forma de crear una tabla
CREATE TABLE articulos(articuloID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, nombre VARCHAR(50), precio DOUBLE, stock INT UNSIGNED);

-- otra forma de crear una tabla
CREATE TABLE clientes(clienteID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
					  nombre VARCHAR (50),
                      apellido VARCHAR (25),
                      CUIT CHAR(16),
                      direccion varchar(50),
                      comentarios varchar(50)
                      );

-- muestra las bases de datos disponibles
#SHOW DATABASES;

-- mustra las bases de disponibles
SHOW TABLES;

-- cambiamos los campos de las tablas, se pueden cambiar nombres, tipo de dato y modificadores
alter table facturas 
CHANGE clienteID IDCliente INT,
CHANGE articuloID IDArticulo INT,
MODIFY monto DOUBLE UNSIGNED;

-- mostramos la tabla
DESC facturas;

ALTER TABLE articulos
CHANGE articuloID IDArticulo INT UNSIGNED AUTO_INCREMENT,
MODIFY nombre VARCHAR(50),
MODIFY precio DOUBLE UNSIGNED NOT NULL;
DESC articulos;

DESC clientes;

ALTER TABLE clientes 
CHANGE clienteID IDCliete INT UNSIGNED AUTO_INCREMENT;

ALTER TABLE clientes
MODIFY nombre VARCHAR(30) NOT NULL,
MODIFY apellido VARCHAR(35) NOT NULL,
CHANGE comentarios observaciones VARCHAR(255);

-- INGRESO REGISTROS A LAS TABLAS
INSERT INTO facturas
VALUES ('A',28,14,335,'2021-03-18',1589.50);

INSERT INTO facturas
VALUES ('A',39,26,157,'2021-04-12',989.75);

select * from facturas;

INSERT INTO facturas
VALUES ('B',8,17,95,'2021-04-25',513.35),
('B',12,5,411,'2021-05-03',2385.70),
('B',19,50,157,'2021-05-26',979.75);

INSERT INTO articulos
VALUES  (95,'Webcam con Micrófono Pilug & Play',513.35,39),
		(157,'Apple AirPods Pro',979.75,152),
        (335,'Lavasecarropas Automático Samsung',1589.5,12),
        (411,'Gloria Trevi / Gloria / CD + DVD',2385.70,2);

select * from articulos;

INSERT INTO clientes
VALUES  (5,'Santiago','González','23-24582359-9','Uriburu 558 - 7°A,','VIP'),
		(14,'Gloria','Fernandez','23-35965852-5','Constitución 323','GBA'),
        (17,'Gonzalo','Lopez','23-33587416-0','Arias 2624','GBA'),
        (26,'Carlos','García','23-42321230-9','Pasteur 322 - 2°C','VIP'),
        (50,'Micaela','Altieri','23-22885566-5','Santamarina 1255','GBA');
        
-- mostramos los registros dentro de la tabla que seleccionemos
select * from clientes;















