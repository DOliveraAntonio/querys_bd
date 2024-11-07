-- ############################################################################ PROMO CODE
-- CAMBIAR VALOR A NULL
UPDATE promo_code_has_product_types
SET promo_code_id = NULL
where promo_code_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM promo_code_has_product_types
WHERE promo_code_id NOT IN (
    SELECT id FROM promo_code
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM promo_code_has_product_types
WHERE promo_code_id NOT IN (
    SELECT id FROM promo_code
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE promo_code_has_product_types
ADD CONSTRAINT promo_code_fk
FOREIGN KEY (promo_code_id)
REFERENCES promo_code (id)
ON DELETE SET NULL ;

-- ############################################################################ PRODUCTS
-- CAMBIAR VALOR A NULL
UPDATE promo_code_has_product_types
SET product_type_id = NULL
where product_type_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM promo_code_has_product_types
WHERE product_type_id NOT IN (
    SELECT id FROM products
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM promo_code_has_product_types
WHERE product_type_id NOT IN (
    SELECT id FROM products
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE promo_code_has_product_types
ADD CONSTRAINT products_fk
FOREIGN KEY (product_type_id)
REFERENCES products (id)
ON DELETE SET NULL ;