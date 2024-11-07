-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE oauth_access_tokens
SET user_id = NULL
where user_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM oauth_access_tokens
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM oauth_access_tokens
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE oauth_access_tokens
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ CLIENT
-- CAMBIAR VALOR A NULL
UPDATE oauth_access_tokens
SET client_id = NULL
where client_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM oauth_access_tokens
WHERE client_id NOT IN (
    SELECT id FROM client
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM oauth_access_tokens
WHERE client_id NOT IN (
    SELECT id FROM client
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE oauth_access_tokens
ADD CONSTRAINT client_fk
FOREIGN KEY (client_id)
REFERENCES client (id)
ON DELETE CASCADE ;