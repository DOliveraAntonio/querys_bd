-- ############################################################################ RESERVATIONS
-- CAMBIAR VALOR A NULL
UPDATE transportacion_grupos
SET id_reserva = NULL
where id_reserva = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM transportacion_grupos
WHERE id_reserva NOT IN (
    SELECT id FROM reservations
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM transportacion_grupos
WHERE id_reserva NOT IN (
    SELECT id FROM reservations
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE transportacion_grupos
ADD CONSTRAINT reservations_fk
FOREIGN KEY (id_reserva)
REFERENCES reservations (id)
ON DELETE CASCADE ;