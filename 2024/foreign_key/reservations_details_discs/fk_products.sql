-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_discs
WHERE id_productos NOT IN (
    SELECT id FROM products
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_discs
WHERE id_productos NOT IN (
    SELECT id FROM products
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_discs
ADD CONSTRAINT reservations_discs__products_fk
FOREIGN KEY (id_productos)
REFERENCES products (id)
ON DELETE SET NULL ;