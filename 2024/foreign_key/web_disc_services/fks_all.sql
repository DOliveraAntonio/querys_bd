-- ############################################################################ WEB DISCS
-- CAMBIAR VALOR A NULL
UPDATE web_disc_services
SET web_disc_id = NULL
where web_disc_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_disc_services
WHERE web_disc_id NOT IN (
    SELECT id FROM web_discs
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_disc_services
WHERE web_disc_id NOT IN (
    SELECT id FROM web_discs
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_disc_services
ADD CONSTRAINT web_discs_fk
FOREIGN KEY (web_disc_id)
REFERENCES web_discs (id)
ON DELETE CASCADE ;

-- ############################################################################ DISC SERVICES
-- CAMBIAR VALOR A NULL
UPDATE web_disc_services
SET disc_service_id = NULL
where disc_service_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_disc_services
WHERE disc_service_id NOT IN (
    SELECT id FROM discs_servicios
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_disc_services
WHERE disc_service_id NOT IN (
    SELECT id FROM discs_servicios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_disc_services
ADD CONSTRAINT discs_servicios_fk
FOREIGN KEY (disc_service_id)
REFERENCES discs_servicios (id)
ON DELETE CASCADE ;

-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE web_disc_services
SET provider_id = NULL
where provider_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_disc_services
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_disc_services
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_disc_services
ADD CONSTRAINT provider_fk
FOREIGN KEY (provider_id)
REFERENCES provider (id)
ON DELETE CASCADE ;