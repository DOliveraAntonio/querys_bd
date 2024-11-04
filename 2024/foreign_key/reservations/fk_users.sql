-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT count(*) as users FROM reservations
WHERE id_user NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations
WHERE id_user NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations
ADD CONSTRAINT reservations__users_fk
FOREIGN KEY (id_user)
REFERENCES users (id)
ON DELETE CASCADE ;