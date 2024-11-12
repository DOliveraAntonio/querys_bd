-- ############################################################################ COLUMNS CHANGE
alter table web_promotions_has_landings
    add constraint web_promotions_has_landings_pk
        primary key (id);


-- ############################################################################ WEB PROMOTIONS
-- CAMBIAR VALOR A NULL
UPDATE web_promotions_has_landings
SET web_promotion_id = NULL
where web_promotion_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_promotions_has_landings
WHERE web_promotion_id NOT IN (
    SELECT id FROM web_promotions
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_promotions_has_landings
WHERE web_promotion_id NOT IN (
    SELECT id FROM web_promotions
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_promotions_has_landings
ADD CONSTRAINT web_promotions_fk
FOREIGN KEY (web_promotion_id)
REFERENCES web_promotions (id)
ON DELETE CASCADE ;

-- ############################################################################ WEB LANDINGS
-- CAMBIAR VALOR A NULL
UPDATE web_promotions_has_landings
SET web_landing_id = NULL
where web_landing_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_promotions_has_landings
WHERE web_landing_id NOT IN (
    SELECT id FROM web_landings
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_promotions_has_landings
WHERE web_landing_id NOT IN (
    SELECT id FROM web_landings
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_promotions_has_landings
ADD CONSTRAINT web_landings_fk
FOREIGN KEY (web_landing_id)
REFERENCES web_landings (id)
ON DELETE CASCADE ;