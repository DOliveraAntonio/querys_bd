-- ############################################################################ SERVICE
-- CAMBIAR VALOR A NULL
UPDATE tours_services_availability_users
SET tours_service_id = NULL
where tours_service_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM tours_services_availability_users
WHERE tours_service_id NOT IN (
    SELECT id FROM tour_servicios
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tours_services_availability_users
WHERE tours_service_id NOT IN (
    SELECT id FROM tour_servicios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tours_services_availability_users
ADD CONSTRAINT tour_servicios_fk
FOREIGN KEY (tours_service_id)
REFERENCES tour_servicios (id)
ON DELETE CASCADE ;

-- ############################################################################ USER
-- CAMBIAR VALOR A NULL
UPDATE tours_services_availability_users
SET user_id = NULL
where user_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM tours_services_availability_users
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tours_services_availability_users
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tours_services_availability_users
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;