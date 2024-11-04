-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_tour
WHERE id_sub_producto NOT IN (
    SELECT id FROM sub_products
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tour
WHERE id_sub_producto NOT IN (
    SELECT id FROM sub_products
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tour
ADD CONSTRAINT reservations_tour__sub_products_fk
FOREIGN KEY (id_sub_producto)
REFERENCES sub_products (id)
ON DELETE SET NULL ;