-- ############################################################################ CITY
-- CAMBIAR VALOR A NULL
UPDATE provider
SET city_id = NULL
where city_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM provider
WHERE city_id NOT IN (
    SELECT id FROM city
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM provider
WHERE city_id NOT IN (
    SELECT id FROM city
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE provider
ADD CONSTRAINT city_fk
FOREIGN KEY (city_id)
REFERENCES city (id)
ON DELETE CASCADE ;

-- ############################################################################ REGION
-- CAMBIAR VALOR A NULL
UPDATE provider
SET estado_id = NULL
where estado_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM provider
WHERE estado_id NOT IN (
    SELECT id FROM region
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM provider
WHERE estado_id NOT IN (
    SELECT id FROM region
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE provider
ADD CONSTRAINT region_fk
FOREIGN KEY (estado_id)
REFERENCES region (id)
ON DELETE CASCADE ;

-- ############################################################################ COUNTRY
-- CAMBIAR VALOR A NULL
UPDATE provider
SET pais_id = NULL
where pais_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM provider
WHERE pais_id NOT IN (
    SELECT id FROM country
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM provider
WHERE pais_id NOT IN (
    SELECT id FROM country
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE provider
ADD CONSTRAINT country_fk
FOREIGN KEY (pais_id)
REFERENCES country (id)
ON DELETE CASCADE ;