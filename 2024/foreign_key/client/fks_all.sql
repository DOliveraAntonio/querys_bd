-- ############################################################################ PAIS
-- CAMBIAR VALOR A NULL
UPDATE client
SET country_id = NULL
where country_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM client
WHERE country_id NOT IN (
    SELECT id FROM country
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM client
WHERE country_id NOT IN (
    SELECT id FROM country
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE client
ADD CONSTRAINT country_fk
FOREIGN KEY (country_id)
REFERENCES country (id)
ON DELETE SET NULL;

-- ############################################################################ REGION
-- CAMBIAR VALOR A NULL
UPDATE client
SET estado_id = NULL
where estado_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM client
WHERE estado_id NOT IN (
    SELECT id FROM region
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM client
WHERE estado_id NOT IN (
    SELECT id FROM region
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE client
ADD CONSTRAINT region_fk
FOREIGN KEY (estado_id)
REFERENCES region (id)
ON DELETE SET NULL;

-- ############################################################################ CIUDAD
-- CAMBIAR VALOR A NULL
UPDATE client
SET ciudad_id = NULL
where ciudad_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM client
WHERE ciudad_id NOT IN (
    SELECT id FROM city
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM client
WHERE ciudad_id NOT IN (
    SELECT id FROM city
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE client
ADD CONSTRAINT city_fk
FOREIGN KEY (ciudad_id)
REFERENCES city (id)
ON DELETE SET NULL;