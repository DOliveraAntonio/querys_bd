-- ############################################################################ CLIENT
-- CAMBIAR VALOR A NULL
UPDATE oauth_personal_access_clients
SET client_id = NULL
where client_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM oauth_personal_access_clients
WHERE client_id NOT IN (
    SELECT id FROM client
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM oauth_personal_access_clients
WHERE client_id NOT IN (
    SELECT id FROM client
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE oauth_personal_access_clients
ADD CONSTRAINT client_fk
FOREIGN KEY (client_id)
REFERENCES client (id)
ON DELETE CASCADE ;