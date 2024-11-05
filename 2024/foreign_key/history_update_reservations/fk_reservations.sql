-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM history_update_reservations
WHERE id_reservation NOT IN (
    SELECT id FROM reservations
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM history_update_reservations
WHERE id_reservation NOT IN (
    SELECT id FROM reservations
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE history_update_reservations
ADD CONSTRAINT reservations_fk
FOREIGN KEY (id_reservation)
REFERENCES reservations (id)
ON DELETE SET NULL ;