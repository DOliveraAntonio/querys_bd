-- ############################################################################ SERVICE
-- CAMBIAR VALOR A NULL
UPDATE tour_service_labels
SET tour_service_id = NULL
where tour_service_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM tour_service_labels
WHERE tour_service_id NOT IN (
    SELECT id FROM tour_servicios
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tour_service_labels
WHERE tour_service_id NOT IN (
    SELECT id FROM tour_servicios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tour_service_labels
ADD CONSTRAINT tour_servicios_fk
FOREIGN KEY (tour_service_id)
REFERENCES tour_servicios (id)
ON DELETE CASCADE ;

-- ############################################################################ LABEL
-- CAMBIAR VALOR A NULL
UPDATE tour_service_labels
SET label_id = NULL
where label_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM tour_service_labels
WHERE label_id NOT IN (
    SELECT id FROM labels
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tour_service_labels
WHERE label_id NOT IN (
    SELECT id FROM labels
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tour_service_labels
ADD CONSTRAINT labels_fk
FOREIGN KEY (label_id)
REFERENCES labels (id)
ON DELETE CASCADE ;