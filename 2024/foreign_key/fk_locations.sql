-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT count(*) FROM reservations
WHERE id_history_location NOT IN (
    SELECT id FROM sales_location
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations
WHERE reservations.id_history_location NOT IN (
    SELECT id FROM sales_location
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations
ADD CONSTRAINT reservations__locations_fk
FOREIGN KEY (id_history_location)
REFERENCES sales_location (id)
ON DELETE CASCADE ;