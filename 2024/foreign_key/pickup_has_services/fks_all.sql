-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE pickup_has_services
SET id_pickup = NULL
where id_pickup = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM pickup_has_services
WHERE id_pickup NOT IN (
    SELECT id FROM pickup_service_locations
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM pickup_has_services
WHERE id_pickup NOT IN (
    SELECT id FROM pickup_service_locations
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE pickup_has_services
ADD CONSTRAINT pickup_service_locations_fk
FOREIGN KEY (id_pickup)
REFERENCES pickup_service_locations (id)
ON DELETE CASCADE ;