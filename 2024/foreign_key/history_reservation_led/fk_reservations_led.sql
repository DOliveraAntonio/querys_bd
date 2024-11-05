-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM history_reservation_led
WHERE id_reservation_led NOT IN (
    SELECT id FROM reservations
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM history_reservation_led
WHERE id_reservation_led NOT IN (
    SELECT id FROM reservations
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE history_reservation_led
ADD CONSTRAINT reservations_led_fk
FOREIGN KEY (id_reservation_led)
REFERENCES reservations (id)
ON DELETE CASCADE;