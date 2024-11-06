-- ############################################################################ PROVIDERS
-- CAMBIAR VALOR A NULL
UPDATE discs
SET provider_id = NULL
where provider_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM discs
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs
ADD CONSTRAINT provider_fk
FOREIGN KEY (provider_id)
REFERENCES provider (id)
ON DELETE CASCADE;

-- ############################################################################ COUNTRY
-- CAMBIAR VALOR A NULL
UPDATE discs
SET pais_id = NULL
where pais_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM discs
WHERE pais_id NOT IN (
    SELECT id FROM country
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs
WHERE pais_id NOT IN (
    SELECT id FROM country
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs
ADD CONSTRAINT country_fk
FOREIGN KEY (pais_id)
REFERENCES country (id)
ON DELETE SET NULL;

-- ############################################################################ REGION
-- CAMBIAR VALOR A NULL
UPDATE discs
SET estado_id = NULL
where estado_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM discs
WHERE estado_id NOT IN (
    SELECT id FROM region
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs
WHERE estado_id NOT IN (
    SELECT id FROM region
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs
ADD CONSTRAINT region_fk
FOREIGN KEY (estado_id)
REFERENCES region (id)
ON DELETE SET NULL;

-- ############################################################################ CITY
-- CAMBIAR VALOR A NULL
UPDATE discs
SET ciudad_id = NULL
where ciudad_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM discs
WHERE ciudad_id NOT IN (
    SELECT id FROM city
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs
WHERE ciudad_id NOT IN (
    SELECT id FROM city
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs
ADD CONSTRAINT city_fk
FOREIGN KEY (ciudad_id)
REFERENCES city (id)
ON DELETE SET NULL;