-- ############################################################################ PROMO CODE
-- CAMBIAR VALOR A NULL
UPDATE "promoCode_channel"
SET id_promo_code = NULL
where id_promo_code = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM "promoCode_channel"
WHERE id_promo_code NOT IN (
    SELECT id FROM promo_code
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM "promoCode_channel"
WHERE id_promo_code NOT IN (
    SELECT id FROM promo_code
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE "promoCode_channel"
ADD CONSTRAINT promo_code_fk
FOREIGN KEY (id_promo_code)
REFERENCES promo_code (id)
ON DELETE CASCADE ;

-- ############################################################################ CANAL
-- CAMBIAR VALOR A NULL
UPDATE "promoCode_channel"
SET id_canal = NULL
where id_canal = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM "promoCode_channel"
WHERE id_canal NOT IN (
    SELECT id FROM channel
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM "promoCode_channel"
WHERE id_canal NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE "promoCode_channel"
ADD CONSTRAINT channel_fk
FOREIGN KEY (id_canal)
REFERENCES channel (id)
ON DELETE CASCADE ;