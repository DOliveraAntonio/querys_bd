-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE web_discs
SET user_id = NULL
where user_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_discs
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_discs
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_discs
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ CHANNEL
-- CAMBIAR VALOR A NULL
UPDATE web_discs
SET channel_id = NULL
where channel_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_discs
WHERE channel_id NOT IN (
    SELECT id FROM channel
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_discs
WHERE channel_id NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_discs
ADD CONSTRAINT channel_fk
FOREIGN KEY (channel_id)
REFERENCES channel (id)
ON DELETE CASCADE ;

-- ############################################################################ CITY
-- CAMBIAR VALOR A NULL
UPDATE web_discs
SET city_id = NULL
where city_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_discs
WHERE city_id NOT IN (
    SELECT id FROM city
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_discs
WHERE city_id NOT IN (
    SELECT id FROM city
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_discs
ADD CONSTRAINT city_fk
FOREIGN KEY (city_id)
REFERENCES city (id)
ON DELETE CASCADE ;