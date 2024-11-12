-- ############################################################################ PARKS
-- CAMBIAR VALOR A NULL
UPDATE web_park_services_schedules
SET id_park = NULL
where id_park = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_park_services_schedules
WHERE id_park NOT IN (
    SELECT id FROM web_parks
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_park_services_schedules
WHERE id_park NOT IN (
    SELECT id FROM web_parks
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_park_services_schedules
ADD CONSTRAINT web_parks_fk
FOREIGN KEY (id_park)
REFERENCES web_parks (id)
ON DELETE CASCADE ;