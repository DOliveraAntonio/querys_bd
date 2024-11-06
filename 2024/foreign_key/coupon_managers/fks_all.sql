-- ############################################################################ PRIMARY KEY
alter table coupon_managers
    add constraint coupon_managers_pk
        primary key (id);

-- ############################################################################ MODFICACIONES DE VALOREs
alter table coupon_managers
    alter column created_by drop not null;

alter table coupon_managers
    alter column created_by set default null;

alter table coupon_managers
    alter column updated_by drop not null;

alter table coupon_managers
    alter column updated_by set default null;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE coupon_managers
SET user_id = NULL
where user_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM coupon_managers
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM coupon_managers
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE coupon_managers
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE SET NULL;

-- ############################################################################ USERS CREATED BY
-- CAMBIAR VALOR A NULL
UPDATE coupon_managers
SET created_by = NULL
where created_by = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM coupon_managers
WHERE created_by NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM coupon_managers
WHERE created_by NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE coupon_managers
ADD CONSTRAINT created_by_fk
FOREIGN KEY (created_by)
REFERENCES users (id)
ON DELETE SET NULL;

-- ############################################################################ USERS UPDATE BY
-- CAMBIAR VALOR A NULL
UPDATE coupon_managers
SET updated_by = NULL
where updated_by = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM coupon_managers
WHERE updated_by NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM coupon_managers
WHERE updated_by NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE coupon_managers
ADD CONSTRAINT updated_by_fk
FOREIGN KEY (updated_by)
REFERENCES users (id)
ON DELETE SET NULL;