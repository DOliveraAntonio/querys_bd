-- ############################################################################ SALES PLACE
-- CAMBIAR VALOR A NULL
UPDATE sales_location
SET sales_place_id = NULL
where sales_place_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM sales_location
WHERE sales_place_id NOT IN (
    SELECT id FROM sales_place
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM sales_location
WHERE sales_place_id NOT IN (
    SELECT id FROM sales_place
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE sales_location
ADD CONSTRAINT sales_place_fk
FOREIGN KEY (sales_place_id)
REFERENCES sales_place (id)
ON DELETE CASCADE ;