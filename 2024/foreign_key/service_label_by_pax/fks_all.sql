-- ############################################################################ LABELS
-- CAMBIAR VALOR A NULL
UPDATE service_label_by_pax
SET label_service_id = NULL
where label_service_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM service_label_by_pax
WHERE label_service_id NOT IN (
    SELECT id FROM labels
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM service_label_by_pax
WHERE label_service_id NOT IN (
    SELECT id FROM labels
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE service_label_by_pax
ADD CONSTRAINT labels_fk
FOREIGN KEY (label_service_id)
REFERENCES labels (id)
ON DELETE CASCADE ;