-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_transportation
WHERE id_user_operated NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_transportation
WHERE id_user_operated NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_transportation
ADD CONSTRAINT reservations_transportation__users_fk
FOREIGN KEY (id_user_operated)
REFERENCES users (id)
ON DELETE SET NULL ;