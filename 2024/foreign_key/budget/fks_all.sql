-- ############################################################################ SALES PLACE
-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM budget
WHERE sales_place_id NOT IN (
    SELECT id FROM sales_place
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM budget
WHERE sales_place_id NOT IN (
    SELECT id FROM sales_place
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE budget
ADD CONSTRAINT sales_place_fk
FOREIGN KEY (sales_place_id)
REFERENCES sales_place (id)
ON DELETE CASCADE;

-- ############################################################################ SALES LOCATION
-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM budget
WHERE sales_location_id NOT IN (
    SELECT id FROM sales_location
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM budget
WHERE sales_location_id NOT IN (
    SELECT id FROM sales_location
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE budget
ADD CONSTRAINT sales_location_fk
FOREIGN KEY (sales_location_id)
REFERENCES sales_location (id)
ON DELETE CASCADE;

-- ############################################################################ CANAL
-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM budget
WHERE canal_id NOT IN (
    SELECT id FROM channel
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM budget
WHERE canal_id NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE budget
ADD CONSTRAINT channel_fk
FOREIGN KEY (canal_id)
REFERENCES channel (id)
ON DELETE CASCADE;

-- ############################################################################ HOTEL
-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM budget
WHERE hotel_id NOT IN (
    SELECT id FROM destinatios
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM budget
WHERE hotel_id NOT IN (
    SELECT id FROM destinatios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE budget
ADD CONSTRAINT destinations_fk
FOREIGN KEY (hotel_id)
REFERENCES destinatios (id)
ON DELETE CASCADE;