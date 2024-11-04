-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_transportation
WHERE id_transportation_rates NOT IN (
    SELECT id FROM transportation_rates
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_transportation
WHERE id_transportation_rates NOT IN (
    SELECT id FROM transportation_rates
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_transportation
ADD CONSTRAINT reservations_transportation__rates_fk
FOREIGN KEY (id_transportation_rates)
REFERENCES transportation_rates (id)
ON DELETE CASCADE ;