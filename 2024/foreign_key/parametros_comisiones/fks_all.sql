-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE parametros_comisiones
SET id_user = NULL
where id_user = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM parametros_comisiones
WHERE id_user NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM parametros_comisiones
WHERE id_user NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE parametros_comisiones
ADD CONSTRAINT users_fk
FOREIGN KEY (id_user)
REFERENCES users (id)
ON DELETE CASCADE ;