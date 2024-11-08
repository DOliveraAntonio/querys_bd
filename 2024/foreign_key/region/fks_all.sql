-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE region
SET country_id = NULL
where country_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM region
WHERE country_id NOT IN (
    SELECT id FROM country
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM region
WHERE country_id NOT IN (
    SELECT id FROM country
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE region
ADD CONSTRAINT country_fk
FOREIGN KEY (country_id)
REFERENCES country (id)
ON DELETE CASCADE ;