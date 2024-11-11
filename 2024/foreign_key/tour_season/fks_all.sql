-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE tour_season
SET provider_id = NULL
where provider_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM tour_season
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tour_season
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tour_season
ADD CONSTRAINT provider_fk
FOREIGN KEY (provider_id)
REFERENCES provider (id)
ON DELETE CASCADE ;