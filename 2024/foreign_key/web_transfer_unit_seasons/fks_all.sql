-- ############################################################################ SEASON
-- CAMBIAR VALOR A NULL
UPDATE web_transfer_unit_seasons
SET season_id = NULL
where season_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_transfer_unit_seasons
WHERE season_id NOT IN (
    SELECT id FROM transportation_season
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_transfer_unit_seasons
WHERE season_id NOT IN (
    SELECT id FROM transportation_season
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_transfer_unit_seasons
ADD CONSTRAINT transportation_season_fk
FOREIGN KEY (season_id)
REFERENCES transportation_season (id)
ON DELETE CASCADE ;

-- ############################################################################ DETAILS TRANSPORTATION
-- CAMBIAR VALOR A NULL
UPDATE web_transfer_unit_seasons
SET transfer_unit_id = NULL
where transfer_unit_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_transfer_unit_seasons
WHERE transfer_unit_id NOT IN (
    SELECT id FROM web_details_transportation
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_transfer_unit_seasons
WHERE transfer_unit_id NOT IN (
    SELECT id FROM web_details_transportation
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_transfer_unit_seasons
ADD CONSTRAINT web_details_transportation_fk
FOREIGN KEY (transfer_unit_id)
REFERENCES web_details_transportation (id)
ON DELETE CASCADE ;