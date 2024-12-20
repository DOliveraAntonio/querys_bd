-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tickets
SET id_sub_producto = NULL
where id_sub_producto = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_tickets
WHERE id_sub_producto NOT IN (
    SELECT id FROM sub_products
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tickets
WHERE id_sub_producto NOT IN (
    SELECT id FROM sub_products
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tickets
ADD CONSTRAINT reservations_ticket__sub_products_fk
FOREIGN KEY (id_sub_producto)
REFERENCES sub_products (id)
ON DELETE SET NULL ;