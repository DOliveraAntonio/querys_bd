-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE dock_transportation
SET id_provider = NULL
where id_provider = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM dock_transportation
WHERE id_provider NOT IN (
    SELECT id FROM provider
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM dock_transportation
WHERE id_provider NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE dock_transportation
ADD CONSTRAINT provider_fk
FOREIGN KEY (id_provider)
REFERENCES provider (id)
ON DELETE CASCADE;