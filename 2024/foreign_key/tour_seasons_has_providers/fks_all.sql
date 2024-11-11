-- ############################################################################ SEASON
-- CAMBIAR VALOR A NULL
UPDATE tour_seasons_has_providers
SET tour_season_id = NULL
where tour_season_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM tour_seasons_has_providers
WHERE tour_season_id NOT IN (
    SELECT id FROM tour_season
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tour_seasons_has_providers
WHERE tour_season_id NOT IN (
    SELECT id FROM tour_season
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tour_seasons_has_providers
ADD CONSTRAINT tour_season_fk
FOREIGN KEY (tour_season_id)
REFERENCES tour_season (id)
ON DELETE CASCADE ;

-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE tour_seasons_has_providers
SET provider_id = NULL
where provider_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM tour_seasons_has_providers
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tour_seasons_has_providers
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tour_seasons_has_providers
ADD CONSTRAINT provider_fk
FOREIGN KEY (provider_id)
REFERENCES provider (id)
ON DELETE CASCADE ;