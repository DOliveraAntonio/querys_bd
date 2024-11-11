-- ############################################################################ SALE LEAGUES
-- CAMBIAR VALOR A NULL
UPDATE user_by_leagues
SET sale_league_id = NULL
where sale_league_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM user_by_leagues
WHERE sale_league_id NOT IN (
    SELECT id FROM sales_leagues
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM user_by_leagues
WHERE sale_league_id NOT IN (
    SELECT id FROM sales_leagues
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE user_by_leagues
ADD CONSTRAINT sales_leagues_fk
FOREIGN KEY (sale_league_id)
REFERENCES sales_leagues (id)
ON DELETE CASCADE ;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE user_by_leagues
SET user_id = NULL
where user_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM user_by_leagues
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM user_by_leagues
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE user_by_leagues
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;