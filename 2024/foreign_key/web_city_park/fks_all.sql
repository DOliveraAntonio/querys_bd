-- ############################################################################ WEB PARKS
-- CAMBIAR VALOR A NULL
UPDATE web_city_park
SET web_park_id = NULL
where web_park_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_city_park
WHERE web_park_id NOT IN (
    SELECT id FROM web_parks
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_city_park
WHERE web_park_id NOT IN (
    SELECT id FROM web_parks
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_city_park
ADD CONSTRAINT web_parks_fk
FOREIGN KEY (web_park_id)
REFERENCES web_parks (id)
ON DELETE CASCADE ;

-- ############################################################################ CITY
-- CAMBIAR VALOR A NULL
UPDATE web_city_park
SET city_id = NULL
where city_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_city_park
WHERE city_id NOT IN (
    SELECT id FROM city
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_city_park
WHERE city_id NOT IN (
    SELECT id FROM city
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_city_park
ADD CONSTRAINT city_fk
FOREIGN KEY (city_id)
REFERENCES city (id)
ON DELETE CASCADE ;