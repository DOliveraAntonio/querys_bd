-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE web_parks
SET user_id = NULL
where user_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_parks
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_parks
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_parks
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ CHANNEL
-- CAMBIAR VALOR A NULL
UPDATE web_parks
SET channel_id = NULL
where channel_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_parks
WHERE channel_id NOT IN (
    SELECT id FROM channel
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_parks
WHERE channel_id NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_parks
ADD CONSTRAINT channel_fk
FOREIGN KEY (channel_id)
REFERENCES channel (id)
ON DELETE CASCADE ;

-- ############################################################################ CITY
-- CAMBIAR VALOR A NULL
UPDATE web_parks
SET city_id = NULL
where city_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_parks
WHERE city_id NOT IN (
    SELECT id FROM city
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_parks
WHERE city_id NOT IN (
    SELECT id FROM city
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_parks
ADD CONSTRAINT city_fk
FOREIGN KEY (city_id)
REFERENCES city (id)
ON DELETE SET NULL ;

-- ############################################################################ PACKAGES
-- CAMBIAR VALOR A NULL
UPDATE web_parks
SET id_package = NULL
where id_package = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_parks
WHERE id_package NOT IN (
    SELECT id FROM packages_info
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_parks
WHERE id_package NOT IN (
    SELECT id FROM packages_info
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_parks
ADD CONSTRAINT packages_info_fk
FOREIGN KEY (id_package)
REFERENCES packages_info (id)
ON DELETE SET NULL ;