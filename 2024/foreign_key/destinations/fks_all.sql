-- ############################################################################ ZONAS
-- CAMBIAR VALOR A NULL
UPDATE destinatios
SET zona_id = NULL
where zona_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM destinatios
WHERE zona_id NOT IN (
    SELECT id FROM transport_zones
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM destinatios
WHERE zona_id NOT IN (
    SELECT id FROM transport_zones
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE destinatios
ADD CONSTRAINT transport_zones_fk
FOREIGN KEY (zona_id)
REFERENCES transport_zones (id)
ON DELETE SET NULL ;

-- ############################################################################ CIUDAD
-- CAMBIAR VALOR A NULL
UPDATE destinatios
SET ciudad_id = NULL
where ciudad_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM destinatios
WHERE ciudad_id NOT IN (
    SELECT id FROM city
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM destinatios
WHERE ciudad_id NOT IN (
    SELECT id FROM city
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE destinatios
ADD CONSTRAINT city_fk
FOREIGN KEY (ciudad_id)
REFERENCES city (id)
ON DELETE SET NULL ;

-- ############################################################################ PAIS
-- CAMBIAR VALOR A NULL
UPDATE destinatios
SET pais_id = NULL
where pais_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM destinatios
WHERE pais_id NOT IN (
    SELECT id FROM country
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM destinatios
WHERE pais_id NOT IN (
    SELECT id FROM country
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE destinatios
ADD CONSTRAINT country_fk
FOREIGN KEY (pais_id)
REFERENCES country (id)
ON DELETE SET NULL ;

-- ############################################################################ CATEGORIA DESTINO
-- CAMBIAR VALOR A NULL
UPDATE destinatios
SET id_categoria_destino = NULL
where id_categoria_destino = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM destinatios
WHERE id_categoria_destino NOT IN (
    SELECT id FROM category_destins
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM destinatios
WHERE id_categoria_destino NOT IN (
    SELECT id FROM category_destins
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE destinatios
ADD CONSTRAINT category_destins_fk
FOREIGN KEY (id_categoria_destino)
REFERENCES category_destins (id)
ON DELETE SET NULL ;