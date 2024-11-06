-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE ext_user_concesion
SET user_id = NULL
where user_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM ext_user_concesion
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM ext_user_concesion
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE ext_user_concesion
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE;

-- ############################################################################ HOTEL
-- CAMBIAR VALOR A NULL
UPDATE ext_user_concesion
SET hotel_id = NULL
where hotel_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM ext_user_concesion
WHERE hotel_id NOT IN (
    SELECT id FROM destinatios
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM ext_user_concesion
WHERE hotel_id NOT IN (
    SELECT id FROM destinatios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE ext_user_concesion
ADD CONSTRAINT destinatios_fk
FOREIGN KEY (hotel_id)
REFERENCES destinatios (id)
ON DELETE SET NULL;

-- ############################################################################ ZONE LOCATION
-- CAMBIAR VALOR A NULL
UPDATE ext_user_concesion
SET "zoneLocation_id" = NULL
where "zoneLocation_id" = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM ext_user_concesion
WHERE "zoneLocation_id" NOT IN (
    SELECT id FROM sales_place
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM ext_user_concesion
WHERE "zoneLocation_id" NOT IN (
    SELECT id FROM sales_place
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE ext_user_concesion
ADD CONSTRAINT sales_place_fk
FOREIGN KEY ("zoneLocation_id")
REFERENCES sales_place (id)
ON DELETE CASCADE ;