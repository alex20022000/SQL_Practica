USE BikeStores;

SELECT product_id, product_name, model_year, list_price
FROM production.products
WHERE model_year = 2017;