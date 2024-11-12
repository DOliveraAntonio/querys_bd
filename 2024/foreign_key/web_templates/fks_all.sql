-- ############################################################################ WEB DISCS
-- CAMBIAR VALOR A NULL
UPDATE web_templates
SET section_id = NULL
where section_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM web_templates
WHERE section_id NOT IN (
    SELECT id FROM web_sections
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_templates
WHERE section_id NOT IN (
    SELECT id FROM web_sections
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_templates
ADD CONSTRAINT web_sections_fk
FOREIGN KEY (section_id)
REFERENCES web_sections (id)
ON DELETE CASCADE ;