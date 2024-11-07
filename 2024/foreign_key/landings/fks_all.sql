-- ############################################################################ LLAVE PRIMARIA
alter table landings
    add constraint landings_pk
        primary key (id);

-- ############################################################################ LANDINGS
-- CAMBIAR VALOR A NULL
UPDATE landings
SET temporada = NULL
where temporada = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM landings
WHERE temporada NOT IN (
    SELECT id FROM transportation_season
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM landings
WHERE temporada NOT IN (
    SELECT id FROM transportation_season
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE landings
ADD CONSTRAINT transportation_season_fk
FOREIGN KEY (temporada)
REFERENCES transportation_season (id)
ON DELETE SET NULL ;