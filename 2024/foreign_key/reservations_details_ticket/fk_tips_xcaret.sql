-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tickets
SET tips_id = NULL
where tips_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_tickets
WHERE tips_id NOT IN (
    SELECT id FROM tips_xcaret
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tickets
WHERE tips_id NOT IN (
    SELECT id FROM tips_xcaret
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tickets
ADD CONSTRAINT reservations_ticket__tips_xcaret_fk
FOREIGN KEY (tips_id)
REFERENCES tips_xcaret (id)
ON DELETE SET NULL;