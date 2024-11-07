-- ############################################################################ PACKAGE INFO
-- CAMBIAR VALOR A NULL
UPDATE packages_services_availability_users
SET packages_service_id = NULL
where packages_service_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM packages_services_availability_users
WHERE packages_service_id NOT IN (
    SELECT id FROM packages_info
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM packages_services_availability_users
WHERE packages_service_id NOT IN (
    SELECT id FROM packages_info
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE packages_services_availability_users
ADD CONSTRAINT packages_info_fk
FOREIGN KEY (packages_service_id)
REFERENCES packages_info (id)
ON DELETE CASCADE ;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE packages_services_availability_users
SET user_id = NULL
where user_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM packages_services_availability_users
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM packages_services_availability_users
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE packages_services_availability_users
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;