-- ############################################################################ PRIMARY KEY
alter table discs_seasons_has_providers
    add constraint discs_seasons_has_providers_pk
        primary key (id);

-- ############################################################################ SEASON
-- CAMBIAR VALOR A NULL
UPDATE discs_seasons_has_providers
SET disc_season_id = NULL
where disc_season_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM discs_seasons_has_providers
WHERE disc_season_id NOT IN (
    SELECT id FROM discs_season
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs_seasons_has_providers
WHERE disc_season_id NOT IN (
    SELECT id FROM discs_season
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs_seasons_has_providers
ADD CONSTRAINT discs_season_fk
FOREIGN KEY (disc_season_id)
REFERENCES discs_season (id)
ON DELETE SET NULL;

-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE discs_seasons_has_providers
SET provider_id = NULL
where provider_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM discs_seasons_has_providers
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs_seasons_has_providers
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs_seasons_has_providers
ADD CONSTRAINT provider_fk
FOREIGN KEY (provider_id)
REFERENCES provider (id)
ON DELETE CASCADE;