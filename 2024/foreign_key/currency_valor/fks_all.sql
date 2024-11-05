-- ############################################################################ CURRENCY
-- CAMBIAR VALOR A NULL
UPDATE currency_valor
SET id_moneda = NULL
where id_moneda = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM currency_valor
WHERE id_moneda NOT IN (
    SELECT id FROM currency
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM currency_valor
WHERE id_moneda NOT IN (
    SELECT id FROM currency
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE currency_valor
ADD CONSTRAINT currency_fk
FOREIGN KEY (id_moneda)
REFERENCES currency (id)
ON DELETE CASCADE;

-- ############################################################################ CURRENCY VALOR
-- CAMBIAR VALOR A NULL
UPDATE currency_valor
SET id_moneda_valor = NULL
where id_moneda_valor = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM currency_valor
WHERE id_moneda_valor NOT IN (
    SELECT id FROM currency
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM currency_valor
WHERE id_moneda_valor NOT IN (
    SELECT id FROM currency
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE currency_valor
ADD CONSTRAINT currency_valor_fk
FOREIGN KEY (id_moneda_valor)
REFERENCES currency (id)
ON DELETE CASCADE;