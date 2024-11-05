-- ############################################################################ RESERVATION
-- CAMBIAR VALOR A NULL
UPDATE cancellation_requests
SET reservation_id = NULL
where reservation_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM cancellation_requests
WHERE reservation_id NOT IN (
    SELECT id FROM reservations
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM cancellation_requests
WHERE reservation_id NOT IN (
    SELECT id FROM reservations
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE cancellation_requests
ADD CONSTRAINT reservations_fk
FOREIGN KEY (reservation_id)
REFERENCES reservations (id)
ON DELETE CASCADE;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE cancellation_requests
SET user_id = NULL
where user_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM cancellation_requests
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM cancellation_requests
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE cancellation_requests
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE;

-- ############################################################################ CANALES
-- CAMBIAR VALOR A NULL
UPDATE cancellation_requests
SET id_canal = NULL
where id_canal = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM cancellation_requests
WHERE id_canal NOT IN (
    SELECT id FROM channel
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM cancellation_requests
WHERE id_canal NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE cancellation_requests
ADD CONSTRAINT channels_fk
FOREIGN KEY (id_canal)
REFERENCES channel (id)
ON DELETE CASCADE;