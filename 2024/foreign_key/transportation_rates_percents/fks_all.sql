-- ############################################################################ CHANNEL
-- CAMBIAR VALOR A NULL
UPDATE transportation_rates_percents
SET canal_id = NULL
where canal_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM transportation_rates_percents
WHERE canal_id NOT IN (
    SELECT id FROM channel
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM transportation_rates_percents
WHERE canal_id NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE transportation_rates_percents
ADD CONSTRAINT channel_fk
FOREIGN KEY (canal_id)
REFERENCES channel (id)
ON DELETE SET NULL ;

-- ############################################################################ RATES
-- CAMBIAR VALOR A NULL
UPDATE transportation_rates_percents
SET transportation_rates_id = NULL
where transportation_rates_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM transportation_rates_percents
WHERE transportation_rates_id NOT IN (
    SELECT id FROM transportation_rates
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM transportation_rates_percents
WHERE transportation_rates_id NOT IN (
    SELECT id FROM transportation_rates
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE transportation_rates_percents
ADD CONSTRAINT transportation_rates_fk
FOREIGN KEY (transportation_rates_id)
REFERENCES transportation_rates (id)
ON DELETE CASCADE ;