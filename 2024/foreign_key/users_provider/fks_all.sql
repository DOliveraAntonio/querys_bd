-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE users_provider
SET user_id = NULL
where user_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM users_provider
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM users_provider
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE users_provider
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE users_provider
SET provider_id = NULL
where provider_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM users_provider
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM users_provider
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE users_provider
ADD CONSTRAINT provider_fk
FOREIGN KEY (provider_id)
REFERENCES provider (id)
ON DELETE CASCADE ;