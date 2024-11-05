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