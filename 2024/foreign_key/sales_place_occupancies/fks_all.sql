-- ############################################################################ SALES PLACE
-- CAMBIAR VALOR A NULL
UPDATE sales_place_occupancies
SET sales_place_id = NULL
where sales_place_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM sales_place_occupancies
WHERE sales_place_id NOT IN (
    SELECT id FROM sales_place
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM sales_place_occupancies
WHERE sales_place_id NOT IN (
    SELECT id FROM sales_place
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE sales_place_occupancies
ADD CONSTRAINT sales_place_fk
FOREIGN KEY (sales_place_id)
REFERENCES sales_place (id)
ON DELETE CASCADE ;

-- ############################################################################ HOTEL
-- CAMBIAR VALOR A NULL
UPDATE sales_place_occupancies
SET hotel_id = NULL
where hotel_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM sales_place_occupancies
WHERE hotel_id NOT IN (
    SELECT id FROM destinatios
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM sales_place_occupancies
WHERE hotel_id NOT IN (
    SELECT id FROM destinatios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE sales_place_occupancies
ADD CONSTRAINT destinatios_fk
FOREIGN KEY (hotel_id)
REFERENCES destinatios (id)
ON DELETE CASCADE ;

-- ############################################################################ CANAL
-- CAMBIAR VALOR A NULL
UPDATE sales_place_occupancies
SET channel_id = NULL
where channel_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM sales_place_occupancies
WHERE channel_id NOT IN (
    SELECT id FROM channel
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM sales_place_occupancies
WHERE channel_id NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE sales_place_occupancies
ADD CONSTRAINT channel_fk
FOREIGN KEY (channel_id)
REFERENCES channel (id)
ON DELETE CASCADE ;