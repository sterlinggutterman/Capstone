use sakila;

ALTER TABLE sakila.payment
ADD COLUMN payment_date_key int NOT NULL AFTER payment_date;

UPDATE sakila.payment AS p
JOIN sakila_dw2.dim_date AS dd
ON DATE(p.payment_date) = dd.full_date
SET p.payment_date_key = dd.date_key;

SELECT payment_date,
payment_date_key
FROM sakila.payment;

ALTER TABLE sakila.payment
DROP COLUMN payment_date;

ALTER TABLE sakila.rental
ADD COLUMN rental_date_key int NOT NULL AFTER rental_date;

UPDATE sakila.rental AS r
JOIN sakila_dw2.dim_date AS dd
ON DATE(r.rental_date) = dd.full_date
SET r.rental_date_key = dd.date_key;

SELECT rental_date_key FROM sakila.rental;

ALTER TABLE sakila.rental
DROP COLUMN rental_date;

ALTER TABLE sakila.rental
ADD COLUMN return_date_key int NOT NULL AFTER return_date;

UPDATE sakila.rental AS r
JOIN sakila_dw2.dim_date AS dd
ON DATE(r.return_date) = dd.full_date
SET r.return_date_key = dd.date_key;

SELECT return_date FROM sakila.rental;
SELECT return_date_key FROM sakila.rental;

ALTER TABLE sakila.rental
DROP COLUMN return_date;



