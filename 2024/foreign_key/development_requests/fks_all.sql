-- CAMBIAR VALOR A NULL
UPDATE development_requests
SET user_id = NULL
where user_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM development_requests
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM development_requests
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE development_requests
ADD CONSTRAINT updated_by_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE SET NULL;