-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_discs
WHERE id_web_promotion_applied NOT IN (
    SELECT id FROM web_promotions
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_discs
WHERE id_web_promotion_applied NOT IN (
    SELECT id FROM web_promotions
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_discs
ADD CONSTRAINT reservations_discs__web_promotion_fk
FOREIGN KEY (id_web_promotion_applied)
REFERENCES web_promotions (id)
ON DELETE SET NULL ;