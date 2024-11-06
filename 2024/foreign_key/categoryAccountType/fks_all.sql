-- ############################################################################ CATEGORY ACCOUNT
-- CAMBIAR VALOR A NULL
UPDATE "categoryAccountType"
SET "categoryAccount_id" = NULL
where "categoryAccount_id" = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM "categoryAccountType"
WHERE "categoryAccount_id" NOT IN (
    SELECT id FROM "categoryAccount"
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM "categoryAccountType"
WHERE "categoryAccount_id" NOT IN (
    SELECT id FROM "categoryAccount"
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE "categoryAccountType"
ADD CONSTRAINT category_account_fk
FOREIGN KEY ("categoryAccount_id")
REFERENCES "categoryAccount" (id)
ON DELETE SET NULL ;

-- ############################################################################ CATEGORY TYPE
-- CAMBIAR VALOR A NULL
UPDATE "categoryAccountType"
SET "typeCategory_id" = NULL
where "typeCategory_id" = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM "categoryAccountType"
WHERE "typeCategory_id" NOT IN (
    SELECT id FROM "typeCategory"
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM "categoryAccountType"
WHERE "typeCategory_id" NOT IN (
    SELECT id FROM "typeCategory"
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE "categoryAccountType"
ADD CONSTRAINT category_type_fk
FOREIGN KEY ("typeCategory_id")
REFERENCES "typeCategory" (id)
ON DELETE SET NULL ;