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