-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tour
SET id_promo_code = NULL
where id_promo_code = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_tour
WHERE id_promo_code NOT IN (
    SELECT id FROM promo_code
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tour
WHERE id_promo_code NOT IN (
    SELECT id FROM promo_code
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tour
ADD CONSTRAINT reservations_tour__promo_code_fk
FOREIGN KEY (id_promo_code)
REFERENCES promo_code (id)
ON DELETE SET NULL ;