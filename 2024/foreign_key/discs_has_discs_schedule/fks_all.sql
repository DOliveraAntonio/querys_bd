-- ############################################################################ SERVICIOS
-- CAMBIAR VALOR A NULL
UPDATE discs_has_discs_schedule
SET discs_id = NULL
where discs_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM discs_has_discs_schedule
WHERE discs_id NOT IN (
    SELECT id FROM discs_servicios
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs_has_discs_schedule
WHERE discs_id NOT IN (
    SELECT id FROM discs_servicios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs_has_discs_schedule
ADD CONSTRAINT discs_servicios_fk
FOREIGN KEY (discs_id)
REFERENCES discs_servicios (id)
ON DELETE SET NULL;
