-- ############################################################################ RATES PERCENT
-- CAMBIAR VALOR A NULL
UPDATE transportation_percent_users
SET transportation_rates_percent_id = NULL
where transportation_rates_percent_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM transportation_percent_users
WHERE transportation_rates_percent_id NOT IN (
    SELECT id FROM transportation_rates_percents
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM transportation_percent_users
WHERE transportation_rates_percent_id NOT IN (
    SELECT id FROM transportation_rates_percents
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE transportation_percent_users
ADD CONSTRAINT transportation_rates_percents_fk
FOREIGN KEY (transportation_rates_percent_id)
REFERENCES transportation_rates_percents (id)
ON DELETE CASCADE ;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE transportation_percent_users
SET user_id = NULL
where user_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM transportation_percent_users
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM transportation_percent_users
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE transportation_percent_users
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;