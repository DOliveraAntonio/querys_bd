-- CAMBIAR VALOR A NULL
UPDATE reservations_details_transportation
SET id_promo_code_auth = NULL
where id_promo_code_auth = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_transportation
WHERE id_promo_code_auth NOT IN (
    SELECT id FROM promo_code_auth
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_transportation
WHERE id_promo_code_auth NOT IN (
    SELECT id FROM promo_code_auth
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_transportation
ADD CONSTRAINT reservations_transportation__promo_code_auth_fk
FOREIGN KEY (id_promo_code_auth)
REFERENCES promo_code_auth (id)
ON DELETE SET NULL ;