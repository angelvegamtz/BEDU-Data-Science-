-- Ejercicios Sesión 3.

-- Todos los ejercicios debes hacerlos usando la base classicmodels.

-- Todas las consultas que realices deberás mantenerlas dentro del editor 
-- de textos de MySQL Workbench. Al finalizar, guarda este archivo, llendo al menú File > Save script. 
-- Recuerda añadir a todos los nombres te dus vistas el sufijo con tu identificador.
 
 USE classicmodels;
 SHOW TABLES;

-- Para estas consultas usa RIGHT JOIN

-- 1.Obtén la cantidad de productos de cada orden.
 describe products;
 describe orders;
 describe orderdetails;
 describe customers;
 describe employees;
 describe payments;
 
 SELECT sum(quantityOrdered) AS cantidad, o.orderNumber
 FROM orderdetails AS od
 JOIN orders AS o
   ON od.orderNumber = o.orderNumber
 GROUP BY o.orderNumber
 ORDER BY cantidad DESC;

-- 2.Obten el número de orden, estado y costo total de cada orden.
 
 SELECT o.orderNumber, o.status, sum(od.priceEach) AS total
 FROM orderdetails AS od
 JOIN orders o
   ON od.orderNumber = o.orderNumber
 GROUP BY orderNumber
 ORDER BY total DESC;

-- 3. Obten el número de orden, fecha de orden, línea de orden, nombre del producto, 
-- cantidad ordenada y precio de cada pieza.

 SELECT o.orderNumber, o.orderDate, od.orderLineNumber, p.productName, od.quantityOrdered, od.priceEach
 FROM orders AS o
 JOIN orderdetails as od
   ON o.orderNumber = od.orderNumber
 JOIN products AS p
   ON od.productCode = p.productCode;
 

-- 4.Obtén el número de orden, nombre del producto, el precio sugerido de fábrica (msrp) y 
-- precio de cada pieza.
 
 SELECT o.orderNumber, p.productName, MSRP, priceEach
 FROM orders AS o
 JOIN orderdetails AS od
   ON o.orderNumber = od.orderNumber
 JOIN products AS p
   ON od.productCode = p.productCode;
   
-- Para estas consultas usa LEFT JOIN

-- 5.Obtén el número de cliente, nombre de cliente, número de orden y 
-- estado de cada orden hecha por cada cliente. ¿De qué nos sirve hacer LEFT JOIN en lugar de JOIN?


-- Traerá todos los registros de la tabla izquierda 
-- y únicamente aquellos registros que cumplan con la condición de relación de la otra tabla. 
-- Por ejemplo en 37 tenemos valores con NULL en virtud de que la tabla derecha no cumplió la condición
-- Y un JOIN traerá los registros de ambas tablas que cumplan con la condición.
 
 SELECT c.customerNumber, c.customerName, o.orderNumber, o.status
 FROM customers AS c
 LEFT JOIN orders AS o
        ON c.customerNumber = o.customerNumber;

-- 6. Obtén los clientes que no tienen una orden asociada.

 SELECT c.customerName, o.orderNumber
 FROM customers AS c
 LEFT JOIN orders AS o
 ON c.customerNumber = o.customerNumber
 WHERE o.orderNumber IS NULL;
 
-- 7. Obtén el apellido de empleado, nombre de empleado, nombre de cliente, número de cheque y total, 
-- es decir, los clientes asociados a cada empleado.

 SELECT e.lastName, e.firstName, c.customerName, p.checkNumber, p.amount,  c.salesRepEmployeeNumber 
 FROM employees AS e
 LEFT JOIN customers AS c
        ON  e.employeeNumber = c.salesRepEmployeeNumber
 LEFT JOIN payments AS p
        ON c.customerNumber = p.customerNumber;

-- Para estas consultas usa RIGHT JOIN
-- 8. Repite los ejercicios 5 a 7 usando RIGHT JOIN. 
-- ¿Representan lo mismo? Explica las diferencias en un comentario. 

-- Obtén el número de cliente, nombre de cliente, número de orden y 
-- estado de cada orden hecha por cada cliente. 

-- Traerá todos los registros de la tabla derecha en este caso orders
-- y únicamente aquellos registros que cumplan con la condición de relación de la otra tabla 
-- es decir customers. 
-- Usando RIGHT JOIN no nos trae ningún campo NULL por lo que es diferente a usar LEFT JOIN ya que
-- usando LEFT JOIN si nos trae registros con NULL.

 SELECT c.customerNumber, c.customerName, o.orderNumber, o.status
 FROM customers AS c
 RIGHT JOIN orders AS o
        ON c.customerNumber = o.customerNumber;

 -- Obtén los clientes que no tienen una orden asociada.

-- Traerá todos los registros de la tabla derecha en este caso orders
-- y únicamente aquellos registros que cumplan con la condición de relación de la otra tabla 
-- es decir customers. 
-- Usando RIGHT JOIN no nos trae ningún registro ya que no hay ningún registro con NULL 
-- a diferencia de LEFT JOIN que obtine los clientes que no tienen una orden asociada es decir
-- en los registros del campo orderNumber trae todos los registros con NULL.
 
 SELECT c.customerName, o.orderNumber
 FROM customers AS c
 RIGHT JOIN orders AS o
 ON c.customerNumber = o.customerNumber
 WHERE o.orderNumber IS NULL;

-- Obtén el apellido de empleado, nombre de empleado, nombre de cliente, número de cheque y total, 
-- es decir, los clientes asociados a cada empleado.

-- Primero vamos a relacionar las tablas employees y customers, seleccionando todos los registros 
-- de la tabla customers y únicamente aquellos registros que 
-- cumplan con la condición de relación de la tabla employees.
-- Usando RIGHT JOIN no obtenemos ningun registro con NULL en cambio 
-- usando LEFT JOIN si hay registros con NULL en algunos campos(NO todos los registros de estos campos)
-- que son customerName, checkNumber, amount y salesReÉmployeeNumber.
-- Por lo que podemos concluir que usar LEFT JOIN Y RIGHT JOIN nos es equivalentes.
 
 SELECT e.lastName, e.firstName, c.customerName, p.checkNumber, p.amount,  c.salesRepEmployeeNumber 
 FROM employees AS e
 RIGHT JOIN customers AS c
        ON  e.employeeNumber = c.salesRepEmployeeNumber
 RIGHT JOIN payments AS p
        ON c.customerNumber = p.customerNumber;

-- 9.Escoge 3 consultas de los ejercicios anteriores, crea una vista y escribe una consulta para cada una.
 
 #Vista 1: Ejercicio 1
 CREATE VIEW productos_cada_orden_120 AS
 (SELECT sum(quantityOrdered) AS cantidad, o.orderNumber
 FROM orderdetails AS od
 JOIN orders AS o
   ON od.orderNumber = o.orderNumber
 GROUP BY o.orderNumber
 ORDER BY cantidad DESC);
 
 SELECT *
 FROM productos_cada_orden_120;

 #Vista 2: Ejercicio 2
 CREATE VIEW consulta_dos_120 AS
 (SELECT c.customerName, o.orderNumber
 FROM customers AS c
 LEFT JOIN orders AS o
 ON c.customerNumber = o.customerNumber
 WHERE o.orderNumber IS NULL);
 
 SELECT *
 FROM consulta_dos_120;
 
 #Vista 3: Ejercicio 8.1
 
 CREATE VIEW consulta_ocho_120 AS 
 (SELECT c.customerNumber, c.customerName, o.orderNumber, o.status
 FROM customers AS c
 RIGHT JOIN orders AS o
        ON c.customerNumber = o.customerNumber);
 
 SELECT *
 FROM consulta_ocho_120;
 
 

 



 
 


 

 
 
