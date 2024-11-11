-- ############################################################################ WEB CATEGORIES
-- CAMBIAR VALOR A NULL
UPDATE web_category_park
SET web_category_id = NULL
where web_category_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_category_park
WHERE web_category_id NOT IN (
    SELECT id FROM web_categories
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_category_park
WHERE web_category_id NOT IN (
    SELECT id FROM web_categories
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_category_park
ADD CONSTRAINT web_categories_fk
FOREIGN KEY (web_category_id)
REFERENCES web_categories (id)
ON DELETE CASCADE ;

-- ############################################################################ WEB PARKS
-- CAMBIAR VALOR A NULL
UPDATE web_category_park
SET web_park_id = NULL
where web_park_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_category_park
WHERE web_park_id NOT IN (
    SELECT id FROM web_parks
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_category_park
WHERE web_park_id NOT IN (
    SELECT id FROM web_parks
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_category_park
ADD CONSTRAINT web_parks_fk
FOREIGN KEY (web_park_id)
REFERENCES web_parks (id)
ON DELETE CASCADE ;