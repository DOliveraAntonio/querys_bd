-- ############################################################################ CIUDAD
-- CAMBIAR VALOR A NULL
UPDATE agency
SET city_id = NULL
where city_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM agency
WHERE city_id NOT IN (
    SELECT id FROM city
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM agency
WHERE city_id NOT IN (
    SELECT id FROM city
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE agency
ADD CONSTRAINT city_fk
FOREIGN KEY (city_id)
REFERENCES city (id)
ON DELETE SET NULL ;


-- ############################################################################ PAIS
-- CAMBIAR VALOR A NULL
UPDATE agency
SET pais_id = NULL
where pais_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM agency
WHERE pais_id NOT IN (
    SELECT id FROM country
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM agency
WHERE pais_id NOT IN (
    SELECT id FROM country
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE agency
ADD CONSTRAINT country_fk
FOREIGN KEY (pais_id)
REFERENCES country (id)
ON DELETE SET NULL ;