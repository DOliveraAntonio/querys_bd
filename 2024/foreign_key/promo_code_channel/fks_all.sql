-- ############################################################################ PROMO CODE
-- CAMBIAR VALOR A NULL
UPDATE promo_code_channel
SET id_promo_code = NULL
where id_promo_code = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM promo_code_channel
WHERE id_promo_code NOT IN (
    SELECT id FROM promo_code
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM promo_code_channel
WHERE id_promo_code NOT IN (
    SELECT id FROM promo_code
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE promo_code_channel
ADD CONSTRAINT promo_code_fk
FOREIGN KEY (id_promo_code)
REFERENCES promo_code (id)
ON DELETE CASCADE ;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE promo_code_channel
SET id_user_channel = NULL
where id_user_channel = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM promo_code_channel
WHERE id_user_channel NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM promo_code_channel
WHERE id_user_channel NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE promo_code_channel
ADD CONSTRAINT users_fk
FOREIGN KEY (id_user_channel)
REFERENCES users (id)
ON DELETE SET NULL ;

-- ############################################################################ CANAL
-- CAMBIAR VALOR A NULL
UPDATE promo_code_channel
SET id_canal = NULL
where id_canal = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM promo_code_channel
WHERE id_canal NOT IN (
    SELECT id FROM channel
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM promo_code_channel
WHERE id_canal NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE promo_code_channel
ADD CONSTRAINT channel_fk
FOREIGN KEY (id_canal)
REFERENCES channel (id)
ON DELETE SET NULL ;