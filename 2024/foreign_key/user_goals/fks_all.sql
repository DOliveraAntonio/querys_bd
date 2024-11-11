-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE user_goals
SET user_id = NULL
where user_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM user_goals
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM user_goals
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE user_goals
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ CHANNEL
-- CAMBIAR VALOR A NULL
UPDATE user_goals
SET channel_id = NULL
where channel_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM user_goals
WHERE channel_id NOT IN (
    SELECT id FROM channel
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM user_goals
WHERE channel_id NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE user_goals
ADD CONSTRAINT channel_fk
FOREIGN KEY (channel_id)
REFERENCES channel (id)
ON DELETE CASCADE ;