-- ############################################################################ CURRENCY VALOR
-- CAMBIAR VALOR A NULL
UPDATE reservations_payments
SET id_currency_valor = NULL
where id_currency_valor = 0;

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
-- CAMBIAR VALOR A NULL
UPDATE reservations_payments
SET id_forma_pago = NULL
where id_forma_pago = 0;

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
-- CAMBIAR VALOR A NULL
UPDATE reservations_payments
SET user_id = NULL
where user_id = 0;

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