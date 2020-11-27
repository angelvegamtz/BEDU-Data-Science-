-- Reto 1: Agrupamientos y subconsultas

-- Usando la base de datos tienda, escribe consultas que permitan responder las siguientes preguntas.
 
 USE tienda;
 -- ¿Qué artículos incluyen la palabra Pasta en su nombre?
 DESCRIBE articulo;
 SELECT *
 FROM articulo
 WHERE nombre LIKE '%Pasta%';
 
 -- ¿Qué artículos incluyen la palabra Cannelloni en su nombre?
 SELECT *
 FROM articulo
 WHERE nombre LIKE '%Cannelloni%';
 
 -- ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
 SELECT *
 FROM articulo
 WHERE nombre LIKE '%-%';
 
 -- Reto 2: Funciones de agrupamiento
 -- Usando la base de datos tienda, escribe consultas que permitan responder las siguientes preguntas.

 -- ¿Cuál es el promedio de salario de los puestos?
 SELECT AVG(salario) AS promedio_salario
 FROM puesto;
 
 -- ¿Cuántos artículos incluyen la palabra Pasta en su nombre?
 SELECT COUNT(*) AS palabra_pasta
 FROM articulo
 WHERE nombre LIKE '%Pasta%';
 
 -- ¿Cuál es el salario mínimo y máximo?
  SELECT MIN(salario), MAX(salario)
  FROM puesto;
  
  -- ¿Cuál es la suma del salario de los últimos cinco puestos agregados?
 SELECT MAX(id_puesto) -5
 FROM puesto;
 
 SELECT SUM(salario)
 FROM puesto
 WHERE id_puesto > 995;
 
 -- Reto 3: Agrupamientos
 
 -- Usando la base de datos tienda, escribe consultas 
 -- que permitan responder las siguientes preguntas.
 
 -- ¿Cuántos registros hay por cada uno de los puestos?
 SELECT nombre, count(*) AS Registros
 FROM puesto
 GROUP BY nombre;
 
 -- ¿Cuánto dinero se paga en total por puesto?
 SELECT nombre,SUM(salario) AS total
 FROM puesto
 GROUP BY nombre;
 
 -- ¿Cuál es el número total de ventas por vendedor?
 SELECT id_empleado, count(*) AS ventas
 FROM venta
 GROUP BY id_empleado;
 
 -- ¿Cuál es el número total de ventas por artículo?
 SELECT id_articulo, count(*) AS ventas
 FROM venta
 GROUP BY id_articulo;
 
 -- Reto 4: Subconsultas
-- Usando la base de datos tienda, escribe consultas que permitan responder las siguientes preguntas.
 
 -- ¿Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000?
 SELECT nombre, apellido_paterno
 FROM empleado 
 WHERE id_puesto IN 
 (SELECT id_puesto 
  FROM puesto 
  WHERE salario > 10000);
  
  -- ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
  SELECT id_empleado,MIN(total_ventas),MAX(total_ventas)
  FROM
  (SELECT clave,id_empleado,COUNT(*) total_ventas 
   FROM venta 
   GROUP BY clave, id_empleado) AS sq
  GROUP BY id_empleado;
  
  -- ¿Cuál es el nombre del puesto de cada empleado?
  SELECT nombre, apellido_paterno,
   (SELECT nombre 
    FROM puesto 
    WHERE id_puesto = e.id_puesto)
    FROM empleado AS e;


 
 
 
 