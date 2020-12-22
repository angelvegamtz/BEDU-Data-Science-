-- Reto 1: Agrupamientos y subconsultas
-- Usando la base de datos tienda, escribe consultas que permitan responder las siguientes preguntas.

-- ¿Cuál es el nombre de los empleados que realizaron cada venta?
 
 USE tienda;
 
 SELECT clave, nombre, apellido_paterno, apellido_materno
 FROM empleado AS e
 JOIN venta v
 ON e.id_empleado = v.id_empleado
 ORDER BY clave;

-- ¿Cuál es el nombre de los artículos que se han vendido?
  
  SELECT clave, nombre
  FROM venta AS v
  JOIN articulo AS a
  ON v.id_articulo = a.id_articulo
  ORDER BY clave;

-- ¿Cuál es el total de cada venta?
 
 SELECT v.clave, round(sum(a.precio),2) AS total
 FROM venta AS v
 JOIN articulo AS a
   ON v.id_articulo = a.id_articulo
 GROUP BY clave
 ORDER BY clave;

-- Reto 2: Definición de vistas
-- Usando la base de datos tienda, define las siguientes 
-- vistas que permitan obtener la siguiente información.

-- AÑADE A TODOS LOS NOMBRES DE TUS VISTAS EL SUFIJO 
-- _<tu identificador>. Por ejemplo mi_vista_hermosa_123.

-- Obtener el puesto de un empleado.
 
 CREATE VIEW nombre_puesto_120 AS
 (SELECT concat(e.nombre,' ', e.apellido_paterno,' ',e.apellido_materno) AS nombre_completo, p.nombre
 FROM empleado AS e
 JOIN puesto AS p
   ON e.id_puesto = p.id_puesto);

 SELECT *
 FROM nombre_puesto_120; 
 
 -- Saber qué artículos ha vendido cada empleado.
 
 CREATE VIEW articulos_vendidos_empleados_120 AS
 (SELECT concat(e.nombre,' ', e.apellido_paterno) AS nombre_empleado, a.nombre AS nombre_articulo, v.clave
 FROM venta AS v
 JOIN empleado AS e
   ON v.id_empleado = e.id_empleado
 JOIN articulo AS a
   ON v.id_articulo = a.id_articulo
 ORDER BY v.clave);
 
 SELECT *
 FROM articulos_vendidos_empleados_120;
 
-- Saber qué puesto ha tenido más ventas.

 CREATE VIEW puesto_mas_ventas_120 AS
 (SELECT p.nombre, count(v.clave) AS mas_ventas
 FROM venta AS v
 JOIN empleado AS e
   ON v.id_empleado = e.id_empleado
 JOIN puesto AS p
   ON e.id_puesto = p.id_puesto
 GROUP BY p.nombre
 ORDER BY mas_ventas DESC
 LIMIT 1);

 SELECT * 
 FROM  puesto_mas_ventas_120;
 
 
