-- CAMBIAR VALOR A NULL
UPDATE history_reservation_reprogramming
SET id_rep_request = NULL
where id_rep_request = 0;

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
ON DELETE CASCADE;