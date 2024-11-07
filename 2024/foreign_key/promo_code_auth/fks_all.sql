-- ############################################################################ CHANGE COLUMN
alter table promo_code_auth
    alter column generated_by drop not null;

alter table promo_code_auth
    alter column generated_by drop default;

-- ############################################################################ PROMO CODE
-- CAMBIAR VALOR A NULL
UPDATE promo_code_auth
SET id_promo_code = NULL
where id_promo_code = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM promo_code_auth
WHERE id_promo_code NOT IN (
    SELECT id FROM promo_code
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM promo_code_auth
WHERE id_promo_code NOT IN (
    SELECT id FROM promo_code
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE promo_code_auth
ADD CONSTRAINT promo_code_fk
FOREIGN KEY (id_promo_code)
REFERENCES promo_code (id)
ON DELETE CASCADE ;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE promo_code_auth
SET id_user_authorization = NULL
where id_user_authorization = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM promo_code_auth
WHERE id_user_authorization NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM promo_code_auth
WHERE id_user_authorization NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE promo_code_auth
ADD CONSTRAINT users_fk
FOREIGN KEY (id_user_authorization)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ GENERATED USERS
-- CAMBIAR VALOR A NULL
UPDATE promo_code_auth
SET generated_by = NULL
where generated_by = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM promo_code_auth
WHERE generated_by NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM promo_code_auth
WHERE generated_by NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE promo_code_auth
ADD CONSTRAINT generated_by_fk
FOREIGN KEY (generated_by)
REFERENCES users (id)
ON DELETE SET NULL ;