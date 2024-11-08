-- ############################################################################ CHANGE COLUMN
alter table save_booking_logs
    alter column booking_id drop not null;

alter table save_booking_logs
    alter column booking_id drop default;

alter table save_booking_logs
    alter column user_id drop not null;

alter table save_booking_logs
    alter column user_id drop default;

-- ############################################################################ RESERVATIONS
-- CAMBIAR VALOR A NULL
UPDATE save_booking_logs
SET booking_id = NULL
where booking_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM save_booking_logs
WHERE booking_id NOT IN (
    SELECT id FROM reservations
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM save_booking_logs
WHERE booking_id NOT IN (
    SELECT id FROM reservations
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE save_booking_logs
ADD CONSTRAINT reservations_fk
FOREIGN KEY (booking_id)
REFERENCES reservations (id)
ON DELETE CASCADE ;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE save_booking_logs
SET user_id = NULL
where user_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM save_booking_logs
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM save_booking_logs
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE save_booking_logs
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;