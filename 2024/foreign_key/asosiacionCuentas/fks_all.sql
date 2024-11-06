-- ############################################################################ CANAL
-- CAMBIAR VALOR A NULL
UPDATE "asosiacionCuentas"
SET canal_id = NULL
where canal_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM "asosiacionCuentas"
WHERE canal_id NOT IN (
    SELECT id FROM channel
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM "asosiacionCuentas"
WHERE canal_id NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE "asosiacionCuentas"
ADD CONSTRAINT channel_fk
FOREIGN KEY (canal_id)
REFERENCES channel (id)
ON DELETE SET NULL ;