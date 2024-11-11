-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE user_has_permissions
SET user_id = NULL
where user_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM user_has_permissions
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM user_has_permissions
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE user_has_permissions
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ PERMISSIONS
-- CAMBIAR VALOR A NULL
UPDATE user_has_permissions
SET permission_id = NULL
where permission_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM user_has_permissions
WHERE permission_id NOT IN (
    SELECT id FROM permissions
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM user_has_permissions
WHERE permission_id NOT IN (
    SELECT id FROM permissions
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE user_has_permissions
ADD CONSTRAINT permissions_fk
FOREIGN KEY (permission_id)
REFERENCES permissions (id)
ON DELETE CASCADE ;