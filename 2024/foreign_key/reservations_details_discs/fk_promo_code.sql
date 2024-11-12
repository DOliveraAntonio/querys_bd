-- CAMBIAR VALOR A NULL
UPDATE reservations_details_discs
SET id_promo_code = NULL
where id_promo_code = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_discs
WHERE id_promo_code NOT IN (
    SELECT id FROM promo_code
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_discs
WHERE id_promo_code NOT IN (
    SELECT id FROM promo_code
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_discs
ADD CONSTRAINT reservations_discs__promo_code_fk
FOREIGN KEY (id_promo_code)
REFERENCES promo_code (id)
ON DELETE SET NULL ;