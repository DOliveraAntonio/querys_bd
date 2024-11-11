-- ############################################################################ ZONE
-- CAMBIAR VALOR A NULL
UPDATE transportation_rates
SET id_zona_transportacion = NULL
where id_zona_transportacion = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM transportation_rates
WHERE id_zona_transportacion NOT IN (
    SELECT id FROM transport_zones
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM transportation_rates
WHERE id_zona_transportacion NOT IN (
    SELECT id FROM transport_zones
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE transportation_rates
ADD CONSTRAINT transport_zones_fk
FOREIGN KEY (id_zona_transportacion)
REFERENCES transport_zones (id)
ON DELETE SET NULL ;

-- ############################################################################ UNIT
-- CAMBIAR VALOR A NULL
UPDATE transportation_rates
SET id_unidad_traslado = NULL
where id_unidad_traslado = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM transportation_rates
WHERE id_unidad_traslado NOT IN (
    SELECT id FROM transfer_units
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM transportation_rates
WHERE id_unidad_traslado NOT IN (
    SELECT id FROM transfer_units
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE transportation_rates
ADD CONSTRAINT transfer_units_fk
FOREIGN KEY (id_unidad_traslado)
REFERENCES transfer_units (id)
ON DELETE CASCADE ;

-- ############################################################################ SEASON
-- CAMBIAR VALOR A NULL
UPDATE transportation_rates
SET id_transportacion_season = NULL
where id_transportacion_season = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM transportation_rates
WHERE id_transportacion_season NOT IN (
    SELECT id FROM transportation_season
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM transportation_rates
WHERE id_transportacion_season NOT IN (
    SELECT id FROM transportation_season
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE transportation_rates
ADD CONSTRAINT transportation_season_fk
FOREIGN KEY (id_transportacion_season)
REFERENCES transportation_season (id)
ON DELETE CASCADE ;


-- ############################################################################ METODO
-- CAMBIAR VALOR A NULL
UPDATE transportation_rates
SET id_metodo_producto = NULL
where id_metodo_producto = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM transportation_rates
WHERE id_metodo_producto NOT IN (
    SELECT id FROM product_method
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM transportation_rates
WHERE id_metodo_producto NOT IN (
    SELECT id FROM product_method
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE transportation_rates
ADD CONSTRAINT product_method_fk
FOREIGN KEY (id_metodo_producto)
REFERENCES product_method (id)
ON DELETE SET NULL ;

-- ############################################################################ CURRENCY
-- CAMBIAR VALOR A NULL
UPDATE transportation_rates
SET id_currency = NULL
where id_currency = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM transportation_rates
WHERE id_currency NOT IN (
    SELECT id FROM currency
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM transportation_rates
WHERE id_currency NOT IN (
    SELECT id FROM currency
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE transportation_rates
ADD CONSTRAINT currency_fk
FOREIGN KEY (id_currency)
REFERENCES currency (id)
ON DELETE SET NULL ;