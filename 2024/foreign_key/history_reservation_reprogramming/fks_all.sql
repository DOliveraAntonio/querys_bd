-- ############################################################################ RESERVATION
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
ON DELETE SET NULL ;

-- ############################################################################ USERS
-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM history_reservation_reprogramming
WHERE id_rep_request NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM history_reservation_reprogramming
WHERE id_rep_request NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE history_reservation_reprogramming
ADD CONSTRAINT users_fk
FOREIGN KEY (id_rep_request)
REFERENCES users (id)
ON DELETE SET NULL ;