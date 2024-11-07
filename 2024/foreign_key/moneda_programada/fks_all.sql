-- ############################################################################ CURRENCY VALOR
-- CAMBIAR VALOR A NULL
UPDATE moneda_programada
SET id_moneda_activa = NULL
where id_moneda_activa = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM moneda_programada
WHERE id_moneda_activa NOT IN (
    SELECT id FROM currency_valor
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM moneda_programada
WHERE id_moneda_activa NOT IN (
    SELECT id FROM currency_valor
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE moneda_programada
ADD CONSTRAINT currency_valor_fk
FOREIGN KEY (id_moneda_activa)
REFERENCES currency_valor (id)
ON DELETE CASCADE ;

-- ############################################################################ MONEDA
-- CAMBIAR VALOR A NULL
UPDATE moneda_programada
SET id_moneda = NULL
where id_moneda = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM moneda_programada
WHERE id_moneda NOT IN (
    SELECT id FROM currency
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM moneda_programada
WHERE id_moneda NOT IN (
    SELECT id FROM currency
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE moneda_programada
ADD CONSTRAINT currency_fk
FOREIGN KEY (id_moneda)
REFERENCES currency (id)
ON DELETE CASCADE ;

-- ############################################################################ MONEDA VALOR
-- CAMBIAR VALOR A NULL
UPDATE moneda_programada
SET id_moneda_valor = NULL
where id_moneda_valor = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM moneda_programada
WHERE id_moneda_valor NOT IN (
    SELECT id FROM currency
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM moneda_programada
WHERE id_moneda_valor NOT IN (
    SELECT id FROM currency
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE moneda_programada
ADD CONSTRAINT currency_2_fk
FOREIGN KEY (id_moneda_valor)
REFERENCES currency (id)
ON DELETE CASCADE ;