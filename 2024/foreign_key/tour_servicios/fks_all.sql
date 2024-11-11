-- ############################################################################ CHANGE COLUMN
alter table tour_servicios
    alter column "user" type integer using "user"::integer;

-- ############################################################################ TOUR
-- CAMBIAR VALOR A NULL
UPDATE tour_servicios
SET "user" = NULL
where "user" = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM tour_servicios
WHERE "user" NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tour_servicios
WHERE "user" NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tour_servicios
ADD CONSTRAINT users_fk
FOREIGN KEY ("user")
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE tour_servicios
SET "user" = NULL
where "user" = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM tour_servicios
WHERE "user" NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tour_servicios
WHERE "user" NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tour_servicios
ADD CONSTRAINT users_fk
FOREIGN KEY ("user")
REFERENCES users (id)
ON DELETE CASCADE ;