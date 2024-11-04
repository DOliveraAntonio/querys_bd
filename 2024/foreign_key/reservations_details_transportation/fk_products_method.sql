-- Cambiamos el valor de las reservas que en id_promo_code tengan 0 y lo cambiamos a null
UPDATE reservations_details_transportation
SET id_metodo_producto = NULL
where id_metodo_producto = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_transportation
WHERE id_metodo_producto NOT IN (
    SELECT id FROM product_method
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_transportation
WHERE id_metodo_producto NOT IN (
    SELECT id FROM product_method
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_transportation
ADD CONSTRAINT reservations_transportation__products_method_fk
FOREIGN KEY (id_metodo_producto)
REFERENCES product_method (id)
ON DELETE SET NULL ;