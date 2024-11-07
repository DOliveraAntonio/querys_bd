-- ############################################################################ PRODUCTS
-- CAMBIAR VALOR A NULL
UPDATE promo_code_season_product
SET id_promo_code_channel = NULL
where id_promo_code_channel = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM promo_code_season_product
WHERE id_promo_code_channel NOT IN (
    SELECT id FROM promo_code_channel
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM promo_code_season_product
WHERE id_promo_code_channel NOT IN (
    SELECT id FROM promo_code_channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE promo_code_season_product
ADD CONSTRAINT promo_code_channel_fk
FOREIGN KEY (id_promo_code_channel)
REFERENCES promo_code_channel (id)
ON DELETE SET NULL ;