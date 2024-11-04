-- Cambiamos el valor de las reservas que en id_promo_code tengan 0 y lo cambiamos a null
UPDATE reservations
SET id_promo_code = NULL
where id_promo_code = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT count(*) FROM reservations
WHERE id_promo_code NOT IN (
    SELECT id FROM promo_code
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations
WHERE id_promo_code NOT IN (
    SELECT id FROM promo_code
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations
ADD CONSTRAINT reservations__promo_code_fk
FOREIGN KEY (id_promo_code)
REFERENCES promo_code (id)
ON DELETE CASCADE ;