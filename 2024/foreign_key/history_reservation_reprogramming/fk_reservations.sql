-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM history_reservation_led
WHERE localizador NOT IN (
    SELECT id FROM reservations
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM history_reservation_led
WHERE localizador NOT IN (
    SELECT id FROM reservations
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE history_reservation_led
ADD CONSTRAINT reservations_fk
FOREIGN KEY (localizador)
REFERENCES reservations (id)
ON DELETE CASCADE ;