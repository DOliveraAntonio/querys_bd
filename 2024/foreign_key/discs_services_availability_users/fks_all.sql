-- ############################################################################ SERVICE
-- CAMBIAR VALOR A NULL
UPDATE discs_services_availability_users
SET discs_service_id = NULL
where discs_service_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM discs_services_availability_users
WHERE discs_service_id NOT IN (
    SELECT id FROM discs_servicios
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs_services_availability_users
WHERE discs_service_id NOT IN (
    SELECT id FROM discs_servicios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs_services_availability_users
ADD CONSTRAINT discs_servicios_fk
FOREIGN KEY (discs_service_id)
REFERENCES discs_servicios (id)
ON DELETE CASCADE;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE discs_services_availability_users
SET user_id = NULL
where user_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM discs_services_availability_users
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs_services_availability_users
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs_services_availability_users
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE SET NULL;