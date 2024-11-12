-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE web_promotions
SET user_id = NULL
where user_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_promotions
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_promotions
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_promotions
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ CHANNEL
-- CAMBIAR VALOR A NULL
UPDATE web_promotions
SET channel_id = NULL
where channel_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_promotions
WHERE channel_id NOT IN (
    SELECT id FROM channel
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_promotions
WHERE channel_id NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_promotions
ADD CONSTRAINT channel_fk
FOREIGN KEY (channel_id)
REFERENCES channel (id)
ON DELETE CASCADE ;

-- ############################################################################ WEB PROMOTIONS
-- CAMBIAR VALOR A NULL
UPDATE web_promotions
SET web_promotion_type_id = NULL
where web_promotion_type_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_promotions
WHERE web_promotion_type_id NOT IN (
    SELECT id FROM web_promotions_type
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_promotions
WHERE web_promotion_type_id NOT IN (
    SELECT id FROM web_promotions_type
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_promotions
ADD CONSTRAINT web_promotions_type_fk
FOREIGN KEY (web_promotion_type_id)
REFERENCES web_promotions_type (id)
ON DELETE CASCADE ;