-- ############################################################################ WEB PARKS
-- CAMBIAR VALOR A NULL
UPDATE web_park_attractions
SET web_park_id = NULL
where web_park_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_park_attractions
WHERE web_park_id NOT IN (
    SELECT id FROM web_parks
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_park_attractions
WHERE web_park_id NOT IN (
    SELECT id FROM web_parks
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_park_attractions
ADD CONSTRAINT web_parks_fk
FOREIGN KEY (web_park_id)
REFERENCES web_parks (id)
ON DELETE CASCADE ;