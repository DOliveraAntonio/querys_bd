-- ############################################################################ PACKAGES
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tickets
SET id_paquete = NULL
where id_paquete = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_tickets
WHERE id_paquete NOT IN (
    SELECT id FROM packages_info
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tickets
WHERE id_paquete NOT IN (
    SELECT id FROM packages_info
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tickets
ADD CONSTRAINT reservations_ticket__packages_fk
FOREIGN KEY (id_paquete)
REFERENCES packages_info (id)
ON DELETE SET NULL ;

-- ############################################################################ PRODUCTS METHOD
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tickets
SET id_metodo_producto = NULL
where id_metodo_producto = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_tickets
WHERE id_metodo_producto NOT IN (
    SELECT id FROM product_method
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tickets
WHERE id_metodo_producto NOT IN (
    SELECT id FROM product_method
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tickets
ADD CONSTRAINT reservations_ticket__products_method_fk
FOREIGN KEY (id_metodo_producto)
REFERENCES products (id)
ON DELETE SET NULL ;

-- ############################################################################ PRODUCTS
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tickets
SET id_productos = NULL
where id_productos = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_tickets
WHERE id_productos NOT IN (
    SELECT id FROM products
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tickets
WHERE id_productos NOT IN (
    SELECT id FROM products
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tickets
ADD CONSTRAINT reservations_ticket__products_fk
FOREIGN KEY (id_productos)
REFERENCES products (id)
ON DELETE SET NULL ;

-- ############################################################################ PROMO CODE AUTH
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tickets
SET id_promo_code_auth = NULL
where id_promo_code_auth = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_tickets
WHERE id_promo_code_auth NOT IN (
    SELECT id FROM promo_code_auth
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tickets
WHERE id_promo_code_auth NOT IN (
    SELECT id FROM promo_code_auth
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tickets
ADD CONSTRAINT reservations_ticket__promo_code_auth_fk
FOREIGN KEY (id_promo_code_auth)
REFERENCES promo_code_auth (id)
ON DELETE SET NULL ;

-- ############################################################################ PROMO CODE
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tickets
SET promo_code = NULL
where promo_code = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_tickets
WHERE id_promo_code NOT IN (
    SELECT id FROM promo_code
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tickets
WHERE id_promo_code NOT IN (
    SELECT id FROM promo_code
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tickets
ADD CONSTRAINT reservations_ticket__promo_code_fk
FOREIGN KEY (id_promo_code)
REFERENCES promo_code (id)
ON DELETE SET NULL ;

-- ############################################################################ PROVIDERS
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tickets
SET id_proveedor = NULL
where id_proveedor = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_tickets
WHERE id_proveedor NOT IN (
    SELECT id FROM provider
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tickets
WHERE id_proveedor NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tickets
ADD CONSTRAINT reservations_ticket__providers_fk
FOREIGN KEY (id_proveedor)
REFERENCES provider (id)
ON DELETE SET NULL ;

-- ############################################################################ SERVICES
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tickets
SET id_servicio = NULL
where id_servicio = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_tickets
WHERE id_servicio NOT IN (
    SELECT id FROM tickets_rate
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tickets
WHERE id_servicio NOT IN (
    SELECT id FROM tickets_rate
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tickets
ADD CONSTRAINT reservations_ticket__services_fk
FOREIGN KEY (id_servicio)
REFERENCES tickets_rate (id)
ON DELETE SET NULL ;

-- ############################################################################ SUB PRODUCTO
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tickets
SET id_sub_producto = NULL
where id_sub_producto = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_tickets
WHERE id_sub_producto NOT IN (
    SELECT id FROM sub_products
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tickets
WHERE id_sub_producto NOT IN (
    SELECT id FROM sub_products
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tickets
ADD CONSTRAINT reservations_ticket__sub_products_fk
FOREIGN KEY (id_sub_producto)
REFERENCES sub_products (id)
ON DELETE SET NULL ;

-- ############################################################################ TIPS XCARET
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tickets
SET tips_id = NULL
where tips_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_tickets
WHERE tips_id NOT IN (
    SELECT id FROM tips_xcaret
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tickets
WHERE tips_id NOT IN (
    SELECT id FROM tips_xcaret
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tickets
ADD CONSTRAINT reservations_ticket__tips_xcaret_fk
FOREIGN KEY (tips_id)
REFERENCES tips_xcaret (id)
ON DELETE SET NULL;

-- ############################################################################ WEB PROMOTION
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tickets
SET id_web_promotion_applied = NULL
where id_web_promotion_applied = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_tickets
WHERE id_web_promotion_applied NOT IN (
    SELECT id FROM web_promotions
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tickets
WHERE id_web_promotion_applied NOT IN (
    SELECT id FROM web_promotions
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tickets
ADD CONSTRAINT reservations_ticket__web_promotion_fk
FOREIGN KEY (id_web_promotion_applied)
REFERENCES web_promotions (id)
ON DELETE SET NULL ;