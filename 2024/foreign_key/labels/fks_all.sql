-- ############################################################################ PAYMENT RULES
-- CAMBIAR VALOR A NULL
UPDATE labels
SET payment_rule_id = NULL
where payment_rule_id = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM labels
WHERE payment_rule_id NOT IN (
    SELECT id FROM payment_rules
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM labels
WHERE payment_rule_id NOT IN (
    SELECT id FROM payment_rules
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE labels
ADD CONSTRAINT payment_rules_fk
FOREIGN KEY (payment_rule_id)
REFERENCES payment_rules (id)
ON DELETE CASCADE ;