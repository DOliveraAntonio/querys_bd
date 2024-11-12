-- ############################################################################ WEB CATEGORY
-- CAMBIAR VALOR A NULL
UPDATE web_seo_pages
SET seo_category_id = NULL
where seo_category_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_seo_pages
WHERE seo_category_id NOT IN (
    SELECT id FROM web_seo_categories
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_seo_pages
WHERE seo_category_id NOT IN (
    SELECT id FROM web_seo_categories
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_seo_pages
ADD CONSTRAINT web_seo_categories_fk
FOREIGN KEY (seo_category_id)
REFERENCES web_seo_categories (id)
ON DELETE CASCADE ;