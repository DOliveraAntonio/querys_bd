-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE user_has_channel
SET id_user = NULL
where id_user = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM user_has_channel
WHERE id_user NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM user_has_channel
WHERE id_user NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE user_has_channel
ADD CONSTRAINT users_fk
FOREIGN KEY (id_user)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ CHANNEl
-- CAMBIAR VALOR A NULL
UPDATE user_has_channel
SET id_canal = NULL
where id_canal = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM user_has_channel
WHERE id_canal NOT IN (
    SELECT id FROM channel
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM user_has_channel
WHERE id_canal NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE user_has_channel
ADD CONSTRAINT channel_fk
FOREIGN KEY (id_canal)
REFERENCES channel (id)
ON DELETE CASCADE ;

-- ############################################################################ PRODUCTS
-- CAMBIAR VALOR A NULL
UPDATE user_has_channel
SET id_producto = NULL
where id_producto = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM user_has_channel
WHERE id_producto NOT IN (
    SELECT id FROM products
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM user_has_channel
WHERE id_producto NOT IN (
    SELECT id FROM products
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE user_has_channel
ADD CONSTRAINT products_fk
FOREIGN KEY (id_producto)
REFERENCES products (id)
ON DELETE CASCADE ;