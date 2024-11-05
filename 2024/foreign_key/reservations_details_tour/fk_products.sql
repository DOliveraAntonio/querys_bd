-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tour
SET id_productos = NULL
where id_productos = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_tour
WHERE id_productos NOT IN (
    SELECT id FROM products
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tour
WHERE id_productos NOT IN (
    SELECT id FROM products
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tour
ADD CONSTRAINT reservations_tour__products_fk
FOREIGN KEY (id_productos)
REFERENCES products (id)
ON DELETE SET NULL ;