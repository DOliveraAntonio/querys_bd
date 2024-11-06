-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE comision_sub_gerente
SET id_sub_gerente = NULL
where id_sub_gerente = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM comision_sub_gerente
WHERE id_sub_gerente NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM comision_sub_gerente
WHERE id_sub_gerente NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE comision_sub_gerente
ADD CONSTRAINT users_fk
FOREIGN KEY (id_sub_gerente)
REFERENCES users (id)
ON DELETE SET NULL;