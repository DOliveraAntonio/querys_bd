-- ############################################################################ EXECUTIVE
-- CAMBIAR VALOR A NULL
UPDATE group_data_sheet
SET executive_id = NULL
where executive_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM group_data_sheet
WHERE executive_id NOT IN (
    SELECT id FROM executive_groups
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM group_data_sheet
WHERE executive_id NOT IN (
    SELECT id FROM executive_groups
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE group_data_sheet
ADD CONSTRAINT executive_groups_fk
FOREIGN KEY (executive_id)
REFERENCES executive_groups (id)
ON DELETE CASCADE ;