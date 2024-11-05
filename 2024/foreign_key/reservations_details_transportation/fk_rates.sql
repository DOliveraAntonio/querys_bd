-- CAMBIAR VALOR A NULL
UPDATE reservations_details_transportation
SET id_transportation_rates_percent = NULL
where id_transportation_rates_percent = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_transportation
WHERE id_transportation_rates_percent NOT IN (
    SELECT id FROM transportation_rates_percents
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_transportation
WHERE id_transportation_rates_percent NOT IN (
    SELECT id FROM transportation_rates_percents
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_transportation
ADD CONSTRAINT reservations_transportation__rates_percents_fk
FOREIGN KEY (id_transportation_rates_percent)
REFERENCES transportation_rates_percents (id)
ON DELETE CASCADE ;