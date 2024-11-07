-- ############################################################################ LLAVE PRIMARIA
alter table landings_has_hotels
    add constraint landings_has_hotels_pk
        primary key (id);

-- ############################################################################ LANDING
-- CAMBIAR VALOR A NULL
UPDATE landings_has_hotels
SET landing_id = NULL
where landing_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM landings_has_hotels
WHERE landing_id NOT IN (
    SELECT id FROM landings
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM landings_has_hotels
WHERE landing_id NOT IN (
    SELECT id FROM landings
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE landings_has_hotels
ADD CONSTRAINT landings_fk
FOREIGN KEY (landing_id)
REFERENCES landings (id)
ON DELETE CASCADE ;


-- ############################################################################ HOTELS
-- CAMBIAR VALOR A NULL
UPDATE landings_has_hotels
SET hotel_id = NULL
where hotel_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM landings_has_hotels
WHERE hotel_id NOT IN (
    SELECT id FROM destinatios
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM landings_has_hotels
WHERE hotel_id NOT IN (
    SELECT id FROM destinatios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE landings_has_hotels
ADD CONSTRAINT destinatios_fk
FOREIGN KEY (hotel_id)
REFERENCES destinatios (id)
ON DELETE CASCADE ;

