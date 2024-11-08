-- ############################################################################ TICKETS
-- CAMBIAR VALOR A NULL
UPDATE tickets_has_category
SET id_entrada = NULL
where id_entrada = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM tickets_has_category
WHERE id_entrada NOT IN (
    SELECT id FROM tickets
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tickets_has_category
WHERE id_entrada NOT IN (
    SELECT id FROM tickets
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tickets_has_category
ADD CONSTRAINT tickets_fk
FOREIGN KEY (id_entrada)
REFERENCES tickets (id)
ON DELETE SET NULL ;