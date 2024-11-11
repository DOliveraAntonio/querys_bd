-- ############################################################################ WEB DISC
-- CAMBIAR VALOR A NULL
UPDATE web_category_disc
SET web_disc_id = NULL
where web_disc_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_category_disc
WHERE web_disc_id NOT IN (
    SELECT id FROM web_discs
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_category_disc
WHERE web_disc_id NOT IN (
    SELECT id FROM web_discs
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_category_disc
ADD CONSTRAINT web_discs_fk
FOREIGN KEY (web_disc_id)
REFERENCES web_discs (id)
ON DELETE CASCADE ;

-- ############################################################################ WEB CATEGORY
-- CAMBIAR VALOR A NULL
UPDATE web_category_disc
SET web_category_id = NULL
where web_category_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_category_disc
WHERE web_category_id NOT IN (
    SELECT id FROM web_categories
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_category_disc
WHERE web_category_id NOT IN (
    SELECT id FROM web_categories
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_category_disc
ADD CONSTRAINT web_categories_fk
FOREIGN KEY (web_category_id)
REFERENCES web_categories (id)
ON DELETE CASCADE ;