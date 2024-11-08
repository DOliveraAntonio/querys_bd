-- ############################################################################ CHANGE COLUMN
alter table ticket_seasons_has_providers
    alter column ticket_season_id drop not null;

alter table ticket_seasons_has_providers
    alter column ticket_season_id drop default;

alter table ticket_seasons_has_providers
    alter column provider_id drop not null;

alter table ticket_seasons_has_providers
    alter column provider_id drop default;

-- ############################################################################ SEASON
-- CAMBIAR VALOR A NULL
UPDATE ticket_seasons_has_providers
SET ticket_season_id = NULL
where ticket_season_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM ticket_seasons_has_providers
WHERE ticket_season_id NOT IN (
    SELECT id FROM tickets_season
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM ticket_seasons_has_providers
WHERE ticket_season_id NOT IN (
    SELECT id FROM tickets_season
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE ticket_seasons_has_providers
ADD CONSTRAINT tickets_season_fk
FOREIGN KEY (ticket_season_id)
REFERENCES tickets_season (id)
ON DELETE CASCADE ;

-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE ticket_seasons_has_providers
SET provider_id = NULL
where provider_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM ticket_seasons_has_providers
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM ticket_seasons_has_providers
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE ticket_seasons_has_providers
ADD CONSTRAINT provider_fk
FOREIGN KEY (provider_id)
REFERENCES provider (id)
ON DELETE CASCADE ;