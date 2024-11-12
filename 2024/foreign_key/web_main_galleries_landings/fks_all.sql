-- ############################################################################ WEB LANDINGS
-- CAMBIAR VALOR A NULL
UPDATE web_main_galleries_landings
SET web_landing_id = NULL
where web_landing_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_main_galleries_landings
WHERE web_landing_id NOT IN (
    SELECT id FROM web_landings
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_main_galleries_landings
WHERE web_landing_id NOT IN (
    SELECT id FROM web_landings
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_main_galleries_landings
ADD CONSTRAINT web_landings_fk
FOREIGN KEY (web_landing_id)
REFERENCES web_landings (id)
ON DELETE CASCADE ;