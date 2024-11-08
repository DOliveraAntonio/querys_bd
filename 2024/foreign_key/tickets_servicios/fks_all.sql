-- ############################################################################ CHANGE COLUMN
alter table tickets_servicios
    alter column "user" type integer using "user"::integer;

-- ############################################################################ TICKETS
-- CAMBIAR VALOR A NULL
UPDATE tickets_servicios
SET id_ticket = NULL
where id_ticket = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM tickets_servicios
WHERE id_ticket NOT IN (
    SELECT id FROM tickets
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tickets_servicios
WHERE id_ticket NOT IN (
    SELECT id FROM tickets
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tickets_servicios
ADD CONSTRAINT tickets_fk
FOREIGN KEY (id_ticket)
REFERENCES tickets (id)
ON DELETE SET NULL ;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE tickets_servicios
SET "user" = NULL
where "user" = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM tickets_servicios
WHERE "user" NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tickets_servicios
WHERE "user" NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tickets_servicios
ADD CONSTRAINT users_fk
FOREIGN KEY ("user")
REFERENCES users (id)
ON DELETE SET NULL ;