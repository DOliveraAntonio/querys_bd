-- ############################################################################ ACCOUNT LEVEL
-- CAMBIAR VALOR A NULL
UPDATE "accountLevel"
SET account_id = NULL
where account_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM "accountLevel"
WHERE account_id NOT IN (
    SELECT id FROM account
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM "accountLevel"
WHERE account_id NOT IN (
    SELECT id FROM account
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE "accountLevel"
ADD CONSTRAINT account_fk
FOREIGN KEY (account_id)
REFERENCES account (id)
ON DELETE SET NULL ;