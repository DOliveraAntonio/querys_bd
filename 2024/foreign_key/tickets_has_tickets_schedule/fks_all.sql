-- ############################################################################ SERVICES
-- CAMBIAR VALOR A NULL
UPDATE tickets_has_tickets_schedule
SET tickets_id = NULL
where tickets_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM tickets_has_tickets_schedule
WHERE tickets_id NOT IN (
    SELECT id FROM tickets_servicios
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tickets_has_tickets_schedule
WHERE tickets_id NOT IN (
    SELECT id FROM tickets_servicios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tickets_has_tickets_schedule
ADD CONSTRAINT tickets_servicios_fk
FOREIGN KEY (tickets_id)
REFERENCES tickets_servicios (id)
ON DELETE SET NULL ;