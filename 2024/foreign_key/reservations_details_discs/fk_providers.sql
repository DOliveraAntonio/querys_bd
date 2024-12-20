-- CAMBIAR VALOR A NULL
UPDATE reservations_details_discs
SET id_proveedor = NULL
where id_proveedor = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_discs
WHERE id_proveedor NOT IN (
    SELECT id FROM provider
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_discs
WHERE id_proveedor NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_discs
ADD CONSTRAINT reservations_discs__providers_fk
FOREIGN KEY (id_proveedor)
REFERENCES provider (id)
ON DELETE SET NULL ;