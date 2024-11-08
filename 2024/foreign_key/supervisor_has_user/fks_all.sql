-- ############################################################################ USER
-- CAMBIAR VALOR A NULL
UPDATE supervisor_has_user
SET user_id = NULL
where user_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM supervisor_has_user
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM supervisor_has_user
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE supervisor_has_user
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ SUPERVISOR
-- CAMBIAR VALOR A NULL
UPDATE supervisor_has_user
SET supervisor_id = NULL
where supervisor_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM supervisor_has_user
WHERE supervisor_id NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM supervisor_has_user
WHERE supervisor_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE supervisor_has_user
ADD CONSTRAINT supervisor_fk
FOREIGN KEY (supervisor_id)
REFERENCES users (id)
ON DELETE CASCADE ;