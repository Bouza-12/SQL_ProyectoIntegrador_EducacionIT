-- Veo la tabla
DESC clientes_neptuno;
-- modifico los campos de la tabla
ALTER TABLE clientes_neptuno
MODIFY IDCliente VARCHAR(5) PRIMARY KEY,
MODIFY NombreCompania VARCHAR(100) NOT NULL,
MODIFY Pais VARCHAR(15) NOT NULL;

-- cambio el nombre de la tabla 'clientes' a 'contactos'
RENAME TABLE clientes TO contactos;

-- muestro la tabla con el nuevo nombre
DESC clientes;

-- agregp ,modificadores a los campos
ALTER TABLE clientes
MODIFY COD_CLIENTE VARCHAR (7) PRIMARY KEY,
MODIFY EMPRESA VARCHAR (100) NOT NULL,
MODIFY CIUDAD VARCHAR(25) NOT NULL,
MODIFY TELEFONO INT UNSIGNED,
MODIFY RESPONSABLE VARCHAR(30);

-- veo la tabla de 'pedidos' y al cargarla desde un archivo se debe agregar todos los tipos y modificadores de los campos
DESC pedidos;
ALTER TABLE pedidos
MODIFY NUMERO_PEDIDO INT PRIMARY KEY,
MODIFY CODIGO_CLIENTE VARCHAR(7) NOT NULL,
MODIFY FECHA_PEDIDO DATE NOT NULL,
MODIFY FORMA_PAGO ENUM ('APLAZADO','CONTADO','TARJETA'),
MODIFY ENVIADO ENUM ('SI','NO');

DESC productos;
ALTER TABLE productos
MODIFY COD_PRODUCTO INT UNSIGNED PRIMARY KEY,
MODIFY SECCION VARCHAR(20) NOT NULL,
MODIFY NOMBRE VARCHAR(40) NOT NULL,
MODIFY IMPORTADO ENUM('VERDADERO','FALSO'),
MODIFY ORIGEN VARCHAR(25) NOT NULL,
MODIFY DIA INT UNSIGNED NOT NULL,
MODIFY MES INT UNSIGNED NOT NULL,
MODIFY ANO INT UNSIGNED NOT NULL;

-- etapa 2.3
-- muestro TODOS los registros de la tabla
SELECT * FROM clientes_neptuno;

-- muestro los campos de la tabla
DESC clientes_neptuno;

-- muestro determinados campos de la la tabla
SELECT NombreCompania, CIUDAD, Pais FROM clientes_neptuno;

-- muestro determinados campos de la la tabla y los ordeno por uno de ellos
SELECT NombreCompania, CIUDAD, Pais FROM clientes_neptuno
ORDER BY PAIS;
-- muestro determinados campos de la la tabla y los ordeno por 2 de ellos
SELECT NombreCompania, CIUDAD, Pais FROM clientes_neptuno
ORDER BY PAIS, CIUDAD;

-- muestro determinados campos de la la tabla los ordeno por 2 de ellos y solo muestro los primeros 10 registros
SELECT NombreCompania, CIUDAD, Pais FROM clientes_neptuno
ORDER BY PAIS, CIUDAD LIMIT 10;
-- muestro determinados campos de la la tabla los ordeno por 2 de ellos y solo muestro 5 registros salteando los primeros 10
SELECT NombreCompania, CIUDAD, Pais FROM clientes_neptuno
ORDER BY PAIS, CIUDAD LIMIT 5 OFFSET 10;

-- Etapa 2-4
-- filtro los resultados a mostrar por determinados registros de un campo
SELECT * FROM nacimientos  WHERE NACIONALIDAD = 'EXTRANJERA';

-- filtro los resultados a mostrar por determinados registros de un campo y los ordeno por otro
SELECT * FROM nacimientos where EDAD_MADRE<18
ORDER BY EDAD_MADRE;

-- filtro los resultados a mostrar por determinados registros de campos con datos iguales a otro 
SELECT * FROM nacimientos where EDAD_MADRE = EDAD_PADRE;

-- filtro los resultados a mostrar por determinados registros de  2 campos con datos con condiciones
SELECT * FROM nacimientos where (EDAD_MADRE+40) < EDAD_PADRE;

-- filtro los resultados a mostrar por determinados registros de un campo
SELECT * FROM clientes_neptuno 
WHERE PAIS = 'ARGENTINA';

-- filtro los resultados a mostrar por negacion de determinados registros de un campo
SELECT * FROM clientes_neptuno 
WHERE PAIS <> 'ARGENTINA' ORDER BY PAIS;

-- filtro los resultados a mostrar por una condicion dentro de un campo y ordenado de forma descendiente
SELECT * FROM nacimientos
WHERE SEMANAS <20 ORDER BY SEMANAS DESC;

-- filtro los resultados a mostrar por 3 campos, 2 especificos y otro por condicion
SELECT * FROM nacimientos
WHERE NACIONALIDAD ='EXTRANJERA' AND SEXO ='FEMENINO' AND EDAD_MADRE>40;

-- filtro los resultados a mostrar por un campo y varias condiciones en sus registros
SELECT * FROM clientes_neptuno 
WHERE PAIS ='ARGENTINA' OR PAIS ='CHILE'OR PAIS ='URUGUAY' OR PAIS ='BOLIVIA' OR PAIS ='BRASIL' OR PAIS ='CLOLMBIA' OR PAIS ='ECUADOR'
OR PAIS ='PERU' OR PAIS ='VENEZUELA' ORDER BY PAIS;

-- filtro los resultados a mostrar por un campo con condición between
SELECT * FROM nacimientos
WHERE SEMANAS  BETWEEN 20 AND 25 ORDER BY SEMANAS;

-- filtro los resultados a mostrar por campo que sus registros contengan esos parametros
SELECT * FROM nacimientos
WHERE COMUNA IN (1101,3201,5605,8108,9204,13120,15202) ORDER BY COMUNA;

-- filtro los resultados a mostrar por los registros del campo que empiecen con la letra 'C'
SELECT * FROM clientes_neptuno
WHERE NombreCompANIA  LIKE ('C%');

-- filtro los resultados a mostrar por los registros del campo que empiecen con la letra 'B' y tengan un largo de 5 letras
SELECT * FROM clientes_neptuno 
WHERE CIUDAD LIKE ('B____');

-- filtro los resultados a mostrar por una condicion dentro de un campo
SELECT * FROM nacimientos
WHERE HIJOS_TOTAL > 10;










