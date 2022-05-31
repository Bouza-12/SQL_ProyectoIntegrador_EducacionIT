USE laboratorio;

--  ETAPA 3.1
# Creo el backup de la base de datos de Laboratorio

#Elimino la base de datos
DROP DATABaSE laboratorio;

-- uso la base de datos de backup
USE LABORATORIO_BD;

-- veo las nuevas tablas en la base de datos de backup
SHOW TABLES;


--  ETAPA 3.2 -- FUNCIONES DE TEXTO
SELECT * FROM clientes_neptuno;

-- selecciono los campos a mostrar y creo uno nuevo concatenando otros 3 y separando con guion
SELECT IDCliente, NombreCompania,
CONCAT (Direccion, ' - ',Ciudad,' - ',Pais) Ubicacion
FROM clientes_neptuno;

-- selecciono los campos a mostrar y creo uno nuevo concatenando con otra funcion otros 3 y separando con guion
SELECT IDCliente, NombreCompania,
CONCAT_WS ( ' - ',Direccion,Ciudad,Pais) Ubicacion
FROM clientes_neptuno;

-- muestro los registros de 'EMPRESA' en mayúsculas
SELECT IDCliente,
UPPER (NombreCompania) EMPRESA,
CONCAT_WS ( ' - ',Direccion,Ciudad,Pais) UBICACION
FROM clientes_neptuno;

-- muestro IDCliente en minúsculas
SELECT LOWER(IDCliente) CODIGO, 
UPPER (NombreCompania) EMPRESA,
CONCAT_WS ( ' - ',Direccion,Ciudad,Pais) UBICACION
FROM clientes_neptuno;

-- ETAPA 3.3 -- FUNCIONES DE FECHA

-- muestro los registros de una fecha específica
SELECT * FROM pedidos_neptuno
WHERE YEAR(FechaPedido) = '1998';

-- muestro los registros de una año en particular y 2 meses distintos
SELECT * FROM pedidos_neptuno
WHERE YEAR(FechaPedido) ='1997' AND MONTH(FechaPedido)= '7' OR MONTH(FechaPedido)='8';
-- muestro los registros que tengan en común un día particular 
SELECT * FROM pedidos_neptuno
WHERE DAY(fechapedido) ='1';

-- cuento cuantos días transcurrieron desde la fecha de un registro
SELECT *, DATEDIFF(CURDATE(),fechapedido) 'DIAS TRANSCURRIDOS'
FROM pedidos_neptuno;

-- muestro el nombre del día en las campo fecha
SELECT *, DAYNAME(FECHAPEDIDO) DIA,
DATEDIFF(CURDATE(),fechapedido) 'DIAS TRANSCURRIDOS'
FROM pedidos_neptuno;

-- muestro el numero de día del año que indica el registro
SELECT *, DAYNAME(FECHAPEDIDO) DIA,
DATEDIFF(CURDATE(),fechapedido) 'DIAS TRANSCURRIDOS',
DAYOFYEAR(FECHAPEDIDO) 'DIA DEL AÑO'
FROM pedidos_neptuno;

-- muestro con monthname el nombre del mes en letras
SELECT *, DAYNAME(FECHAPEDIDO) DIA,
DATEDIFF(CURDATE(),fechapedido) 'DIAS TRANSCURRIDOS',
DAYOFYEAR(FECHAPEDIDO) 'DIA DEL AÑO',
MONTHNAME(FECHAPEDIDO) 'MES DEL AÑO'
FROM pedidos_neptuno;
-- hago una suma de días de fechas para mostrar un vencimiento
SELECT *, DAYNAME(FECHAPEDIDO) DIA,
DATEDIFF(CURDATE(),fechapedido) 'DIAS TRANSCURRIDOS',
DAYOFYEAR(FECHAPEDIDO) 'DIA DEL AÑO',
MONTHNAME(FECHAPEDIDO) 'MES DEL AÑO',
ADDDATE(FECHAPEDIDO, INTERVAL 30 DAY) 'PRIMER VENCIMIENTO'
FROM pedidos_neptuno;

-- hago una suma de meses del campo fecha
SELECT *, DAYNAME(FECHAPEDIDO) DIA,
DATEDIFF(CURDATE(),fechapedido) 'DIAS TRANSCURRIDOS',
DAYOFYEAR(FECHAPEDIDO) 'DIA DEL AÑO',
MONTHNAME(FECHAPEDIDO) 'MES DEL AÑO',
ADDDATE(FECHAPEDIDO, INTERVAL 30 DAY) 'PRIMER VENCIMIENTO',
ADDDATE(FECHAPEDIDO, INTERVAL 2 MONTH) 'SEGUNDO VENCIMIENTO'
FROM pedidos_neptuno;

-- ETAPA 3.4 -- OPERACIONES MATEMATICAS

-- se realiza un redondeo de decimales, en este caso sólo 2
SELECT *, ROUND(CARGO *0.21 ,2) IVA
FROM pedidos_neptuno;

-- igual que arriba
SELECT *, ROUND(CARGO *0.21 ,2) IVA,
ROUND(CARGO *1.21 ,2) NETO
FROM pedidos_neptuno;

-- redondeo a un numero entero para abajo
SELECT *, ROUND(CARGO *0.21 ,2) IVA,
ROUND(CARGO *1.21 ,2) NETO,
FLOOR(ROUND(CARGO *1.21 ,2)) 'REDONDEO A FAVOR CLIENTE'
FROM pedidos_neptuno;

-- redondeo a un numero entero para arriba
SELECT *, ROUND(CARGO *0.21 ,2) IVA,
ROUND(CARGO *1.21 ,2) NETO,
FLOOR(ROUND(CARGO *1.21 ,2)) 'REDONDEO A FAVOR CLIENTE',
CEIL(ROUND(CARGO *1.21 ,2)) 'REDONDEO A FAVOR EMPRESA'
FROM pedidos_neptuno;

-- ETAPA 3.5 -- FUNCIONES DE AGRUPAMIENTO
-- cuento la cantidad de registros
SELECT COUNT(*) FROM pedidos_neptuno;

-- cuento los registros indicados por el filtro
SELECT COUNT(TRANSPORTISTA) AS 'ENTREGAS SPEEDY EXPRESS' 
FROM pedidos_neptuno
WHERE TRANSPORTISTA = 'SPEEDY EXPRESS' ;

-- cuento los registros que empuecen por una letra específica
SELECT COUNT(*) AS VENTAS
FROM pedidos_neptuno
WHERE LEFT(EMPLEADO, 1) ='C';

SELECT * FROM PRODUCTOS_NEPTUNO;

-- redondeo el promedio de un campo numerico
SELECT ROUND(AVG(PRECIOuNIDAD),2) AS 'PRECIO PROMEDIO'
FROM PRODUCTOS_NEPTUNO;

-- muestro el registro con el numero más bajo del campo numérico
SELECT ROUND(AVG(PRECIOuNIDAD),2) AS 'PRECIO PROMEDIO',
MIN(PRECIOuNIDAD) AS 'PRECIO INFERIOR'
FROM PRODUCTOS_NEPTUNO;

-- muestro el registro con el numero más alto del campo numérico
SELECT ROUND(AVG(PRECIOuNIDAD),2) AS 'PRECIO PROMEDIO',
MIN(PRECIOuNIDAD) AS 'PRECIO INFERIOR',
MAX(PRECIOUNIDAD) AS 'PRECIO MAXIMO'
FROM PRODUCTOS_NEPTUNO;

-- agrupo los resultados por las distintas variables del registro categoria
SELECT NOMBRECATEGORIA AS CATEGORIA,
MAX(PRECIOUNIDAD) AS 'PRECIO MAXIMO'
FROM PRODUCTOS_NEPTUNO
GROUP BY CATEGORIA;

-- lo mismo que arriba
SELECT TRANSPORTISTA,
COUNT(*) AS 'ENTREGAS' 
FROM pedidos_neptuno
GROUP BY TRANSPORTISTA;

-- lo mismo de arriba
SELECT SEXO,
COUNT(*) AS NACIMIENTOS
FROM NACIMIENTOS
GROUP BY SEXO;

SELECT * FROM PEDIDOS_NEPTUNO;

SELECT NOMBRECOMPANIA AS CLIENTE,
ROUND(SUM(CARGO),2) AS 'TOTAL GASTOS'
FROM PEDIDOS_NEPTUNO
GROUP BY CLIENTE;

SELECT * FROM PRODUCTOS;

-- cuento los registros de un campo agrupado por otro ordenado de manera descendente por otro campo
SELECT SECCION,
COUNT(*) AS CANTIDAD
FROM PRODUCTOS
GROUP BY SECCION
ORDER BY CANTIDAD DESC;

-- agrupo por año y por mes
SELECT YEAR(FECHAPEDIDO) ANIO,
MONTH(FECHAPEDIDO) MES,
COUNT(*) AS VENTAS
FROM PEDIDOS_NEPTUNO
GROUP BY ANIO, MES
ORDER BY ANIO, MONTH(FECHAPEDIDO);

--
SELECT ROUND(SUM(CARGO),2) AS 'TOTAL FACTURADO',
ROUND(AVG(CARGO),2) AS 'PROMEDIO DE FACTURACION'