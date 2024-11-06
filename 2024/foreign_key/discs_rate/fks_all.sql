-- ############################################################################ SUB PRODUCTO
-- CAMBIAR VALOR A NULL
UPDATE discs_rate
SET id_sub_producto = NULL
where id_sub_producto = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM discs_rate
WHERE id_sub_producto NOT IN (
    SELECT id FROM sub_products
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs_rate
WHERE id_sub_producto NOT IN (
    SELECT id FROM sub_products
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs_rate
ADD CONSTRAINT sub_products_fk
FOREIGN KEY (id_sub_producto)
REFERENCES sub_products (id)
ON DELETE SET NULL;

-- ############################################################################ SEASON
-- CAMBIAR VALOR A NULL
UPDATE discs_rate
SET id_dics_season = NULL
where id_dics_season = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM discs_rate
WHERE id_dics_season NOT IN (
    SELECT id FROM discs_season
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs_rate
WHERE id_dics_season NOT IN (
    SELECT id FROM discs_season
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs_rate
ADD CONSTRAINT discs_season_fk
FOREIGN KEY (id_dics_season)
REFERENCES discs_season (id)
ON DELETE SET NULL;

-- ############################################################################ METODO
-- CAMBIAR VALOR A NULL
UPDATE discs_rate
SET id_metodo_producto = NULL
where id_metodo_producto = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM discs_rate
WHERE id_metodo_producto NOT IN (
    SELECT id FROM product_method
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs_rate
WHERE id_metodo_producto NOT IN (
    SELECT id FROM product_method
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs_rate
ADD CONSTRAINT product_method_fk
FOREIGN KEY (id_metodo_producto)
REFERENCES product_method (id)
ON DELETE CASCADE;

-- ############################################################################ SERVICIOS
-- CAMBIAR VALOR A NULL
UPDATE discs_rate
SET id_servicio = NULL
where id_servicio = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM discs_rate
WHERE id_servicio NOT IN (
    SELECT id FROM discs_servicios
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs_rate
WHERE id_servicio NOT IN (
    SELECT id FROM discs_servicios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs_rate
ADD CONSTRAINT discs_servicios_fk
FOREIGN KEY (id_servicio)
REFERENCES discs_servicios (id)
ON DELETE CASCADE;

-- ############################################################################ CURRENCY
-- CAMBIAR VALOR A NULL
UPDATE discs_rate
SET id_currency = NULL
where id_currency = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM discs_rate
WHERE id_currency NOT IN (
    SELECT id FROM currency
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs_rate
WHERE id_currency NOT IN (
    SELECT id FROM currency
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs_rate
ADD CONSTRAINT currency_fk
FOREIGN KEY (id_currency)
REFERENCES currency (id)
ON DELETE SET NULL;
