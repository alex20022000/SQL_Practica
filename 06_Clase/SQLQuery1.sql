-- OPERADORES 

USE BikeStores;

SELECT *
FROM production.products;

SELECT *
FROM production.products
WHERE model_year >= 2018 AND list_price < 1000 AND category_id = 6;

SELECT *
FROM production.products
WHERE model_year >= 2020 OR list_price < 1000 OR category_id = 6;

-- PATRON
SELECT *
FROM production.products
WHERE product_name LIKE  '%R%';

-- IN - Listas
SELECT *
FROM production.products
WHERE category_id IN (1, 4, 6);

SELECT *
FROM production.products
WHERE list_price BETWEEN 500 AND 600;

-- AS
SELECT product_id id, product_name nombre, model_year modelo
FROM production.products;

--ORDER BY
SELECT *
FROM production.products
WHERE list_price BETWEEN 500 AND 600
ORDER BY product_name;

--TOP
SELECT TOP(10) product_id id, product_name nombre, model_year modelo
FROM production.products
ORDER BY model_year DESC;




-- FUNCIONES

SELECT AVG(list_price) promedio
FROM production.products;

SELECT SUM(list_price) sumaTotal
FROM production.products;

SELECT COUNT(product_id) cantidad, category_id
FROM production.products
GROUP BY category_id;

SELECT COUNT(product_id) cantidad, category_id
FROM production.products
GROUP BY category_id
HAVING COUNT(product_id) IN (10,78,60) ;
