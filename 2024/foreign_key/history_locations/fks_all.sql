-- CAMBIAR VALOR A NULL
UPDATE history_locations
SET id_sales_location = NULL
where id_sales_location = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM history_locations
WHERE id_sales_location NOT IN (
    SELECT id FROM sales_location
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM history_locations
WHERE id_sales_location NOT IN (
    SELECT id FROM sales_location
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE history_locations
ADD CONSTRAINT sales_location_fk
FOREIGN KEY (id_sales_location)
REFERENCES sales_location (id)
ON DELETE SET NULL ;