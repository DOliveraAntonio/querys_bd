-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE transfer_units
SET id_proveedor = NULL
where id_proveedor = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM transfer_units
WHERE id_proveedor NOT IN (
    SELECT id FROM provider
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM transfer_units
WHERE id_proveedor NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE transfer_units
ADD CONSTRAINT provider_fk
FOREIGN KEY (id_proveedor)
REFERENCES provider (id)
ON DELETE CASCADE ;