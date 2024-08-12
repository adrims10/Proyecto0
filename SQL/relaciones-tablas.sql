
-- Ejercicio  1: Encuentra el nombre de las pistas y los títulos de los álbumes a los que pertenecen.

SELECT t."Name" AS NOMBRE_PISTA, a."Title" AS ALBUM_PERTENECIENTE
FROM "Track" t 
INNER JOIN "Album" a 
ON t."AlbumId" = a."AlbumId"; 

-- Ejercicio 2: Lista los nombres de los artistas y los títulos de sus álbumes. Ordena los resultados por artista.

SELECT a2."Name" as Nombre_artista, a."Title" AS Titulo_album
FROM "Artist" a2 
INNER JOIN "Album" a 
ON a2."ArtistId" = a."ArtistId"
ORDER BY Nombre_artista;	

-- Ejercicio 3: Encuentra los nombres de los clientes y los totales de sus facturas. Extrae solo los 5 clientes con mayor total. 
 
SELECT CONCAT(c."FirstName",' ',c."LastName") AS NOMBRE_CLIENTE, MAX(i."Total") AS TOTAL_FACTURAS
FROM "Invoice" i 
LEFT JOIN "Customer" c 
ON i."CustomerId" = c."CustomerId"
GROUP BY CONCAT(c."FirstName",' ',c."LastName")
ORDER BY MAX(i."Total") DESC
LIMIT 5;

-- Ejercicio 4: Lista los nombres de los empleados y los nombres de los clientes que les han sido asignados.

SELECT CONCAT(e."FirstName",' ', e."LastName") AS NOMBRE_EMPLEADO, CONCAT(c."FirstName",' ',c."LastName") AS NOMBRE_CLIENTES
FROM "Employee" e 
INNER JOIN "Customer" c 
ON e."EmployeeId" = c."SupportRepId"
ORDER BY NOMBRE_EMPLEADO;

-- Ejercicio 5: Muestra los ID de las facturas y los nombres de las pistas incluidas en esas facturas.

SELECT il."InvoiceId" , t."Name" 
FROM "InvoiceLine" il 
INNER JOIN "Track" t 
ON il."TrackId" = t."TrackId";

-- Ejercicio 6: Encuentra los nombres de los artistas y los géneros de sus pistas.

SELECT a."Name" AS NOMBRE_ARTISTA ,g."Name" AS NOMBRE_GENERO 
FROM "Artist" a 
INNER JOIN "Album" a2 
ON a."ArtistId" = a2."ArtistId" 
INNER JOIN "Track" t
ON a2."AlbumId" = t."AlbumId" 
INNER JOIN "Genre" g 
ON t."GenreId" = g."GenreId";


--  Ejercicio 7: Muestra los nombres de las pistas y el tipo de medio en el que están disponibles.

SELECT T."Name" AS NOMBRE_PISTAS , mt."Name" AS TIPO_MEDIO
FROM "Track" t 
INNER JOIN "MediaType" mt 
ON t."MediaTypeId" = mt."MediaTypeId";

-- Ejercicio 8: Encuentra todas las pistas y, si existen, muestra los nombres de los géneros a los que pertenecen. Incluye también las pistas que no tienen un género asignado.**

SELECT t."Name" AS Name_pistas , g."Name" AS Name_genero
FROM "Track" t 
LEFT JOIN "Genre" g 
ON t."GenreId" = g."GenreId";

-- Ejercicio 9: Muestra todos los clientes y, si existen, muestra las facturas que han realizado. Incluye también los clientes que no tienen ninguna factura.

SELECT CONCAT(c."FirstName",' ' ,c."LastName" ), COUNT(i."InvoiceId") AS FACTURAS_TOTALESCLIENTES
FROM "Customer" c 
LEFT JOIN "Invoice" i 
ON c."CustomerId" = i."CustomerId"
GROUP BY CONCAT(c."FirstName",' ',c."LastName" );


-- Ejercico 10: Encuentra todos los álbumes y, si existen, muestra los nombres de los artistas que los crearon. Incluye también los álbumes que no tienen un artista asignado (aunque en este caso en la base de datos de Chinook, todos los álbumes tienen un artista asignado).

SELECT a."Title" AS TITULO_ALBUM , a2."Name" AS NOMBRE_ARTISTA
FROM "Album" a 
LEFT JOIN "Artist" a2 
ON a."ArtistId" = a2."ArtistId";

-- Ejercicio 11: Cuenta cuántas pistas hay en cada género. Ordena los generos en función del número de canciones de mayor a menor. 

SELECT g."GenreId" AS GENERO , g."Name" AS NOMBRE_DELGENERO, COUNT(t."TrackId") AS NUMERO_PISTAS
FROM "Track" t 
INNER JOIN "Genre" g 
ON t."GenreId" = g."GenreId"
GROUP BY g."GenreId"
ORDER BY NUMERO_PISTAS DESC;

--  Ejercicio 12: Muestra los títulos de los álbumes y la duración total de todas las pistas en cada álbum.

SELECT a."Title" AS TITULO_ALBUM , SUM(t."Milliseconds") AS DURACIONTOTAL_PISTAS
FROM "Album" a 
INNER JOIN "Track" t 
ON a."AlbumId" = t."AlbumId"
GROUP BY a."Title";

-- Ejercicio 14: Encuentra los nombres de los clientes y el total gastado por cada uno.

SELECT CONCAT(c."FirstName",' ', c."LastName") AS NOMBRE_CLIENTE , SUM(i."Total") AS TOTAL_FACTURA
FROM "Customer" c 
INNER JOIN "Invoice" i 
ON c."CustomerId" = i."CustomerId"
GROUP BY CONCAT(c."FirstName",' ', c."LastName");


-- Ejercicio 15: Encuentra todos los empleados y, si existen, muestra los nombres de los clientes que tienen asignados. Incluye también los empleados que no tienen clientes asignados.

SELECT
CONCAT(c."FirstName",' ', c."LastName") AS NOMBRE_CLIENTE ,
CONCAT(e."FirstName",' ', e."LastName") AS NOMBRE_EMPLEADO, 
e."EmployeeId" 
FROM "Employee" e 
LEFT JOIN  "Customer" c 
ON e."EmployeeId" = c."SupportRepId"
ORDER BY NOMBRE_CLIENTE;
