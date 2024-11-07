-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE promo_code
SET id_user_created = NULL
where id_user_created = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM promo_code
WHERE id_user_created NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM promo_code
WHERE id_user_created NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE promo_code
ADD CONSTRAINT users_fk
FOREIGN KEY (id_user_created)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ CURRENCY
-- CAMBIAR VALOR A NULL
UPDATE promo_code
SET currency_id = NULL
where currency_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM promo_code
WHERE currency_id NOT IN (
    SELECT id FROM currency
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM promo_code
WHERE currency_id NOT IN (
    SELECT id FROM currency
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE promo_code
ADD CONSTRAINT currency_fk
FOREIGN KEY (currency_id)
REFERENCES currency (id)
ON DELETE CASCADE ;