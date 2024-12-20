-- ############################################################################ RESERVATION LED
-- CAMBIAR VALOR A NULL
UPDATE history_reservation_led
SET id_reservation_led = NULL
where id_reservation_led = 0;

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

-- ############################################################################ RESERVATION
-- CAMBIAR VALOR A NULL
UPDATE history_reservation_led
SET id_reservation = NULL
where id_reservation = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM history_reservation_led
WHERE id_reservation NOT IN (
    SELECT id FROM reservations
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM history_reservation_led
WHERE id_reservation NOT IN (
    SELECT id FROM reservations
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE history_reservation_led
ADD CONSTRAINT reservations_fk
FOREIGN KEY (id_reservation)
REFERENCES reservations (id)
ON DELETE CASCADE;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE history_reservation_led
SET id_user = NULL
where id_user = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM history_reservation_led
WHERE id_user NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM history_reservation_led
WHERE id_user NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE history_reservation_led
ADD CONSTRAINT users_fk
FOREIGN KEY (id_user)
REFERENCES users (id)
ON DELETE CASCADE;