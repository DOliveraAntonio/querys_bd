-- ############################################################################ SEASON
-- CAMBIAR VALOR A NULL
UPDATE tour_rate
SET id_tour_season = NULL
where id_tour_season = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM tour_rate
WHERE id_tour_season NOT IN (
    SELECT id FROM tour_season
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tour_rate
WHERE id_tour_season NOT IN (
    SELECT id FROM tour_season
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tour_rate
ADD CONSTRAINT tour_season_fk
FOREIGN KEY (id_tour_season)
REFERENCES tour_season (id)
ON DELETE CASCADE ;

-- ############################################################################ SERVICE
-- CAMBIAR VALOR A NULL
UPDATE tour_rate
SET id_tour_servicio = NULL
where id_tour_servicio = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM tour_rate
WHERE id_tour_servicio NOT IN (
    SELECT id FROM tour_servicios
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tour_rate
WHERE id_tour_servicio NOT IN (
    SELECT id FROM tour_servicios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tour_rate
ADD CONSTRAINT tour_servicios_fk
FOREIGN KEY (id_tour_servicio)
REFERENCES tour_servicios (id)
ON DELETE CASCADE ;

-- ############################################################################ CURRENCY
-- CAMBIAR VALOR A NULL
UPDATE tour_rate
SET id_currency = NULL
where id_currency = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM tour_rate
WHERE id_currency NOT IN (
    SELECT id FROM currency
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tour_rate
WHERE id_currency NOT IN (
    SELECT id FROM currency
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tour_rate
ADD CONSTRAINT currency_fk
FOREIGN KEY (id_currency)
REFERENCES currency (id)
ON DELETE CASCADE ;