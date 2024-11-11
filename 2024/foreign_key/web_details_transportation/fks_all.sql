-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE web_details_transportation
SET id_user = NULL
where id_user = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_details_transportation
WHERE id_user NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_details_transportation
WHERE id_user NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_details_transportation
ADD CONSTRAINT users_fk
FOREIGN KEY (id_user)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ CHANNEL
-- CAMBIAR VALOR A NULL
UPDATE web_details_transportation
SET id_canal = NULL
where id_canal = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_details_transportation
WHERE id_canal NOT IN (
    SELECT id FROM channel
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_details_transportation
WHERE id_canal NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_details_transportation
ADD CONSTRAINT channel_fk
FOREIGN KEY (id_canal)
REFERENCES channel (id)
ON DELETE CASCADE ;

-- ############################################################################ UNITS
-- CAMBIAR VALOR A NULL
UPDATE web_details_transportation
SET id_unidad = NULL
where id_unidad = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_details_transportation
WHERE id_unidad NOT IN (
    SELECT id FROM transfer_units
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_details_transportation
WHERE id_unidad NOT IN (
    SELECT id FROM transfer_units
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_details_transportation
ADD CONSTRAINT transfer_units_fk
FOREIGN KEY (id_unidad)
REFERENCES transfer_units (id)
ON DELETE CASCADE ;