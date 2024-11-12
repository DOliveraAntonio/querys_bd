-- ############################################################################ SCHEDULES
-- CAMBIAR VALOR A NULL
UPDATE web_park_services_assign_schedules
SET id_schedule = NULL
where id_schedule = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_park_services_assign_schedules
WHERE id_schedule NOT IN (
    SELECT id FROM web_park_services_schedules
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_park_services_assign_schedules
WHERE id_schedule NOT IN (
    SELECT id FROM web_park_services_schedules
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_park_services_assign_schedules
ADD CONSTRAINT web_park_services_schedules_fk
FOREIGN KEY (id_schedule)
REFERENCES web_park_services_schedules (id)
ON DELETE CASCADE ;

-- ############################################################################ DESTINATIOS
-- CAMBIAR VALOR A NULL
UPDATE web_park_services_assign_schedules
SET id_hotel = NULL
where id_hotel = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_park_services_assign_schedules
WHERE id_hotel NOT IN (
    SELECT id FROM destinatios
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_park_services_assign_schedules
WHERE id_hotel NOT IN (
    SELECT id FROM destinatios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_park_services_assign_schedules
ADD CONSTRAINT destinatios_fk
FOREIGN KEY (id_hotel)
REFERENCES destinatios (id)
ON DELETE SET NULL ;