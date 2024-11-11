-- ############################################################################ WEB DISCS
-- CAMBIAR VALOR A NULL
UPDATE web_activity_disc
SET web_disc_id = NULL
where web_disc_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_activity_disc
WHERE web_disc_id NOT IN (
    SELECT id FROM web_discs
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_activity_disc
WHERE web_disc_id NOT IN (
    SELECT id FROM web_discs
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_activity_disc
ADD CONSTRAINT web_discs_fk
FOREIGN KEY (web_disc_id)
REFERENCES web_discs (id)
ON DELETE CASCADE ;

-- ############################################################################ WEB ACTIVITY
-- CAMBIAR VALOR A NULL
UPDATE web_activity_disc
SET web_activity_id = NULL
where web_disc_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_activity_disc
WHERE web_activity_id NOT IN (
    SELECT id FROM web_activities
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_activity_disc
WHERE web_activity_id NOT IN (
    SELECT id FROM web_activities
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_activity_disc
ADD CONSTRAINT web_activities_fk
FOREIGN KEY (web_activity_id)
REFERENCES web_activities (id)
ON DELETE CASCADE ;