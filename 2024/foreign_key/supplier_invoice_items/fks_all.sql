-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE supplier_invoice_items
SET proveedor_id = NULL
where proveedor_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM supplier_invoice_items
WHERE proveedor_id NOT IN (
    SELECT id FROM provider
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM supplier_invoice_items
WHERE proveedor_id NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE supplier_invoice_items
ADD CONSTRAINT provider_fk
FOREIGN KEY (proveedor_id)
REFERENCES provider (id)
ON DELETE CASCADE ;

-- ############################################################################ SUPPLICER INVOICE
-- CAMBIAR VALOR A NULL
UPDATE supplier_invoice_items
SET supplicer_invoice_id = NULL
where supplicer_invoice_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM supplier_invoice_items
WHERE supplicer_invoice_id NOT IN (
    SELECT id FROM supplier_invoice
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM supplier_invoice_items
WHERE supplicer_invoice_id NOT IN (
    SELECT id FROM supplier_invoice
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE supplier_invoice_items
ADD CONSTRAINT supplier_invoice_fk
FOREIGN KEY (supplicer_invoice_id)
REFERENCES supplier_invoice (id)
ON DELETE CASCADE ;

-- ############################################################################ CHANNEL
-- CAMBIAR VALOR A NULL
UPDATE supplier_invoice_items
SET canal_id = NULL
where canal_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM supplier_invoice_items
WHERE canal_id NOT IN (
    SELECT id FROM channel
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM supplier_invoice_items
WHERE canal_id NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE supplier_invoice_items
ADD CONSTRAINT channel_fk
FOREIGN KEY (canal_id)
REFERENCES channel (id)
ON DELETE CASCADE ;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE supplier_invoice_items
SET user_id = NULL
where user_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM supplier_invoice_items
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM supplier_invoice_items
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE supplier_invoice_items
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ RESERVATIONS
-- CAMBIAR VALOR A NULL
UPDATE supplier_invoice_items
SET localizador = NULL
where localizador = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM supplier_invoice_items
WHERE localizador NOT IN (
    SELECT id FROM reservations
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM supplier_invoice_items
WHERE localizador NOT IN (
    SELECT id FROM reservations
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE supplier_invoice_items
ADD CONSTRAINT reservations_fk
FOREIGN KEY (localizador)
REFERENCES reservations (id)
ON DELETE CASCADE ;