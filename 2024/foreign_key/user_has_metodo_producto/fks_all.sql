-- ############################################################################ USERS HAS CHANNEL
-- CAMBIAR VALOR A NULL
UPDATE user_has_metodo_producto
SET id_user_has_channel = NULL
where id_user_has_channel = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM user_has_metodo_producto
WHERE id_user_has_channel NOT IN (
    SELECT id FROM user_has_channel
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM user_has_metodo_producto
WHERE id_user_has_channel NOT IN (
    SELECT id FROM user_has_channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE user_has_metodo_producto
ADD CONSTRAINT user_has_channel_fk
FOREIGN KEY (id_user_has_channel)
REFERENCES user_has_channel (id)
ON DELETE CASCADE ;

-- ############################################################################ METHOD PRODUCT
-- CAMBIAR VALOR A NULL
UPDATE user_has_metodo_producto
SET id_metodo_producto = NULL
where id_metodo_producto = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM user_has_metodo_producto
WHERE id_metodo_producto NOT IN (
    SELECT id FROM product_method
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM user_has_metodo_producto
WHERE id_metodo_producto NOT IN (
    SELECT id FROM product_method
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE user_has_metodo_producto
ADD CONSTRAINT product_method_fk
FOREIGN KEY (id_metodo_producto)
REFERENCES product_method (id)
ON DELETE CASCADE ;