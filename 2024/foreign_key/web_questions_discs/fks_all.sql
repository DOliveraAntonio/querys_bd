-- ############################################################################ COLUMN CHANGES
alter table web_questions_discs
    add constraint web_questions_discs_pk
        primary key (id);


-- ############################################################################ WEB DISCS
-- CAMBIAR VALOR A NULL
UPDATE web_questions_discs
SET web_disc_id = NULL
where web_disc_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_questions_discs
WHERE web_disc_id NOT IN (
    SELECT id FROM web_discs
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_questions_discs
WHERE web_disc_id NOT IN (
    SELECT id FROM web_discs
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_questions_discs
ADD CONSTRAINT web_discs_fk
FOREIGN KEY (web_disc_id)
REFERENCES web_discs (id)
ON DELETE CASCADE ;