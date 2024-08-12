
/* MIN y MAX */

-- Ejercicio 1: Encontrar la duración mínima de las pistas en milisegundos.

SELECT MIN ("Milliseconds") AS Duracion_minima
FROM "Track" t;

-- Ejercicio 2: Encontrar la duración máxima de las pistas en milisegundos.

SELECT MAX ("Milliseconds") AS Duracion_Maxima
From "Track" t;


-- Ejercicio 3: Encontrar el precio mínimo de las pistas.

SELECT MIN("UnitPrice") AS Preciomin_pistas
FROM "Track" t;
   
-- Ejercicio 4: Encontrar el precio máximo de las pistas.

SELECT MAX("UnitPrice") AS Preciomax_pistas
FROM "Track" t;

-- Ejercicio 5: Encontrar la fecha mínima de la factura.

SELECT MIN("InvoiceDate") AS FECHAMIN_FACTURA
FROM "Invoice" i;

-- Ejercicio 6: Encontrar la fecha máxima de la factura.

SELECT MAX("InvoiceDate") AS FECHAMAX_FACTURA
FROM "Invoice" i;

/* COUNT y SUM */

-- Ejercicio 7: Contar el número total de pistas.

SELECT COUNT("TrackId")
FROM "Track" t; 
   
-- Ejercicio 8: Contar el número de clientes en Brasil.


SELECT COUNT("Country") AS CLIENTES_BRAZIL
FROM "Customer" c
WHERE "Country" ='Brazil';

-- Ejercicio 9: Sumar la duración total de todas las pistas en milisegundos.

SELECT SUM("Milliseconds") AS TOTALMIL_TODASPISTAS 
FROM "Track" t;
   
-- Ejercicio 10: Contar el número de empleados con el título 'Sales Support Agent'.

SELECT COUNT("Title") AS NUMERO_SALESSA
FROM "Employee" e 
WHERE "Title" ='Sales Support Agent';

-- Ejercicio 11: Sumar el total de las cantidades en las facturas.

SELECT SUM("Total") AS SUMATOTAL_FACTURAS
FROM "Invoice" i ;

/* AVG, STDDEV, VARIANCE */

-- Ejercicio 12: Calcular la duración media de las pistas en milisegundos.

SELECT AVG("Milliseconds") AS DuracionMedia_milisegundos
FROM "Track" t;
    
-- Ejercicio 13: Calcular el precio medio de las pistas.

SELECT AVG("UnitPrice") AS Precio_Medio
FROM "Track" t;
    
-- Ejercicio 14: Calcular la desviación estándar de la duración de las pistas.

SELECT STDDEV("Milliseconds") AS Desviacion_milisegundos
FROM "Track" t;   

-- Ejercicio 15: Calcular la varianza de la duración de las pistas.

SELECT VARIANCE("Milliseconds") AS VARIANZA_PISTAS
FROM "Track" t 

-- Ejercicio 16: Calcular la desviación estándar del precio de las pistas.

SELECT STDDEV("UnitPrice") AS Desviacion_precio
FROM "Track" t;

/* CONCAT */

-- Ejercicio 17: Concatenar el nombre y el apellido de los clientes.

SELECT CONCAT("FirstName",' ', "LastName") AS NOMBRE_COMPLETO
FROM "Customer" c;
