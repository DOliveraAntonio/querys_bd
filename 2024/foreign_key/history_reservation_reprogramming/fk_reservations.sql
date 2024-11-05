-- CAMBIAR VALOR A NULL
UPDATE history_reservation_reprogramming
SET localizador = NULL
where localizador = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM history_reservation_reprogramming
WHERE localizador NOT IN (
    SELECT id FROM reservations
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM history_reservation_reprogramming
WHERE localizador NOT IN (
    SELECT id FROM reservations
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE history_reservation_reprogramming
ADD CONSTRAINT reservations_fk
FOREIGN KEY (localizador)
REFERENCES reservations (id)
ON DELETE CASCADE ;