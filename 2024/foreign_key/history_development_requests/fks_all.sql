-- ############################################################################ DEVELOPMENT REQUEST
-- CAMBIAR VALOR A NULL
UPDATE history_development_requests
SET development_request_id = NULL
where development_request_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM history_development_requests
WHERE development_request_id NOT IN (
    SELECT id FROM development_requests
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM history_development_requests
WHERE development_request_id NOT IN (
    SELECT id FROM development_requests
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE history_development_requests
ADD CONSTRAINT development_requests_fk
FOREIGN KEY (development_request_id)
REFERENCES development_requests (id)
ON DELETE SET NULL ;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE history_development_requests
SET user_id = NULL
where user_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM history_development_requests
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM history_development_requests
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE history_development_requests
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE SET NULL ;