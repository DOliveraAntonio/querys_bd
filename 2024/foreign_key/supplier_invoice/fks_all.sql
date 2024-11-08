-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE supplier_invoice
SET proveedor_id = NULL
where proveedor_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM supplier_invoice
WHERE proveedor_id NOT IN (
    SELECT id FROM provider
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM supplier_invoice
WHERE proveedor_id NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE supplier_invoice
ADD CONSTRAINT provider_fk
FOREIGN KEY (proveedor_id)
REFERENCES provider (id)
ON DELETE CASCADE ;

-- ############################################################################ FORMA DE PAGO
-- CAMBIAR VALOR A NULL
UPDATE supplier_invoice
SET forma_de_pago_id = NULL
where forma_de_pago_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM supplier_invoice
WHERE forma_de_pago_id NOT IN (
    SELECT id FROM form_of_payment
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM supplier_invoice
WHERE forma_de_pago_id NOT IN (
    SELECT id FROM form_of_payment
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE supplier_invoice
ADD CONSTRAINT form_of_payment_fk
FOREIGN KEY (forma_de_pago_id)
REFERENCES form_of_payment (id)
ON DELETE SET NULL ;