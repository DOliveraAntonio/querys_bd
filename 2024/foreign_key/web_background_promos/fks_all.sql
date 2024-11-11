-- ############################################################################ WEB PROMO
-- CAMBIAR VALOR A NULL
UPDATE web_background_promos
SET web_promo_id = NULL
where web_promo_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_background_promos
WHERE web_promo_id NOT IN (
    SELECT id FROM web_promos
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_background_promos
WHERE web_promo_id NOT IN (
    SELECT id FROM web_promos
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_background_promos
ADD CONSTRAINT web_promos_fk
FOREIGN KEY (web_promo_id)
REFERENCES web_promos (id)
ON DELETE CASCADE ;