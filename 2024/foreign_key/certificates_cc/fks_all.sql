-- ############################################################################ RESERVATIONS
-- CAMBIAR VALOR A NULL
UPDATE certificates_cc
SET reservation_id = NULL
where reservation_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM certificates_cc
WHERE reservation_id NOT IN (
    SELECT id FROM reservations
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM certificates_cc
WHERE reservation_id NOT IN (
    SELECT id FROM reservations
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE certificates_cc
ADD CONSTRAINT reservations_fk
FOREIGN KEY (reservation_id)
REFERENCES reservations (id)
ON DELETE CASCADE;