-- ############################################################################ RESERVATIONS
-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM led_assignment
WHERE id_reservation NOT IN (
    SELECT id FROM reservations
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM led_assignment
WHERE id_reservation NOT IN (
    SELECT id FROM reservations
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE led_assignment
ADD CONSTRAINT reservations_fk
FOREIGN KEY (id_reservation)
REFERENCES reservations (id)
ON DELETE CASCADE;

-- ############################################################################ USERS
-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM led_assignment
WHERE id_user NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM led_assignment
WHERE id_user NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE led_assignment
ADD CONSTRAINT users_fk
FOREIGN KEY (id_user)
REFERENCES users (id)
ON DELETE CASCADE;