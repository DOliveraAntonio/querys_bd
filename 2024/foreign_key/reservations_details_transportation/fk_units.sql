-- LLEGADAS
-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_transportation
WHERE id_unidad_llegada NOT IN (
    SELECT id FROM transfer_units
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_transportation
WHERE id_unidad_llegada NOT IN (
    SELECT id FROM transfer_units
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_transportation
ADD CONSTRAINT reservations_transportation_llegada__promo_code_fk
FOREIGN KEY (id_unidad_llegada)
REFERENCES transfer_units (id)
ON DELETE SET NULL ;

-- SALIDAS
-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_details_transportation
WHERE id_unidad_salida NOT IN (
    SELECT id FROM transfer_units
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_transportation
WHERE id_unidad_salida NOT IN (
    SELECT id FROM transfer_units
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_transportation
ADD CONSTRAINT reservations_transportation_salida__promo_code_fk
FOREIGN KEY (id_unidad_salida)
REFERENCES transfer_units (id)
ON DELETE SET NULL ;