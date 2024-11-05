-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_payments
WHERE id_currency_valor NOT IN (
    SELECT id FROM currency_valor
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_payments
WHERE id_currency_valor NOT IN (
    SELECT id FROM currency_valor
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_payments
ADD CONSTRAINT reservations_payment__currency_valor_fk
FOREIGN KEY (id_currency_valor)
REFERENCES currency_valor (id)
ON DELETE SET NULL ;