-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_tour
WHERE id_promo_code_auth NOT IN (
    SELECT id FROM promo_code_auth
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tour
WHERE id_promo_code_auth NOT IN (
    SELECT id FROM promo_code_auth
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tour
ADD CONSTRAINT reservations_tour__promo_code_auth_fk
FOREIGN KEY (id_promo_code_auth)
REFERENCES promo_code_auth (id)
ON DELETE SET NULL ;