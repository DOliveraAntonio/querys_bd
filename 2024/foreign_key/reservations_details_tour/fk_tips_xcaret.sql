-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_tour
WHERE tips_id NOT IN (
    SELECT id FROM tips_xcaret
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tour
WHERE tips_id NOT IN (
    SELECT id FROM tips_xcaret
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tour
ADD CONSTRAINT reservations_tour__tips_xcaret_fk
FOREIGN KEY (tips_id)
REFERENCES tips_xcaret (id)
ON DELETE SET NULL;