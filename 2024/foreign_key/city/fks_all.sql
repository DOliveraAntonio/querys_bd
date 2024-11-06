-- ############################################################################ REGION
-- CAMBIAR VALOR A NULL
UPDATE city
SET region_id = NULL
where region_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM city
WHERE region_id NOT IN (
    SELECT id FROM region
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM city
WHERE region_id NOT IN (
    SELECT id FROM region
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE city
ADD CONSTRAINT region_fk
FOREIGN KEY (region_id)
REFERENCES region (id)
ON DELETE CASCADE;