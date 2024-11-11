-- ############################################################################ RESERVATIONS
-- CAMBIAR VALOR A NULL
UPDATE web_credit_card
SET reservation_id = NULL
where reservation_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_credit_card
WHERE reservation_id NOT IN (
    SELECT id FROM reservations
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_credit_card
WHERE reservation_id NOT IN (
    SELECT id FROM reservations
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_credit_card
ADD CONSTRAINT reservations_fk
FOREIGN KEY (reservation_id)
REFERENCES reservations (id)
ON DELETE CASCADE ;