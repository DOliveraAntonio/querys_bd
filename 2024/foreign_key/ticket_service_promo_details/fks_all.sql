-- ############################################################################ SERVICES
-- CAMBIAR VALOR A NULL
UPDATE ticket_service_promo_details
SET ticket_service_id = NULL
where ticket_service_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM ticket_service_promo_details
WHERE ticket_service_id NOT IN (
    SELECT id FROM tickets_servicios
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM ticket_service_promo_details
WHERE ticket_service_id NOT IN (
    SELECT id FROM tickets_servicios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE ticket_service_promo_details
ADD CONSTRAINT tickets_servicios_fk
FOREIGN KEY (ticket_service_id)
REFERENCES tickets_servicios (id)
ON DELETE CASCADE ;