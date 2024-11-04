-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_tour
WHERE id_proveedor NOT IN (
    SELECT id FROM provider
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tour
WHERE id_proveedor NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tour
ADD CONSTRAINT reservations_tour__providers_fk
FOREIGN KEY (id_proveedor)
REFERENCES provider (id)
ON DELETE SET NULL ;