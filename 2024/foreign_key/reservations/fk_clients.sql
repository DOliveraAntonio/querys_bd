
-- YA PODEMOS CREAR LAS LLAVES FORANEAS
SELECT count(*) as client FROM reservations
WHERE id_cliente NOT IN (
    SELECT id FROM client
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations
WHERE id_cliente NOT IN (
    SELECT id FROM client
);
-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations
ADD CONSTRAINT clients__reservations_fk
FOREIGN KEY (id_cliente)
REFERENCES client (id)
ON DELETE CASCADE ;