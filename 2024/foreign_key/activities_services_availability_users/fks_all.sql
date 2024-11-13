-- ############################################################################ DISPONIBILIDAD SERVICIOS
-- CAMBIAR VALOR A NULL
UPDATE activities_services_availability_users
SET activities_service_id = NULL
where activities_service_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM activities_services_availability_users
WHERE activities_service_id NOT IN (
    SELECT id FROM tickets_servicios
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM activities_services_availability_users
WHERE activities_service_id NOT IN (
    SELECT id FROM tickets_servicios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE activities_services_availability_users
ADD CONSTRAINT tickets_servicios_fk
FOREIGN KEY (activities_service_id)
REFERENCES tickets_servicios (id)
ON DELETE CASCADE ;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE activities_services_availability_users
SET user_id = NULL
where user_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM activities_services_availability_users
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM activities_services_availability_users
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE activities_services_availability_users
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;