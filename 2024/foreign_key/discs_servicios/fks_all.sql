-- ############################################################################ MODIFICAR COLUMNAS
alter table discs_servicios
    add constraint discs_servicios_pk
        primary key (id);

alter table discs_servicios
    alter column "user" type integer using "user"::integer;

-- ############################################################################ DISCOS
-- CAMBIAR VALOR A NULL
UPDATE discs_servicios
SET id_discs = NULL
where id_discs = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM discs_servicios
WHERE id_discs NOT IN (
    SELECT id FROM discs
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs_servicios
WHERE id_discs NOT IN (
    SELECT id FROM discs
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs_servicios
ADD CONSTRAINT discs_fk
FOREIGN KEY (id_discs)
REFERENCES discs (id)
ON DELETE CASCADE ;

-- ############################################################################ USERs
-- CAMBIAR VALOR A NULL
UPDATE discs_servicios
SET "user" = NULL
where "user" = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM discs_servicios
WHERE "user" NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs_servicios
WHERE "user" NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs_servicios
ADD CONSTRAINT users_fk
FOREIGN KEY ("user")
REFERENCES users (id)
ON DELETE SET NULL ;