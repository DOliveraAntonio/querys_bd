-- ############################################################################ PRODUCTSS METHOD
-- Cambiamos el valor de las reservas que en id_promo_code tengan 0 y lo cambiamos a null
UPDATE reservations_details_transportation
SET id_metodo_producto = NULL
where id_metodo_producto = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_transportation
WHERE id_metodo_producto NOT IN (
    SELECT id FROM product_method
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_transportation
WHERE id_metodo_producto NOT IN (
    SELECT id FROM product_method
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_transportation
ADD CONSTRAINT reservations_transportation__products_method_fk
FOREIGN KEY (id_metodo_producto)
REFERENCES product_method (id)
ON DELETE SET NULL ;

-- ############################################################################ PRODUCTS
-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_transportation
WHERE id_productos NOT IN (
    SELECT id FROM products
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_transportation
WHERE id_productos NOT IN (
    SELECT id FROM products
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_transportation
ADD CONSTRAINT reservations_transportation__products_fk
FOREIGN KEY (id_productos)
REFERENCES products (id)
ON DELETE SET NULL ;

-- ############################################################################ PROMO CODE AUTH
-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_transportation
WHERE id_promo_code_auth NOT IN (
    SELECT id FROM promo_code_auth
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_transportation
WHERE id_promo_code_auth NOT IN (
    SELECT id FROM promo_code_auth
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_transportation
ADD CONSTRAINT reservations_transportation__promo_code_auth_fk
FOREIGN KEY (id_promo_code_auth)
REFERENCES promo_code_auth (id)
ON DELETE SET NULL ;

-- ############################################################################ PROMO CODE
-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_transportation
WHERE id_promo_code NOT IN (
    SELECT id FROM promo_code
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_transportation
WHERE id_promo_code NOT IN (
    SELECT id FROM promo_code
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_transportation
ADD CONSTRAINT reservations_transportation__promo_code_fk
FOREIGN KEY (id_promo_code)
REFERENCES promo_code (id)
ON DELETE SET NULL ;

-- ############################################################################ PROVIDERS
-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_transportation
WHERE id_proveedor NOT IN (
    SELECT id FROM provider
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_transportation
WHERE id_proveedor NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_transportation
ADD CONSTRAINT reservations_transportation__providers_fk
FOREIGN KEY (id_proveedor)
REFERENCES provider (id)
ON DELETE SET NULL ;

-- ############################################################################ PERCENTAGE RATES
-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_transportation
WHERE id_transportation_rates_percent NOT IN (
    SELECT id FROM transportation_rates_percents
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_transportation
WHERE id_transportation_rates_percent NOT IN (
    SELECT id FROM transportation_rates_percents
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_transportation
ADD CONSTRAINT reservations_transportation__rates_percents_fk
FOREIGN KEY (id_transportation_rates_percent)
REFERENCES transportation_rates_percents (id)
ON DELETE CASCADE ;

-- ############################################################################ TRANSPORTATION RATES
-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_transportation
WHERE id_transportation_rates NOT IN (
    SELECT id FROM transportation_rates
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_transportation
WHERE id_transportation_rates NOT IN (
    SELECT id FROM transportation_rates
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_transportation
ADD CONSTRAINT reservations_transportation__rates_fk
FOREIGN KEY (id_transportation_rates)
REFERENCES transportation_rates (id)
ON DELETE CASCADE ;

-- ############################################################################ UNITS
-- LLEGADAS
-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_transportation
WHERE id_unidad_llegada NOT IN (
    SELECT id FROM transfer_units
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_transportation
WHERE id_unidad_llegada NOT IN (
    SELECT id FROM transfer_units
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_transportation
ADD CONSTRAINT reservations_transportation_llegada__promo_code_fk
FOREIGN KEY (id_unidad_llegada)
REFERENCES transfer_units (id)
ON DELETE SET NULL ;

-- SALIDAS
-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_transportation
WHERE id_unidad_salida NOT IN (
    SELECT id FROM transfer_units
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_transportation
WHERE id_unidad_salida NOT IN (
    SELECT id FROM transfer_units
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_transportation
ADD CONSTRAINT reservations_transportation_salida__promo_code_fk
FOREIGN KEY (id_unidad_salida)
REFERENCES transfer_units (id)
ON DELETE SET NULL ;

-- ############################################################################ USERS
-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_transportation
WHERE id_user_operated NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_transportation
WHERE id_user_operated NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_transportation
ADD CONSTRAINT reservations_transportation__users_fk
FOREIGN KEY (id_user_operated)
REFERENCES users (id)
ON DELETE SET NULL ;
