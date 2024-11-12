-- ############################################################################ SALES PLACE
-- CAMBIAR VALOR A NULL
UPDATE web_landings
SET type_landing_id = NULL
where type_landing_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_landings
WHERE type_landing_id NOT IN (
    SELECT id FROM sales_place
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_landings
WHERE type_landing_id NOT IN (
    SELECT id FROM sales_place
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_landings
ADD CONSTRAINT sales_place_fk
FOREIGN KEY (type_landing_id)
REFERENCES sales_place (id)
ON DELETE CASCADE ;

-- ############################################################################ SEASON
-- CAMBIAR VALOR A NULL
UPDATE web_landings
SET season_id = NULL
where season_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_landings
WHERE season_id NOT IN (
    SELECT id FROM transportation_season
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_landings
WHERE season_id NOT IN (
    SELECT id FROM transportation_season
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_landings
ADD CONSTRAINT transportation_season_fk
FOREIGN KEY (season_id)
REFERENCES transportation_season (id)
ON DELETE CASCADE ;

-- ############################################################################ GROUP
-- CAMBIAR VALOR A NULL
UPDATE web_landings
SET group_id = NULL
where group_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_landings
WHERE group_id NOT IN (
    SELECT id FROM sales_location
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_landings
WHERE group_id NOT IN (
    SELECT id FROM sales_location
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_landings
ADD CONSTRAINT sales_location_fk
FOREIGN KEY (group_id)
REFERENCES sales_location (id)
ON DELETE CASCADE ;