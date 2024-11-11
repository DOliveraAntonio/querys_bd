-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE users
SET id_proveedor = NULL
where id_proveedor = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM users
WHERE id_proveedor NOT IN (
    SELECT id FROM provider
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM users
WHERE id_proveedor NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE users
ADD CONSTRAINT provider_fk
FOREIGN KEY (id_proveedor)
REFERENCES provider (id)
ON DELETE CASCADE ;

-- ############################################################################ CONTACT
-- CAMBIAR VALOR A NULL
UPDATE users
SET id_contact_user_agency = NULL
where id_contact_user_agency = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM users
WHERE id_contact_user_agency NOT IN (
    SELECT id FROM contact
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM users
WHERE id_contact_user_agency NOT IN (
    SELECT id FROM contact
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE users
ADD CONSTRAINT contact_fk
FOREIGN KEY (id_contact_user_agency)
REFERENCES contact (id)
ON DELETE SET NULL ;

-- ############################################################################ DESTINATIOS
-- CAMBIAR VALOR A NULL
UPDATE users
SET id_hotel = NULL
where id_hotel = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM users
WHERE id_hotel NOT IN (
    SELECT id FROM destinatios
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM users
WHERE id_hotel NOT IN (
    SELECT id FROM destinatios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE users
ADD CONSTRAINT destinatios_fk
FOREIGN KEY (id_hotel)
REFERENCES destinatios (id)
ON DELETE CASCADE ;