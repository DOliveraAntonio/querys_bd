-- ############################################################################ DISPONIBILIDAD SERVICIOS
-- CAMBIAR VALOR A NULL
UPDATE additional_pax_reservation
SET id_reserva = NULL
where id_reserva = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM additional_pax_reservation
WHERE id_reserva NOT IN (
    SELECT id FROM reservations
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM additional_pax_reservation
WHERE id_reserva NOT IN (
    SELECT id FROM reservations
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE additional_pax_reservation
ADD CONSTRAINT reservations_fk
FOREIGN KEY (id_reserva)
REFERENCES reservations (id)
ON DELETE CASCADE ;