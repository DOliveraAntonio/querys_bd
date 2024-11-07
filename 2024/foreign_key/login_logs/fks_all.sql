-- ############################################################################ CHANGE COLUMNs
alter table login_logs
    alter column user_id drop not null;

alter table login_logs
    alter column user_id drop default;

alter table login_logs
    alter column location_id drop not null;

alter table login_logs
    alter column location_id drop default;

alter table login_logs
    alter column channel_id drop not null;

alter table login_logs
    alter column channel_id drop default;

alter table login_logs
    alter column hotel_id drop not null;

alter table login_logs
    alter column hotel_id drop default;

-- ############################################################################ USERs
-- CAMBIAR VALOR A NULL
UPDATE login_logs
SET user_id = NULL
where user_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM login_logs
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM login_logs
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE login_logs
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ LOCATION
-- CAMBIAR VALOR A NULL
UPDATE login_logs
SET location_id = NULL
where location_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM login_logs
WHERE location_id NOT IN (
    SELECT id FROM sales_place
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM login_logs
WHERE location_id NOT IN (
    SELECT id FROM sales_place
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE login_logs
ADD CONSTRAINT sales_place_fk
FOREIGN KEY (location_id)
REFERENCES sales_place (id)
ON DELETE CASCADE ;

-- ############################################################################ CHANNEL
-- CAMBIAR VALOR A NULL
UPDATE login_logs
SET channel_id = NULL
where channel_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM login_logs
WHERE channel_id NOT IN (
    SELECT id FROM channel
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM login_logs
WHERE channel_id NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE login_logs
ADD CONSTRAINT channel_fk
FOREIGN KEY (channel_id)
REFERENCES channel (id)
ON DELETE CASCADE ;

-- ############################################################################ DETINATIOS
-- CAMBIAR VALOR A NULL
UPDATE login_logs
SET hotel_id = NULL
where hotel_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM login_logs
WHERE hotel_id NOT IN (
    SELECT id FROM destinatios
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM login_logs
WHERE hotel_id NOT IN (
    SELECT id FROM destinatios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE login_logs
ADD CONSTRAINT destinatios_fk
FOREIGN KEY (hotel_id)
REFERENCES destinatios (id)
ON DELETE CASCADE ;