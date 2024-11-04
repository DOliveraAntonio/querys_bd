
-- ############################################################################ MODIFICAMOS FORENKEY DE PAYMENTS CON RESERVATIONS
ALTER TABLE history_reservation_payments
    DROP constraint history_reservation_payments_reservations_id_fk;

ALTER TABLE history_reservation_payments
    ADD constraint history_reservation_payments_reservations_id_fk
        foreign key (id_reservation) references reservations
            on delete cascade;

-- ############################################################################ TODO RESERVATIONS, DETAILS y PAYMENTS
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

ALTER TABLE reservations_payments
ADD CONSTRAINT reservations_payments__reservations_fk
FOREIGN KEY (id_reserva)
REFERENCES reservations (id)
ON DELETE CASCADE ;

-- ############################################################################ CANALES
-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT count(*) as canales FROM reservations
WHERE id_canal NOT IN (
    SELECT id FROM channel
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations
WHERE id_canal NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations
ADD CONSTRAINT reservations__channels_fk
FOREIGN KEY (id_canal)
REFERENCES channel (id)
ON DELETE CASCADE ;

-- ############################################################################ CLIENTES
-- YA PODEMOS CREAR LAS LLAVES FORANEAS
SELECT count(*) as client FROM reservations
WHERE id_cliente NOT IN (
    SELECT id FROM client
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations
WHERE id_cliente NOT IN (
    SELECT id FROM client
);
-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations
ADD CONSTRAINT clients__reservations_fk
FOREIGN KEY (id_cliente)
REFERENCES client (id)
ON DELETE CASCADE ;

-- ############################################################################ DESTINOS
-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT * FROM reservations
WHERE hotel_id NOT IN (
    SELECT id FROM destinatios
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations
WHERE hotel_id NOT IN (
    SELECT id FROM destinatios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations
ADD CONSTRAINT reservations__destinations_fk
FOREIGN KEY (hotel_id)
REFERENCES destinatios (id)
ON DELETE CASCADE ;

-- ############################################################################ LOCACIONES
-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT count(*) FROM reservations
WHERE id_history_location NOT IN (
    SELECT id FROM sales_location
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations
WHERE id_history_location NOT IN (
    SELECT id FROM sales_location
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations
ADD CONSTRAINT reservations__locations_fk
FOREIGN KEY (id_history_location)
REFERENCES sales_location (id)
ON DELETE CASCADE ;

-- ############################################################################ PROMOS
-- Cambiamos el valor en id_promo_code tengan 0 a null
UPDATE reservations
SET id_promo_code = NULL
where id_promo_code = 0;

-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT count(*) FROM reservations
WHERE id_promo_code NOT IN (
    SELECT id FROM promo_code
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations
WHERE id_promo_code NOT IN (
    SELECT id FROM promo_code
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations
ADD CONSTRAINT reservations__promo_code_fk
FOREIGN KEY (id_promo_code)
REFERENCES promo_code (id)
ON DELETE SET NULL ;


-- ############################################################################ USUARIOS
-- AQUI SOLO CONSULTAMOS LOS REGISTROS A ELIMINAR
SELECT count(*) as users FROM reservations
WHERE id_user NOT IN (
    SELECT id FROM users
);

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations
WHERE id_user NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations
ADD CONSTRAINT reservations__users_fk
FOREIGN KEY (id_user)
REFERENCES users (id)
ON DELETE CASCADE ;

