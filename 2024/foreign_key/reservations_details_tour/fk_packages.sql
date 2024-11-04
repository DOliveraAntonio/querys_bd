-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_tour
WHERE id_paquete NOT IN (
    SELECT id FROM packages_info
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tour
WHERE id_paquete NOT IN (
    SELECT id FROM packages_info
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tour
ADD CONSTRAINT reservations_tour__packages_fk
FOREIGN KEY (id_paquete)
REFERENCES packages_info (id)
ON DELETE SET NULL ;