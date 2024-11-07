-- ############################################################################ LLAVE PRIMARIA
alter table provider_rappels
    add constraint provider_rappels_pk
        primary key (id);

-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE provider_rappels
SET provider_id = NULL
where provider_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM provider_rappels
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM provider_rappels
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE provider_rappels
ADD CONSTRAINT provider_fk
FOREIGN KEY (provider_id)
REFERENCES provider (id)
ON DELETE CASCADE ;

-- ############################################################################ CURRENCY
-- CAMBIAR VALOR A NULL
UPDATE provider_rappels
SET currency_id = NULL
where currency_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM provider_rappels
WHERE currency_id NOT IN (
    SELECT id FROM currency
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM provider_rappels
WHERE currency_id NOT IN (
    SELECT id FROM currency
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE provider_rappels
ADD CONSTRAINT currency_fk
FOREIGN KEY (currency_id)
REFERENCES currency (id)
ON DELETE SET NULL ;