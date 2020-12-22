 CREATE DATABASE MarcoHurtado;
  
 USE MarcoHurtado;
 
 CREATE TABLE users (
  id INT PRIMARY KEY,
  genero VARCHAR(1),
  edad INT,
  ocup INT,
  cp VARCHAR(20)
 );
 
 SELECT *
 FROM users;
  
 -- Crear la tabla movies (recuerda usar el mismo nombre del archivo sin 
 -- la extensión para vincular nombres de tablas con archivos).
 
  CREATE TABLE movies (
   id_movie INT PRIMARY KEY,
   title VARCHAR(100),
   geners VARCHAR(100)
  );
  
  -- Usando como base el archivo movies.dat, limpiarlo e importar los 
  -- datos en la tabla movies creada en el Reto 1.

  SELECT *
  FROM movies;
  
-- Crear la tabla ratings (recuerda usar el mismo nombre 
-- del archivo sin la extensión para vincular nombres de tablas con archivos)
 
 CREATE TABLE rating (
  id_users INT,
  id_movie INT,
  ratings INT,
  time_stamp BIGINT,
  FOREIGN KEY (id_users) REFERENCES users(id),
  FOREIGN KEY (id_movie) REFERENCES movies(id_movie)
 );
 
 -- Usando como base el archivo ratings.dat, 
 -- limpiarlo e importar los datos en la tabla ratings creada en el Reto 2.
 SELECT * 
 FROM rating;
 