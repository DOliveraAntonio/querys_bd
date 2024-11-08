-- ############################################################################ SEASON
-- CAMBIAR VALOR A NULL
UPDATE tickets_rate
SET id_tickets_season = NULL
where id_tickets_season = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM tickets_rate
WHERE id_tickets_season NOT IN (
    SELECT id FROM tickets_season
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tickets_rate
WHERE id_tickets_season NOT IN (
    SELECT id FROM tickets_season
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tickets_rate
ADD CONSTRAINT tickets_season_fk
FOREIGN KEY (id_tickets_season)
REFERENCES tickets_season (id)
ON DELETE CASCADE;

-- ############################################################################ SERVICE
-- CAMBIAR VALOR A NULL
UPDATE tickets_rate
SET id_ticket_servicio = NULL
where id_ticket_servicio = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM tickets_rate
WHERE id_ticket_servicio NOT IN (
    SELECT id FROM tickets_servicios
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tickets_rate
WHERE id_ticket_servicio NOT IN (
    SELECT id FROM tickets_servicios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tickets_rate
ADD CONSTRAINT tickets_servicios_fk
FOREIGN KEY (id_ticket_servicio)
REFERENCES tickets_servicios (id)
ON DELETE SET CASCADE ;

-- ############################################################################ CURRENCY
-- CAMBIAR VALOR A NULL
UPDATE tickets_rate
SET id_currency = NULL
where id_currency = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM tickets_rate
WHERE id_currency NOT IN (
    SELECT id FROM currency
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tickets_rate
WHERE id_currency NOT IN (
    SELECT id FROM currency
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tickets_rate
ADD CONSTRAINT currency_fk
FOREIGN KEY (id_currency)
REFERENCES currency (id)
ON DELETE SET NULL ;