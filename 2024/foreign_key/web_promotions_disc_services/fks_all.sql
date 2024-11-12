-- ############################################################################ COLUMN CHANGES
alter table web_promotions_disc_services
    add constraint web_promotions_disc_services_pk
        primary key (id);

-- ############################################################################ WEB PROMOTION
-- CAMBIAR VALOR A NULL
UPDATE web_promotions_disc_services
SET web_promotion_id = NULL
where web_promotion_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_promotions_disc_services
WHERE web_promotion_id NOT IN (
    SELECT id FROM web_promotions
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_promotions_disc_services
WHERE web_promotion_id NOT IN (
    SELECT id FROM web_promotions
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_promotions_disc_services
ADD CONSTRAINT web_promotions_fk
FOREIGN KEY (web_promotion_id)
REFERENCES web_promotions (id)
ON DELETE CASCADE ;

-- ############################################################################ WEB SERVICES
-- CAMBIAR VALOR A NULL
UPDATE web_promotions_disc_services
SET web_service_id = NULL
where web_service_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_promotions_disc_services
WHERE web_service_id NOT IN (
    SELECT id FROM web_services
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_promotions_disc_services
WHERE web_service_id NOT IN (
    SELECT id FROM web_services
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_promotions_disc_services
ADD CONSTRAINT web_services_fk
FOREIGN KEY (web_service_id)
REFERENCES web_services (id)
ON DELETE CASCADE ;