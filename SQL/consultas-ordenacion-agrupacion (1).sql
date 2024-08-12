-- Ejercicio 1:  Selecciona el nombre de todos los álbumes y ordénalos alfabéticamente.

SELECT "Title" 
FROM "Album" a 
ORDER BY "Title";

-- Ejercicio 2:  Encuentra el álbum con el mayor número de canciones.

SELECT "AlbumId", COUNT("AlbumId") AS NUMEROTOTAL_CANCIONES
FROM "Track" t
GROUP BY "AlbumId"
ORDER BY NUMEROTOTAL_CANCIONES DESC;

-- Ejercicio 3:  Calcula la duración promedio, desviación estándar y varianza por compositor.

SELECT "Composer" , AVG("Milliseconds") AS PROMEDIO, VARIANCE("Milliseconds") , STDDEV("Milliseconds") AS DES_STAND
FROM "Track" t 
GROUP BY "Composer";

-- Ejercicio 4: Selecciona el título y el precio de las pistas, y limita los resultados a 10.

SELECT "Name", "UnitPrice" 
FROM "Track" t
LIMIT 10;
   
-- Ejercicio 5: Lista los nombres de los empleados y ordénalos por el ID del empleado en orden descendente.

SELECT "FirstName" ,"LastName" ,"EmployeeId" 
FROM "Employee" e
ORDER BY "EmployeeId" DESC;

-- Ejercicio 6:  Muestra el número de géneros distintos disponibles en la base de datos.

SELECT COUNT("Name") AS NUMERO_GENEROSDIST
FROM "Genre" g;

-- Ejercicio 7: Selecciona el nombre del cliente y el país, limitando los resultados a 5, y ordena por el nombre del cliente.

SELECT "FirstName" ,"LastName" ,"Country" 
FROM "Customer" c
ORDER BY "FirstName" 
LIMIT 5;

-- Ejercicio 8: Muestra la cantidad total de clientes agrupados por país.

SELECT "Country", COUNT("CustomerId") AS Numero_totaldeclientes
FROM "Customer" c 
GROUP BY "Country";

-- Ejercicio 9: Obtén el total de importes de facturas para cada país y muestra solo aquellos con un total superior a 10,000.

SELECT  "BillingCountry" , SUM("Total") AS Total_agrupado
FROM "Invoice" i 
GROUP BY "BillingCountry" 
HAVING COUNT("Total") >10.000;

-- Ejercicio 10: Encuentra los países donde el número total de clientes es mayor a 5. Muestra el país y el número de clientes.

SELECT "Country" , COUNT("CustomerId") AS TOTAL_CLIENTES
FROM "Customer" c 
GROUP BY "Country" 
HAVING COUNT("CustomerId") >5;

-- Ejercicio 11: Obtén la cantidad de pistas en cada tipo de medio (MediaType) que tienen una duración mayor a 250,000 milisegundos.

SELECT COUNT("TrackId") AS TOTAL_PISTAS,("MediaTypeId") AS TIPO_MEDIO
FROM "Track" t 
WHERE "Milliseconds" > 250000
GROUP BY "MediaTypeId"
ORDER BY TIPO_MEDIO;

-- Ejercicio 12: Lista el país y el número total de clientes que han sido asistidos por un representante de ventas específico, cuyo ID sea menor a 5.

SELECT "Country", COUNT("CustomerId") AS Totalclientes_asistidos
FROM "Customer" c
WHERE "SupportRepId" <5
GROUP BY "Country";


-- Ejercicio 13: Muestra los códigos postales (BillingPostalCode) de los clientes que han hecho más de 5 compras.

SELECT "BillingPostalCode",COUNT("CustomerId") AS Total_clientesCP
FROM "Invoice" i
GROUP BY "BillingPostalCode"
HAVING SUM("InvoiceId")>5;

-- Ejercicio 14: Encuentra la cantidad total de pistas en cada tipo de medio (MediaTypeId) donde el precio de la pista (UnitPrice) es mayor a 0.99 y la duración de la pista (Milliseconds) es mayor a 200,000. Muestra el tipo de medio y el número total de pistas.

SELECT COUNT("TrackId") ,"MediaTypeId"
FROM "Track" t 
WHERE "UnitPrice" >0.99 AND "Milliseconds" >200000
GROUP BY "MediaTypeId";


-- Ejercicio 15: Lista el país y el estado de los clientes que tienen el soporte asignado a un representante con ID mayor a 3 y cuyo nombre de empresa (Company) no es nulo. Muestra el país, el estado y el número de clientes.


SELECT "Country", "State","CustomerId" 
FROM "Customer" c
WHERE "SupportRepId" >3 AND "Company" <>'NULL';

