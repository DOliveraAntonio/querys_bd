-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tour
SET id_servicio = NULL
where id_servicio = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_tour
WHERE id_servicio NOT IN (
    SELECT id FROM tour_rate
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tour
WHERE id_servicio NOT IN (
    SELECT id FROM tour_rate
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tour
ADD CONSTRAINT reservations_tour__services_fk
FOREIGN KEY (id_servicio)
REFERENCES tour_rate (id)
ON DELETE SET NULL ;