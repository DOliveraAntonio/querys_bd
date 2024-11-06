-- ############################################################################ PRODUCTS
-- CAMBIAR VALOR A NULL
UPDATE catalog_product_includes
SET catalog_product_id = NULL
where catalog_product_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM catalog_product_includes
WHERE catalog_product_id NOT IN (
    SELECT id FROM catalog_products
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM catalog_product_includes
WHERE catalog_product_id NOT IN (
    SELECT id FROM catalog_products
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE catalog_product_includes
ADD CONSTRAINT catalog_products_fk
FOREIGN KEY (catalog_product_id)
REFERENCES catalog_products (id)
ON DELETE SET NULL ;

-- ############################################################################ AMENIDADES
-- CAMBIAR VALOR A NULL
UPDATE catalog_product_includes
SET product_amenity_id = NULL
where product_amenity_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM catalog_product_includes
WHERE product_amenity_id NOT IN (
    SELECT id FROM catalog_amenities
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM catalog_product_includes
WHERE product_amenity_id NOT IN (
    SELECT id FROM catalog_amenities
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE catalog_product_includes
ADD CONSTRAINT catalog_amenities_fk
FOREIGN KEY (product_amenity_id)
REFERENCES catalog_amenities (id)
ON DELETE SET NULL ;