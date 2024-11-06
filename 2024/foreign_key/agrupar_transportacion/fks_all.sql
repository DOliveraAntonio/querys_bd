-- ############################################################################ PRIMARY KEY
alter table agrupar_transportacion
    add constraint agrupar_transportacion_id_pk
        primary key (id);

-- ############################################################################ UNIDAD
-- CAMBIAR VALOR A NULL
UPDATE agrupar_transportacion
SET id_unidad_traslado = NULL
where id_unidad_traslado = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM agrupar_transportacion
WHERE id_unidad_traslado NOT IN (
    SELECT id FROM transfer_units
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM agrupar_transportacion
WHERE id_unidad_traslado NOT IN (
    SELECT id FROM transfer_units
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE agrupar_transportacion
ADD CONSTRAINT transfer_units_fk
FOREIGN KEY (id_unidad_traslado)
REFERENCES transfer_units (id)
ON DELETE CASCADE ;

-- ############################################################################ PROVEEDOR
-- CAMBIAR VALOR A NULL
UPDATE agrupar_transportacion
SET id_proveedor = NULL
where id_proveedor = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM agrupar_transportacion
WHERE id_proveedor NOT IN (
    SELECT id FROM provider
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM agrupar_transportacion
WHERE id_proveedor NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE agrupar_transportacion
ADD CONSTRAINT provider_fk
FOREIGN KEY (id_proveedor)
REFERENCES provider (id)
ON DELETE CASCADE ;

-- ############################################################################ MONEDA
-- CAMBIAR VALOR A NULL
UPDATE agrupar_transportacion
SET id_moneda = NULL
where id_moneda = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM agrupar_transportacion
WHERE id_moneda NOT IN (
    SELECT id FROM currency
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM agrupar_transportacion
WHERE id_moneda NOT IN (
    SELECT id FROM currency
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE agrupar_transportacion
ADD CONSTRAINT currency_fk
FOREIGN KEY (id_moneda)
REFERENCES currency (id)
ON DELETE SET NULL ;

-- ############################################################################ TRANSPORTACION TARIFA
-- CAMBIAR VALOR A NULL
UPDATE agrupar_transportacion
SET id_transportation_rates = NULL
where id_transportation_rates = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM agrupar_transportacion
WHERE id_transportation_rates NOT IN (
    SELECT id FROM transportation_rates
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM agrupar_transportacion
WHERE id_transportation_rates NOT IN (
    SELECT id FROM transportation_rates
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE agrupar_transportacion
ADD CONSTRAINT transportation_rates_fk
FOREIGN KEY (id_transportation_rates)
REFERENCES transportation_rates (id)
ON DELETE SET NULL ;

-- ############################################################################ TRANSPORTACION TARIFA PORCENTAJE
-- CAMBIAR VALOR A NULL
UPDATE agrupar_transportacion
SET id_transportation_rates_percent = NULL
where id_transportation_rates_percent = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM agrupar_transportacion
WHERE id_transportation_rates_percent NOT IN (
    SELECT id FROM transportation_rates_percents
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM agrupar_transportacion
WHERE id_transportation_rates_percent NOT IN (
    SELECT id FROM transportation_rates_percents
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE agrupar_transportacion
ADD CONSTRAINT transportation_rates_percents_fk
FOREIGN KEY (id_transportation_rates_percent)
REFERENCES transportation_rates_percents (id)
ON DELETE SET NULL ;