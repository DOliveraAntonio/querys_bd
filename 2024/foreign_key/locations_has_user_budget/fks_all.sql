-- ############################################################################ PRESUPUESTO
-- CAMBIAR VALOR A NULL
UPDATE locations_has_user_budget
SET presupuesto_id = NULL
where presupuesto_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM locations_has_user_budget
WHERE presupuesto_id NOT IN (
    SELECT id FROM budget
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM locations_has_user_budget
WHERE presupuesto_id NOT IN (
    SELECT id FROM budget
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE locations_has_user_budget
ADD CONSTRAINT budget_fk
FOREIGN KEY (presupuesto_id)
REFERENCES budget (id)
ON DELETE CASCADE;

-- ############################################################################ REP
-- CAMBIAR VALOR A NULL
UPDATE locations_has_user_budget
SET rep_id = NULL
where rep_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM locations_has_user_budget
WHERE rep_id NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM locations_has_user_budget
WHERE rep_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE locations_has_user_budget
ADD CONSTRAINT rep_fk
FOREIGN KEY (rep_id)
REFERENCES users (id)
ON DELETE CASCADE;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE locations_has_user_budget
SET user_id = NULL
where user_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM locations_has_user_budget
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM locations_has_user_budget
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE locations_has_user_budget
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE;