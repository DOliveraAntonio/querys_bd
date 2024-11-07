-- ############################################################################ CHANGE COLUMN
alter table newsletters
    alter column created_by drop default;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE newsletters
SET created_by = NULL
where created_by = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM newsletters
WHERE created_by NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM newsletters
WHERE created_by NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE newsletters
ADD CONSTRAINT users_fk
FOREIGN KEY (created_by)
REFERENCES users (id)
ON DELETE CASCADE ;