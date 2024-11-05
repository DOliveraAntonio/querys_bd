-- ############################################################################ CURRENCY VALOR
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

-- ############################################################################ PAYMENTS METHOD
-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_payments
WHERE id_forma_pago NOT IN (
    SELECT id FROM form_of_payment
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_payments
WHERE id_forma_pago NOT IN (
    SELECT id FROM form_of_payment
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_payments
ADD CONSTRAINT reservations_payment__method_payment_fk
FOREIGN KEY (id_forma_pago)
REFERENCES form_of_payment (id)
ON DELETE SET NULL ;

-- ############################################################################ USERS
-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations_payments
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_payments
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_payments
ADD CONSTRAINT reservations_payment__users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE SET NULL ;