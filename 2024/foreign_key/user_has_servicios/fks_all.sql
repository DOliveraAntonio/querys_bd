-- ############################################################################ USERS AHS PRODUCTS
-- CAMBIAR VALOR A NULL
UPDATE user_has_servicios
SET id_user_has_metodo_producto = NULL
where id_user_has_metodo_producto = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM user_has_servicios
WHERE id_user_has_metodo_producto NOT IN (
    SELECT id FROM user_has_metodo_producto
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM user_has_servicios
WHERE id_user_has_metodo_producto NOT IN (
    SELECT id FROM user_has_metodo_producto
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE user_has_servicios
ADD CONSTRAINT user_has_metodo_producto_fk
FOREIGN KEY (id_user_has_metodo_producto)
REFERENCES user_has_metodo_producto (id)
ON DELETE CASCADE ;