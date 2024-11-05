-- CAMBIAR VALOR A NULL
UPDATE reservations_payments
SET user_id = NULL
where user_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_payments
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_payments
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_payments
ADD CONSTRAINT reservations_payment__users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE SET NULL ;