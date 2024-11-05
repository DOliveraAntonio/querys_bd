-- CAMBIAR VALOR A NULL
UPDATE reservations_details_discs
SET id_servicio = NULL
where id_servicio = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_discs
WHERE id_servicio NOT IN (
    SELECT id FROM tickets_rate
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_discs
WHERE id_servicio NOT IN (
    SELECT id FROM tickets_rate
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_discs
ADD CONSTRAINT reservations_discs__services_fk
FOREIGN KEY (id_servicio)
REFERENCES tickets_rate (id)
ON DELETE SET NULL ;