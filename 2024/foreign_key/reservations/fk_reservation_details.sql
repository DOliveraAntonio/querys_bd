
-- MODIFICAMOS FORENKEY DE PAYMENTS CON RESERVATIONS
ALTER TABLE history_reservation_payments
    DROP constraint history_reservation_payments_reservations_id_fk;

ALTER TABLE history_reservation_payments
    ADD constraint history_reservation_payments_reservations_id_fk
        foreign key (id_reservation) references reservations
            on delete cascade;

-- TODO RESERVATIONS, DETAILS y PAYMENTS
-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT count(*) as tours FROM reservations_details_tour
WHERE id_reservation NOT IN (
    SELECT id FROM reservations
);

SELECT count(*) as transportacion FROM reservations_details_transportation
WHERE id_reservacion NOT IN (
    SELECT id FROM reservations
);

SELECT count(*) as tickets FROM reservations_details_tickets
WHERE id_reservation NOT IN (
    SELECT id FROM reservations
);

SELECT count(*) as transportacion FROM reservations_details_discs
WHERE id_reservacion NOT IN (
    SELECT id FROM reservations
);

SELECT count(*) as payments FROM reservations_payments
    WHERE id_reserva NOT IN (
    SELECT id FROM reservations
);


-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tour
WHERE id_reservation NOT IN (
    SELECT id FROM reservations
);

DELETE FROM reservations_details_transportation
WHERE id_reservacion NOT IN (
    SELECT id FROM reservations
);

DELETE FROM reservations_details_tickets
WHERE id_reservation NOT IN (
    SELECT id FROM reservations
);

DELETE FROM reservations_details_discs
WHERE id_reservacion NOT IN (
    SELECT id FROM reservations
);

DELETE FROM reservations_payments
WHERE id_reserva NOT IN (
    SELECT id FROM reservations
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tour
ADD CONSTRAINT reservations_details_tours__reservations_fk
FOREIGN KEY (id_reservation)
REFERENCES reservations (id)
ON DELETE CASCADE ;

ALTER TABLE reservations_details_transportation
ADD CONSTRAINT reservations_details_transportation__reservations_fk
FOREIGN KEY (id_reservacion)
REFERENCES reservations (id)
ON DELETE CASCADE ;

ALTER TABLE reservations_details_tickets
ADD CONSTRAINT reservations_details_tickets__reservations_fk
FOREIGN KEY (id_reservation)
REFERENCES reservations (id)
ON DELETE CASCADE ;

ALTER TABLE reservations_details_discs
ADD CONSTRAINT reservations_details_discs__reservations_fk
FOREIGN KEY (id_reservacion)
REFERENCES reservations (id)
ON DELETE CASCADE ;

ALTER TABLE reservations_payments
ADD CONSTRAINT reservations_payments__reservations_fk
FOREIGN KEY (id_reserva)
REFERENCES reservations (id)
ON DELETE CASCADE ;
