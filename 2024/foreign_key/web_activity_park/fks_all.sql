l-- ############################################################################ WEB PARKS
-- CAMBIAR VALOR A NULL
UPDATE web_activity_park
SET web_park_id = NULL
where web_park_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_activity_park
WHERE web_park_id NOT IN (
    SELECT id FROM web_parks
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_activity_park
WHERE web_park_id NOT IN (
    SELECT id FROM web_parks
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_activity_park
ADD CONSTRAINT web_parks_fk
FOREIGN KEY (web_park_id)
REFERENCES web_parks (id)
ON DELETE CASCADE ;

-- ############################################################################ WEB ACTIVITIES
-- CAMBIAR VALOR A NULL
UPDATE web_activity_park
SET web_activity_id = NULL
where web_activity_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_activity_park
WHERE web_activity_id NOT IN (
    SELECT id FROM web_activities
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_activity_park
WHERE web_activity_id NOT IN (
    SELECT id FROM web_activities
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_activity_park
ADD CONSTRAINT web_activities_fk
FOREIGN KEY (web_activity_id)
REFERENCES web_activities (id)
ON DELETE CASCADE ;