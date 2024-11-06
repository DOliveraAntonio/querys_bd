-- ############################################################################ CATEGORIAS
-- CAMBIAR VALOR A NULL
UPDATE catalog_products
SET catalog_category_id = NULL
where catalog_category_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM catalog_products
WHERE catalog_category_id NOT IN (
    SELECT id FROM catalog_categories
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM catalog_products
WHERE catalog_category_id NOT IN (
    SELECT id FROM catalog_categories
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE catalog_products
ADD CONSTRAINT catalog_categories_fk
FOREIGN KEY (catalog_category_id)
REFERENCES catalog_categories (id)
ON DELETE SET NULL ;

-- ############################################################################ CREATE BY
-- CAMBIAR VALOR A NULL
UPDATE catalog_products
SET created_by = NULL
where created_by = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM catalog_products
WHERE created_by NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM catalog_products
WHERE created_by NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE catalog_products
ADD CONSTRAINT users_created_fk
FOREIGN KEY (created_by)
REFERENCES users (id)
ON DELETE SET NULL ;

-- ############################################################################ UPDATE BY
-- CAMBIAR VALOR A NULL
UPDATE catalog_products
SET updated_by = NULL
where updated_by = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM catalog_products
WHERE updated_by NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM catalog_products
WHERE updated_by NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE catalog_products
ADD CONSTRAINT users_updated_fk
FOREIGN KEY (updated_by)
REFERENCES users (id)
ON DELETE SET NULL ;
