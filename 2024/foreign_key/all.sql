-- ############################################################################ ACCOUNT LEVEL
-- CAMBIAR VALOR A NULL
UPDATE "accountLevel"
SET account_id = NULL
where account_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM "accountLevel"
WHERE account_id NOT IN (
    SELECT id FROM account
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE "accountLevel"
ADD CONSTRAINT account_fk
FOREIGN KEY (account_id)
REFERENCES account (id)
ON DELETE SET NULL ;





-- ############################################################################ DISPONIBILIDAD SERVICIOS
-- CAMBIAR VALOR A NULL
UPDATE activities_services_availability_users
SET activities_service_id = NULL
where activities_service_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM activities_services_availability_users
WHERE activities_service_id NOT IN (
    SELECT id FROM tickets_servicios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE activities_services_availability_users
ADD CONSTRAINT tickets_servicios_fk
FOREIGN KEY (activities_service_id)
REFERENCES tickets_servicios (id)
ON DELETE CASCADE ;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE activities_services_availability_users
SET user_id = NULL
where user_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM activities_services_availability_users
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE activities_services_availability_users
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;





-- ############################################################################ DISPONIBILIDAD SERVICIOS
-- CAMBIAR VALOR A NULL
UPDATE additional_pax_reservation
SET id_reserva = NULL
where id_reserva = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM additional_pax_reservation
WHERE id_reserva NOT IN (
    SELECT id FROM reservations
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE additional_pax_reservation
ADD CONSTRAINT reservations_fk
FOREIGN KEY (id_reserva)
REFERENCES reservations (id)
ON DELETE CASCADE ;





-- ############################################################################ CIUDAD
-- CAMBIAR VALOR A NULL
UPDATE agency
SET city_id = NULL
where city_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM agency
WHERE city_id NOT IN (
    SELECT id FROM city
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE agency
ADD CONSTRAINT city_fk
FOREIGN KEY (city_id)
REFERENCES city (id)
ON DELETE SET NULL ;


-- ############################################################################ PAIS
-- CAMBIAR VALOR A NULL
UPDATE agency
SET pais_id = NULL
where pais_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM agency
WHERE pais_id NOT IN (
    SELECT id FROM country
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE agency
ADD CONSTRAINT country_fk
FOREIGN KEY (pais_id)
REFERENCES country (id)
ON DELETE SET NULL ;





-- ############################################################################ PRIMARY KEY
alter table agrupar_transportacion
    add constraint agrupar_transportacion_id_pk
        primary key (id);

-- ############################################################################ UNIDAD
-- CAMBIAR VALOR A NULL
UPDATE agrupar_transportacion
SET id_unidad_traslado = NULL
where id_unidad_traslado = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM agrupar_transportacion
WHERE id_unidad_traslado NOT IN (
    SELECT id FROM transfer_units
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE agrupar_transportacion
ADD CONSTRAINT transfer_units_fk
FOREIGN KEY (id_unidad_traslado)
REFERENCES transfer_units (id)
ON DELETE CASCADE ;

-- ############################################################################ PROVEEDOR
-- CAMBIAR VALOR A NULL
UPDATE agrupar_transportacion
SET id_proveedor = NULL
where id_proveedor = 0;


-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM agrupar_transportacion
WHERE id_proveedor NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE agrupar_transportacion
ADD CONSTRAINT provider_fk
FOREIGN KEY (id_proveedor)
REFERENCES provider (id)
ON DELETE CASCADE ;

-- ############################################################################ MONEDA
-- CAMBIAR VALOR A NULL
UPDATE agrupar_transportacion
SET id_moneda = NULL
where id_moneda = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM agrupar_transportacion
WHERE id_moneda NOT IN (
    SELECT id FROM currency
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE agrupar_transportacion
ADD CONSTRAINT currency_fk
FOREIGN KEY (id_moneda)
REFERENCES currency (id)
ON DELETE SET NULL ;

-- ############################################################################ TRANSPORTACION TARIFA
-- CAMBIAR VALOR A NULL
UPDATE agrupar_transportacion
SET id_transportation_rates = NULL
where id_transportation_rates = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM agrupar_transportacion
WHERE id_transportation_rates NOT IN (
    SELECT id FROM transportation_rates
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE agrupar_transportacion
ADD CONSTRAINT transportation_rates_fk
FOREIGN KEY (id_transportation_rates)
REFERENCES transportation_rates (id)
ON DELETE SET NULL ;

-- ############################################################################ TRANSPORTACION TARIFA PORCENTAJE
-- CAMBIAR VALOR A NULL
UPDATE agrupar_transportacion
SET id_transportation_rates_percent = NULL
where id_transportation_rates_percent = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM agrupar_transportacion
WHERE id_transportation_rates_percent NOT IN (
    SELECT id FROM transportation_rates_percents
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE agrupar_transportacion
ADD CONSTRAINT transportation_rates_percents_fk
FOREIGN KEY (id_transportation_rates_percent)
REFERENCES transportation_rates_percents (id)
ON DELETE SET NULL ;





-- ############################################################################ CANAL
-- CAMBIAR VALOR A NULL
UPDATE "asosiacionCuentas"
SET canal_id = NULL
where canal_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM "asosiacionCuentas"
WHERE canal_id NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE "asosiacionCuentas"
ADD CONSTRAINT channel_fk
FOREIGN KEY (canal_id)
REFERENCES channel (id)
ON DELETE SET NULL ;




-- ############################################################################ SALES PLACE
-- CAMBIAR VALOR A NULL
UPDATE budget
SET sales_place_id = NULL
where sales_place_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM budget
WHERE sales_place_id NOT IN (
    SELECT id FROM sales_place
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE budget
ADD CONSTRAINT sales_place_fk
FOREIGN KEY (sales_place_id)
REFERENCES sales_place (id)
ON DELETE CASCADE;

-- ############################################################################ SALES LOCATION
-- CAMBIAR VALOR A NULL
UPDATE budget
SET sales_location_id = NULL
where sales_location_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM budget
WHERE sales_location_id NOT IN (
    SELECT id FROM sales_location
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE budget
ADD CONSTRAINT sales_location_fk
FOREIGN KEY (sales_location_id)
REFERENCES sales_location (id)
ON DELETE CASCADE;

-- ############################################################################ CANAL
-- CAMBIAR VALOR A NULL
UPDATE budget
SET canal_id = NULL
where canal_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM budget
WHERE canal_id NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE budget
ADD CONSTRAINT channel_fk
FOREIGN KEY (canal_id)
REFERENCES channel (id)
ON DELETE CASCADE;

-- ############################################################################ HOTEL
-- CAMBIAR VALOR A NULL
UPDATE budget
SET hotel_id = NULL
where hotel_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM budget
WHERE hotel_id NOT IN (
    SELECT id FROM destinatios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE budget
ADD CONSTRAINT destinations_fk
FOREIGN KEY (hotel_id)
REFERENCES destinatios (id)
ON DELETE CASCADE;




-- ############################################################################ RESERVATION
-- CAMBIAR VALOR A NULL
UPDATE cancellation_requests
SET reservation_id = NULL
where reservation_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM cancellation_requests
WHERE reservation_id NOT IN (
    SELECT id FROM reservations
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE cancellation_requests
ADD CONSTRAINT reservations_fk
FOREIGN KEY (reservation_id)
REFERENCES reservations (id)
ON DELETE CASCADE;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE cancellation_requests
SET user_id = NULL
where user_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM cancellation_requests
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE cancellation_requests
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE;

-- ############################################################################ CANALES
-- CAMBIAR VALOR A NULL
UPDATE cancellation_requests
SET id_canal = NULL
where id_canal = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM cancellation_requests
WHERE id_canal NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE cancellation_requests
ADD CONSTRAINT channels_fk
FOREIGN KEY (id_canal)
REFERENCES channel (id)
ON DELETE CASCADE;




-- ############################################################################ PRODUCTS
-- CAMBIAR VALOR A NULL
UPDATE catalog_product_includes
SET catalog_product_id = NULL
where catalog_product_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM catalog_product_includes
WHERE catalog_product_id NOT IN (
    SELECT id FROM catalog_products
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE catalog_product_includes
ADD CONSTRAINT catalog_products_fk
FOREIGN KEY (catalog_product_id)
REFERENCES catalog_products (id)
ON DELETE SET NULL ;

-- ############################################################################ AMENIDADES
-- CAMBIAR VALOR A NULL
UPDATE catalog_product_includes
SET product_amenity_id = NULL
where product_amenity_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM catalog_product_includes
WHERE product_amenity_id NOT IN (
    SELECT id FROM catalog_amenities
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE catalog_product_includes
ADD CONSTRAINT catalog_amenities_fk
FOREIGN KEY (product_amenity_id)
REFERENCES catalog_amenities (id)
ON DELETE SET NULL ;




-- ############################################################################ PRODUCTS
-- CAMBIAR VALOR A NULL
UPDATE catalog_product_nonincludes
SET catalog_product_id = NULL
where catalog_product_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM catalog_product_nonincludes
WHERE catalog_product_id NOT IN (
    SELECT id FROM catalog_products
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE catalog_product_nonincludes
ADD CONSTRAINT catalog_products_fk
FOREIGN KEY (catalog_product_id)
REFERENCES catalog_products (id)
ON DELETE SET NULL ;

-- ############################################################################ AMENIDADES
-- CAMBIAR VALOR A NULL
UPDATE catalog_product_nonincludes
SET product_amenity_id = NULL
where product_amenity_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM catalog_product_nonincludes
WHERE product_amenity_id NOT IN (
    SELECT id FROM catalog_amenities
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE catalog_product_nonincludes
ADD CONSTRAINT catalog_amenities_fk
FOREIGN KEY (product_amenity_id)
REFERENCES catalog_amenities (id)
ON DELETE SET NULL ;




-- ############################################################################ CATEGORIAS
-- CAMBIAR VALOR A NULL
UPDATE catalog_products
SET catalog_category_id = NULL
where catalog_category_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM catalog_products
WHERE catalog_category_id NOT IN (
    SELECT id FROM catalog_categories
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE catalog_products
ADD CONSTRAINT catalog_categories_fk
FOREIGN KEY (catalog_category_id)
REFERENCES catalog_categories (id)
ON DELETE SET NULL ;

-- ############################################################################ CREATE BY
-- CAMBIAR VALOR A NULL
UPDATE catalog_products
SET created_by = NULL
where created_by = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM catalog_products
WHERE created_by NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE catalog_products
ADD CONSTRAINT users_created_fk
FOREIGN KEY (created_by)
REFERENCES users (id)
ON DELETE SET NULL ;

-- ############################################################################ UPDATE BY
-- CAMBIAR VALOR A NULL
UPDATE catalog_products
SET updated_by = NULL
where updated_by = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM catalog_products
WHERE updated_by NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE catalog_products
ADD CONSTRAINT users_updated_fk
FOREIGN KEY (updated_by)
REFERENCES users (id)
ON DELETE SET NULL ;




-- ############################################################################ CATEGORY ACCOUNT
-- CAMBIAR VALOR A NULL
UPDATE "categoryAccountType"
SET "categoryAccount_id" = NULL
where "categoryAccount_id" = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM "categoryAccountType"
WHERE "categoryAccount_id" NOT IN (
    SELECT id FROM "categoryAccount"
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE "categoryAccountType"
ADD CONSTRAINT category_account_fk
FOREIGN KEY ("categoryAccount_id")
REFERENCES "categoryAccount" (id)
ON DELETE SET NULL ;

-- ############################################################################ CATEGORY TYPE
-- CAMBIAR VALOR A NULL
UPDATE "categoryAccountType"
SET "typeCategory_id" = NULL
where "typeCategory_id" = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM "categoryAccountType"
WHERE "typeCategory_id" NOT IN (
    SELECT id FROM "typeCategory"
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE "categoryAccountType"
ADD CONSTRAINT category_type_fk
FOREIGN KEY ("typeCategory_id")
REFERENCES "typeCategory" (id)
ON DELETE SET NULL ;




-- ############################################################################ RESERVATIONS
-- CAMBIAR VALOR A NULL
UPDATE certificates_cc
SET reservation_id = NULL
where reservation_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM certificates_cc
WHERE reservation_id NOT IN (
    SELECT id FROM reservations
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE certificates_cc
ADD CONSTRAINT reservations_fk
FOREIGN KEY (reservation_id)
REFERENCES reservations (id)
ON DELETE CASCADE;




-- ############################################################################ REGION
-- CAMBIAR VALOR A NULL
UPDATE city
SET region_id = NULL
where region_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM city
WHERE region_id NOT IN (
    SELECT id FROM region
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE city
ADD CONSTRAINT region_fk
FOREIGN KEY (region_id)
REFERENCES region (id)
ON DELETE CASCADE;




-- ############################################################################ PAIS
-- CAMBIAR VALOR A NULL
UPDATE client
SET country_id = NULL
where country_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM client
WHERE country_id NOT IN (
    SELECT id FROM country
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE client
ADD CONSTRAINT country_fk
FOREIGN KEY (country_id)
REFERENCES country (id)
ON DELETE SET NULL;

-- ############################################################################ REGION
-- CAMBIAR VALOR A NULL
UPDATE client
SET estado_id = NULL
where estado_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM client
WHERE estado_id NOT IN (
    SELECT id FROM region
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE client
ADD CONSTRAINT region_fk
FOREIGN KEY (estado_id)
REFERENCES region (id)
ON DELETE SET NULL;

-- ############################################################################ CIUDAD
-- CAMBIAR VALOR A NULL
UPDATE client
SET ciudad_id = NULL
where ciudad_id = 0;


-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM client
WHERE ciudad_id NOT IN (
    SELECT id FROM city
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE client
ADD CONSTRAINT city_fk
FOREIGN KEY (ciudad_id)
REFERENCES city (id)
ON DELETE SET NULL;




-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE comercial_comision
SET user_id = NULL
where user_id = 0;


-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM comercial_comision
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE comercial_comision
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE SET NULL;




-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE comision_sub_gerente
SET id_sub_gerente = NULL
where id_sub_gerente = 0;


-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM comision_sub_gerente
WHERE id_sub_gerente NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE comision_sub_gerente
ADD CONSTRAINT users_fk
FOREIGN KEY (id_sub_gerente)
REFERENCES users (id)
ON DELETE SET NULL;




-- ############################################################################ PRIMARY KEY
alter table coupon_managers
    add constraint coupon_managers_pk
        primary key (id);

-- ############################################################################ MODFICACIONES DE VALOREs
alter table coupon_managers
    alter column created_by drop not null;

alter table coupon_managers
    alter column created_by set default null;

alter table coupon_managers
    alter column updated_by drop not null;

alter table coupon_managers
    alter column updated_by set default null;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE coupon_managers
SET user_id = NULL
where user_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM coupon_managers
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE coupon_managers
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE SET NULL;

-- ############################################################################ USERS CREATED BY
-- CAMBIAR VALOR A NULL
UPDATE coupon_managers
SET created_by = NULL
where created_by = 0;


-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM coupon_managers
WHERE created_by NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE coupon_managers
ADD CONSTRAINT created_by_fk
FOREIGN KEY (created_by)
REFERENCES users (id)
ON DELETE SET NULL;

-- ############################################################################ USERS UPDATE BY
-- CAMBIAR VALOR A NULL
UPDATE coupon_managers
SET updated_by = NULL
where updated_by = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM coupon_managers
WHERE updated_by NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE coupon_managers
ADD CONSTRAINT updated_by_fk
FOREIGN KEY (updated_by)
REFERENCES users (id)
ON DELETE SET NULL;




-- ############################################################################ CURRENCY
-- CAMBIAR VALOR A NULL
UPDATE currency_valor
SET id_moneda = NULL
where id_moneda = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM currency_valor
WHERE id_moneda NOT IN (
    SELECT id FROM currency
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE currency_valor
ADD CONSTRAINT currency_fk
FOREIGN KEY (id_moneda)
REFERENCES currency (id)
ON DELETE CASCADE;

-- ############################################################################ CURRENCY VALOR
-- CAMBIAR VALOR A NULL
UPDATE currency_valor
SET id_moneda_valor = NULL
where id_moneda_valor = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM currency_valor
WHERE id_moneda_valor NOT IN (
    SELECT id FROM currency
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE currency_valor
ADD CONSTRAINT currency_valor_fk
FOREIGN KEY (id_moneda_valor)
REFERENCES currency (id)
ON DELETE CASCADE;




-- ############################################################################ ZONAS
-- CAMBIAR VALOR A NULL
UPDATE destinatios
SET zona_id = NULL
where zona_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM destinatios
WHERE zona_id NOT IN (
    SELECT id FROM transport_zones
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE destinatios
ADD CONSTRAINT transport_zones_fk
FOREIGN KEY (zona_id)
REFERENCES transport_zones (id)
ON DELETE SET NULL ;

-- ############################################################################ CIUDAD
-- CAMBIAR VALOR A NULL
UPDATE destinatios
SET ciudad_id = NULL
where ciudad_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM destinatios
WHERE ciudad_id NOT IN (
    SELECT id FROM city
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE destinatios
ADD CONSTRAINT city_fk
FOREIGN KEY (ciudad_id)
REFERENCES city (id)
ON DELETE SET NULL ;

-- ############################################################################ PAIS
-- CAMBIAR VALOR A NULL
UPDATE destinatios
SET pais_id = NULL
where pais_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM destinatios
WHERE pais_id NOT IN (
    SELECT id FROM country
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE destinatios
ADD CONSTRAINT country_fk
FOREIGN KEY (pais_id)
REFERENCES country (id)
ON DELETE SET NULL ;

-- ############################################################################ CATEGORIA DESTINO
-- CAMBIAR VALOR A NULL
UPDATE destinatios
SET id_categoria_destino = NULL
where id_categoria_destino = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM destinatios
WHERE id_categoria_destino NOT IN (
    SELECT id FROM category_destins
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE destinatios
ADD CONSTRAINT category_destins_fk
FOREIGN KEY (id_categoria_destino)
REFERENCES category_destins (id)
ON DELETE SET NULL ;




-- CAMBIAR VALOR A NULL
UPDATE development_requests
SET user_id = NULL
where user_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM development_requests
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE development_requests
ADD CONSTRAINT updated_by_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE SET NULL;




-- ############################################################################ PROVIDERS
-- CAMBIAR VALOR A NULL
UPDATE discs
SET provider_id = NULL
where provider_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs
ADD CONSTRAINT provider_fk
FOREIGN KEY (provider_id)
REFERENCES provider (id)
ON DELETE CASCADE;

-- ############################################################################ COUNTRY
-- CAMBIAR VALOR A NULL
UPDATE discs
SET pais_id = NULL
where pais_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs
WHERE pais_id NOT IN (
    SELECT id FROM country
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs
ADD CONSTRAINT country_fk
FOREIGN KEY (pais_id)
REFERENCES country (id)
ON DELETE SET NULL;

-- ############################################################################ REGION
-- CAMBIAR VALOR A NULL
UPDATE discs
SET estado_id = NULL
where estado_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs
WHERE estado_id NOT IN (
    SELECT id FROM region
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs
ADD CONSTRAINT region_fk
FOREIGN KEY (estado_id)
REFERENCES region (id)
ON DELETE SET NULL;

-- ############################################################################ CITY
-- CAMBIAR VALOR A NULL
UPDATE discs
SET ciudad_id = NULL
where ciudad_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs
WHERE ciudad_id NOT IN (
    SELECT id FROM city
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs
ADD CONSTRAINT city_fk
FOREIGN KEY (ciudad_id)
REFERENCES city (id)
ON DELETE SET NULL;


-- ############################################################################ SUB PRODUCTO
-- CAMBIAR VALOR A NULL
UPDATE discs_rate
SET id_sub_producto = NULL
where id_sub_producto = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs_rate
WHERE id_sub_producto NOT IN (
    SELECT id FROM sub_products
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs_rate
ADD CONSTRAINT sub_products_fk
FOREIGN KEY (id_sub_producto)
REFERENCES sub_products (id)
ON DELETE SET NULL;

-- ############################################################################ SEASON
-- CAMBIAR VALOR A NULL
UPDATE discs_rate
SET id_dics_season = NULL
where id_dics_season = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs_rate
WHERE id_dics_season NOT IN (
    SELECT id FROM discs_season
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs_rate
ADD CONSTRAINT discs_season_fk
FOREIGN KEY (id_dics_season)
REFERENCES discs_season (id)
ON DELETE SET NULL;

-- ############################################################################ METODO
-- CAMBIAR VALOR A NULL
UPDATE discs_rate
SET id_metodo_producto = NULL
where id_metodo_producto = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs_rate
WHERE id_metodo_producto NOT IN (
    SELECT id FROM product_method
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs_rate
ADD CONSTRAINT product_method_fk
FOREIGN KEY (id_metodo_producto)
REFERENCES product_method (id)
ON DELETE CASCADE;


-- ############################################################################ MODIFICAR COLUMNAS
alter table discs_servicios
    add constraint discs_servicios_pk
        primary key (id);

alter table discs_servicios
    alter column "user" type integer using "user"::integer;

-- ############################################################################ DISCOS
-- CAMBIAR VALOR A NULL
UPDATE discs_servicios
SET id_discs = NULL
where id_discs = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs_servicios
WHERE id_discs NOT IN (
    SELECT id FROM discs
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs_servicios
ADD CONSTRAINT discs_fk
FOREIGN KEY (id_discs)
REFERENCES discs (id)
ON DELETE CASCADE ;

-- ############################################################################ SERVICIOS
-- CAMBIAR VALOR A NULL
UPDATE discs_rate
SET id_servicio = NULL
where id_servicio = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs_rate
WHERE id_servicio NOT IN (
    SELECT id FROM discs_servicios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs_rate
ADD CONSTRAINT discs_servicios_fk
FOREIGN KEY (id_servicio)
REFERENCES discs_servicios (id)
ON DELETE CASCADE;



-- ############################################################################ SERVICIOS
-- CAMBIAR VALOR A NULL
UPDATE discs_has_discs_schedule
SET discs_id = NULL
where discs_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs_has_discs_schedule
WHERE discs_id NOT IN (
    SELECT id FROM discs_servicios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs_has_discs_schedule
ADD CONSTRAINT discs_services_fk
FOREIGN KEY (discs_id)
REFERENCES discs_servicios (id)
ON DELETE SET NULL;



-- ############################################################################ CURRENCY
-- CAMBIAR VALOR A NULL
UPDATE discs_rate
SET id_currency = NULL
where id_currency = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs_rate
WHERE id_currency NOT IN (
    SELECT id FROM currency
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs_rate
ADD CONSTRAINT currency_fk
FOREIGN KEY (id_currency)
REFERENCES currency (id)
ON DELETE SET NULL;




-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE discs_season
SET provider_id = NULL
where provider_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs_season
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs_season
ADD CONSTRAINT provider_fk
FOREIGN KEY (provider_id)
REFERENCES provider (id)
ON DELETE CASCADE;




-- ############################################################################ PRIMARY KEY
alter table discs_seasons_has_providers
    add constraint discs_seasons_has_providers_pk
        primary key (id);

-- ############################################################################ SEASON
-- CAMBIAR VALOR A NULL
UPDATE discs_seasons_has_providers
SET disc_season_id = NULL
where disc_season_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs_seasons_has_providers
WHERE disc_season_id NOT IN (
    SELECT id FROM discs_season
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs_seasons_has_providers
ADD CONSTRAINT discs_season_fk
FOREIGN KEY (disc_season_id)
REFERENCES discs_season (id)
ON DELETE SET NULL;

-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE discs_seasons_has_providers
SET provider_id = NULL
where provider_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs_seasons_has_providers
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs_seasons_has_providers
ADD CONSTRAINT provider_fk
FOREIGN KEY (provider_id)
REFERENCES provider (id)
ON DELETE CASCADE;




-- ############################################################################ SERVICE
-- CAMBIAR VALOR A NULL
UPDATE discs_services_availability_users
SET discs_service_id = NULL
where discs_service_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs_services_availability_users
WHERE discs_service_id NOT IN (
    SELECT id FROM discs_servicios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs_services_availability_users
ADD CONSTRAINT discs_servicios_fk
FOREIGN KEY (discs_service_id)
REFERENCES discs_servicios (id)
ON DELETE CASCADE;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE discs_services_availability_users
SET user_id = NULL
where user_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs_services_availability_users
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs_services_availability_users
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE SET NULL;


-- ############################################################################ USERs
-- CAMBIAR VALOR A NULL
UPDATE discs_servicios
SET "user" = NULL
where "user" = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM discs_servicios
WHERE "user" NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE discs_servicios
ADD CONSTRAINT users_fk
FOREIGN KEY ("user")
REFERENCES users (id)
ON DELETE SET NULL ;




-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE dock_transportation
SET id_provider = NULL
where id_provider = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM dock_transportation
WHERE id_provider NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE dock_transportation
ADD CONSTRAINT provider_fk
FOREIGN KEY (id_provider)
REFERENCES provider (id)
ON DELETE CASCADE;




-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE ext_user_concesion
SET user_id = NULL
where user_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM ext_user_concesion
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE ext_user_concesion
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE;

-- ############################################################################ HOTEL
-- CAMBIAR VALOR A NULL
UPDATE ext_user_concesion
SET hotel_id = NULL
where hotel_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM ext_user_concesion
WHERE hotel_id NOT IN (
    SELECT id FROM destinatios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE ext_user_concesion
ADD CONSTRAINT destinatios_fk
FOREIGN KEY (hotel_id)
REFERENCES destinatios (id)
ON DELETE SET NULL;

-- ############################################################################ ZONE LOCATION
-- CAMBIAR VALOR A NULL
UPDATE ext_user_concesion
SET "zoneLocation_id" = NULL
where "zoneLocation_id" = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM ext_user_concesion
WHERE "zoneLocation_id" NOT IN (
    SELECT id FROM sales_place
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE ext_user_concesion
ADD CONSTRAINT sales_place_fk
FOREIGN KEY ("zoneLocation_id")
REFERENCES sales_place (id)
ON DELETE CASCADE ;




-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE extranet_logs
SET user_id = NULL
where user_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM extranet_logs
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE extranet_logs
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;




-- ############################################################################ EXECUTIVE
-- CAMBIAR VALOR A NULL
UPDATE group_data_sheet
SET executive_id = NULL
where executive_id = 0;

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




-- ############################################################################ DEVELOPMENT REQUEST
-- CAMBIAR VALOR A NULL
UPDATE history_development_requests
SET development_request_id = NULL
where development_request_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM history_development_requests
WHERE development_request_id NOT IN (
    SELECT id FROM development_requests
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE history_development_requests
ADD CONSTRAINT development_requests_fk
FOREIGN KEY (development_request_id)
REFERENCES development_requests (id)
ON DELETE SET NULL ;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE history_development_requests
SET user_id = NULL
where user_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM history_development_requests
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE history_development_requests
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE SET NULL ;




-- CAMBIAR VALOR A NULL
UPDATE history_locations
SET id_sales_location = NULL
where id_sales_location = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM history_locations
WHERE id_sales_location NOT IN (
    SELECT id FROM sales_location
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE history_locations
ADD CONSTRAINT sales_location_fk
FOREIGN KEY (id_sales_location)
REFERENCES sales_location (id)
ON DELETE SET NULL ;




-- ############################################################################ RESERVATION LED
-- CAMBIAR VALOR A NULL
UPDATE history_reservation_led
SET id_reservation_led = NULL
where id_reservation_led = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM history_reservation_led
WHERE id_reservation_led NOT IN (
    SELECT id FROM reservations
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE history_reservation_led
ADD CONSTRAINT reservations_led_fk
FOREIGN KEY (id_reservation_led)
REFERENCES reservations (id)
ON DELETE CASCADE;

-- ############################################################################ RESERVATION
-- CAMBIAR VALOR A NULL
UPDATE history_reservation_led
SET id_reservation = NULL
where id_reservation = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM history_reservation_led
WHERE id_reservation NOT IN (
    SELECT id FROM reservations
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE history_reservation_led
ADD CONSTRAINT reservations_fk
FOREIGN KEY (id_reservation)
REFERENCES reservations (id)
ON DELETE CASCADE;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE history_reservation_led
SET id_user = NULL
where id_user = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM history_reservation_led
WHERE id_user NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE history_reservation_led
ADD CONSTRAINT users_fk
FOREIGN KEY (id_user)
REFERENCES users (id)
ON DELETE CASCADE;




-- ############################################################################ RESERVATION
-- CAMBIAR VALOR A NULL
UPDATE history_reservation_reprogramming
SET localizador = NULL
where localizador = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM history_reservation_reprogramming
WHERE localizador NOT IN (
    SELECT id FROM reservations
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE history_reservation_reprogramming
ADD CONSTRAINT reservations_fk
FOREIGN KEY (localizador)
REFERENCES reservations (id)
ON DELETE CASCADE ;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE history_reservation_reprogramming
SET id_rep_request = NULL
where id_rep_request = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM history_reservation_reprogramming
WHERE id_rep_request NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE history_reservation_reprogramming
ADD CONSTRAINT users_fk
FOREIGN KEY (id_rep_request)
REFERENCES users (id)
ON DELETE CASCADE ;




-- CAMBIAR VALOR A NULL
UPDATE history_update_reservations
SET id_reservation = NULL
where id_reservation = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM history_update_reservations
WHERE id_reservation NOT IN (
    SELECT id FROM reservations
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE history_update_reservations
ADD CONSTRAINT reservations_fk
FOREIGN KEY (id_reservation)
REFERENCES reservations (id)
ON DELETE CASCADE;




-- ############################################################################ INCENTIVES
-- CAMBIAR VALOR A NULL
UPDATE incentives
SET provider_id = NULL
where provider_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM incentives
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE incentives
ADD CONSTRAINT provider_fk
FOREIGN KEY (provider_id)
REFERENCES provider (id)
ON DELETE CASCADE ;




-- ############################################################################ USERs
-- CAMBIAR VALOR A NULL
UPDATE inceptives_users
SET user_id = NULL
where user_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM inceptives_users
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE inceptives_users
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;




-- ############################################################################ PAYMENT RULES
-- CAMBIAR VALOR A NULL
UPDATE labels
SET payment_rule_id = NULL
where payment_rule_id = 0;

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




-- ############################################################################ LLAVE PRIMARIA
alter table landings
    add constraint landings_pk
        primary key (id);

-- ############################################################################ LANDINGS
-- CAMBIAR VALOR A NULL
UPDATE landings
SET temporada = NULL
where temporada = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM landings
WHERE temporada NOT IN (
    SELECT id FROM transportation_season
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE landings
ADD CONSTRAINT transportation_season_fk
FOREIGN KEY (temporada)
REFERENCES transportation_season (id)
ON DELETE SET NULL ;




-- ############################################################################ LLAVE PRIMARIA
alter table landings_has_hotels
    add constraint landings_has_hotels_pk
        primary key (id);

-- ############################################################################ LANDING
-- CAMBIAR VALOR A NULL
UPDATE landings_has_hotels
SET landing_id = NULL
where landing_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM landings_has_hotels
WHERE landing_id NOT IN (
    SELECT id FROM landings
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE landings_has_hotels
ADD CONSTRAINT landings_fk
FOREIGN KEY (landing_id)
REFERENCES landings (id)
ON DELETE CASCADE ;


-- ############################################################################ HOTELS
-- CAMBIAR VALOR A NULL
UPDATE landings_has_hotels
SET hotel_id = NULL
where hotel_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM landings_has_hotels
WHERE hotel_id NOT IN (
    SELECT id FROM destinatios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE landings_has_hotels
ADD CONSTRAINT destinatios_fk
FOREIGN KEY (hotel_id)
REFERENCES destinatios (id)
ON DELETE CASCADE ;




-- ############################################################################ RESERVATIONS
-- CAMBIAR VALOR A NULL
UPDATE led_assignment
SET id_reservation = NULL
where id_reservation = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM led_assignment
WHERE id_reservation NOT IN (
    SELECT id FROM reservations
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE led_assignment
ADD CONSTRAINT reservations_fk
FOREIGN KEY (id_reservation)
REFERENCES reservations (id)
ON DELETE CASCADE;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE led_assignment
SET id_user = NULL
where id_user = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM led_assignment
WHERE id_user NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE led_assignment
ADD CONSTRAINT users_fk
FOREIGN KEY (id_user)
REFERENCES users (id)
ON DELETE CASCADE;




-- ############################################################################ PRESUPUESTO
-- CAMBIAR VALOR A NULL
UPDATE locations_has_user_budget
SET presupuesto_id = NULL
where presupuesto_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM locations_has_user_budget
WHERE presupuesto_id NOT IN (
    SELECT id FROM budget
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE locations_has_user_budget
ADD CONSTRAINT budget_fk
FOREIGN KEY (presupuesto_id)
REFERENCES budget (id)
ON DELETE CASCADE;

-- ############################################################################ REP
-- CAMBIAR VALOR A NULL
UPDATE locations_has_user_budget
SET rep_id = NULL
where rep_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM locations_has_user_budget
WHERE rep_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE locations_has_user_budget
ADD CONSTRAINT rep_fk
FOREIGN KEY (rep_id)
REFERENCES users (id)
ON DELETE CASCADE;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE locations_has_user_budget
SET user_id = NULL
where user_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM locations_has_user_budget
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE locations_has_user_budget
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE;




-- ############################################################################ CHANGE COLUMNs
alter table login_logs
    alter column user_id drop not null;

alter table login_logs
    alter column user_id drop default;

alter table login_logs
    alter column location_id drop not null;

alter table login_logs
    alter column location_id drop default;

alter table login_logs
    alter column channel_id drop not null;

alter table login_logs
    alter column channel_id drop default;

alter table login_logs
    alter column hotel_id drop not null;

alter table login_logs
    alter column hotel_id drop default;

-- ############################################################################ USERs
-- CAMBIAR VALOR A NULL
UPDATE login_logs
SET user_id = NULL
where user_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM login_logs
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE login_logs
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ LOCATION
-- CAMBIAR VALOR A NULL
UPDATE login_logs
SET location_id = NULL
where location_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM login_logs
WHERE location_id NOT IN (
    SELECT id FROM sales_place
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE login_logs
ADD CONSTRAINT sales_place_fk
FOREIGN KEY (location_id)
REFERENCES sales_place (id)
ON DELETE CASCADE ;

-- ############################################################################ CHANNEL
-- CAMBIAR VALOR A NULL
UPDATE login_logs
SET channel_id = NULL
where channel_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM login_logs
WHERE channel_id NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE login_logs
ADD CONSTRAINT channel_fk
FOREIGN KEY (channel_id)
REFERENCES channel (id)
ON DELETE CASCADE ;

-- ############################################################################ DETINATIOS
-- CAMBIAR VALOR A NULL
UPDATE login_logs
SET hotel_id = NULL
where hotel_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM login_logs
WHERE hotel_id NOT IN (
    SELECT id FROM destinatios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE login_logs
ADD CONSTRAINT destinatios_fk
FOREIGN KEY (hotel_id)
REFERENCES destinatios (id)
ON DELETE CASCADE ;




-- ############################################################################ CURRENCY VALOR
-- CAMBIAR VALOR A NULL
UPDATE moneda_programada
SET id_moneda_activa = NULL
where id_moneda_activa = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM moneda_programada
WHERE id_moneda_activa NOT IN (
    SELECT id FROM currency_valor
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE moneda_programada
ADD CONSTRAINT currency_valor_fk
FOREIGN KEY (id_moneda_activa)
REFERENCES currency_valor (id)
ON DELETE CASCADE ;

-- ############################################################################ MONEDA
-- CAMBIAR VALOR A NULL
UPDATE moneda_programada
SET id_moneda = NULL
where id_moneda = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM moneda_programada
WHERE id_moneda NOT IN (
    SELECT id FROM currency
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE moneda_programada
ADD CONSTRAINT currency_fk
FOREIGN KEY (id_moneda)
REFERENCES currency (id)
ON DELETE CASCADE ;

-- ############################################################################ MONEDA VALOR
-- CAMBIAR VALOR A NULL
UPDATE moneda_programada
SET id_moneda_valor = NULL
where id_moneda_valor = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM moneda_programada
WHERE id_moneda_valor NOT IN (
    SELECT id FROM currency
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE moneda_programada
ADD CONSTRAINT currency_2_fk
FOREIGN KEY (id_moneda_valor)
REFERENCES currency (id)
ON DELETE CASCADE ;




-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE months_by_services
SET provider_id = NULL
where provider_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM months_by_services
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE months_by_services
ADD CONSTRAINT provider_fk
FOREIGN KEY (provider_id)
REFERENCES provider (id)
ON DELETE CASCADE ;




-- ############################################################################ CHANGE COLUMN
alter table newsletters
    alter column created_by drop default;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE newsletters
SET created_by = NULL
where created_by = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM newsletters
WHERE created_by NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE newsletters
ADD CONSTRAINT users_fk
FOREIGN KEY (created_by)
REFERENCES users (id)
ON DELETE CASCADE ;




-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE oauth_access_tokens
SET user_id = NULL
where user_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM oauth_access_tokens
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE oauth_access_tokens
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ CLIENT
-- CAMBIAR VALOR A NULL
UPDATE oauth_access_tokens
SET client_id = NULL
where client_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM oauth_access_tokens
WHERE client_id NOT IN (
    SELECT id FROM client
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE oauth_access_tokens
ADD CONSTRAINT client_fk
FOREIGN KEY (client_id)
REFERENCES client (id)
ON DELETE CASCADE ;




-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE oauth_auth_codes
SET user_id = NULL
where user_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM oauth_auth_codes
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE oauth_auth_codes
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ CLIENT
-- CAMBIAR VALOR A NULL
UPDATE oauth_auth_codes
SET client_id = NULL
where client_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM oauth_auth_codes
WHERE client_id NOT IN (
    SELECT id FROM client
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE oauth_auth_codes
ADD CONSTRAINT client_fk
FOREIGN KEY (client_id)
REFERENCES client (id)
ON DELETE CASCADE ;




-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE oauth_clients
SET user_id = NULL
where user_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM oauth_clients
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE oauth_clients
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;




-- ############################################################################ CLIENT
-- CAMBIAR VALOR A NULL
UPDATE oauth_personal_access_clients
SET client_id = NULL
where client_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM oauth_personal_access_clients
WHERE client_id NOT IN (
    SELECT id FROM client
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE oauth_personal_access_clients
ADD CONSTRAINT client_fk
FOREIGN KEY (client_id)
REFERENCES client (id)
ON DELETE CASCADE ;





-- ############################################################################ PACKAGE INFO
-- CAMBIAR VALOR A NULL
UPDATE packages_services_availability_users
SET packages_service_id = NULL
where packages_service_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM packages_services_availability_users
WHERE packages_service_id NOT IN (
    SELECT id FROM packages_info
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE packages_services_availability_users
ADD CONSTRAINT packages_info_fk
FOREIGN KEY (packages_service_id)
REFERENCES packages_info (id)
ON DELETE CASCADE ;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE packages_services_availability_users
SET user_id = NULL
where user_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM packages_services_availability_users
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE packages_services_availability_users
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;




-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE parametros_comisiones
SET id_user = NULL
where id_user = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM parametros_comisiones
WHERE id_user NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE parametros_comisiones
ADD CONSTRAINT users_fk
FOREIGN KEY (id_user)
REFERENCES users (id)
ON DELETE CASCADE ;





-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE pickup_has_services
SET id_pickup = NULL
where id_pickup = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM pickup_has_services
WHERE id_pickup NOT IN (
    SELECT id FROM pickup_service_locations
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE pickup_has_services
ADD CONSTRAINT pickup_service_locations_fk
FOREIGN KEY (id_pickup)
REFERENCES pickup_service_locations (id)
ON DELETE CASCADE ;




-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE promo_code
SET id_user_created = NULL
where id_user_created = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM promo_code
WHERE id_user_created NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE promo_code
ADD CONSTRAINT users_fk
FOREIGN KEY (id_user_created)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ CURRENCY
-- CAMBIAR VALOR A NULL
UPDATE promo_code
SET currency_id = NULL
where currency_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM promo_code
WHERE currency_id NOT IN (
    SELECT id FROM currency
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE promo_code
ADD CONSTRAINT currency_fk
FOREIGN KEY (currency_id)
REFERENCES currency (id)
ON DELETE CASCADE ;




-- ############################################################################ CHANGE COLUMN
alter table promo_code_auth
    alter column generated_by drop not null;

alter table promo_code_auth
    alter column generated_by drop default;

-- ############################################################################ PROMO CODE
-- CAMBIAR VALOR A NULL
UPDATE promo_code_auth
SET id_promo_code = NULL
where id_promo_code = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM promo_code_auth
WHERE id_promo_code NOT IN (
    SELECT id FROM promo_code
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE promo_code_auth
ADD CONSTRAINT promo_code_fk
FOREIGN KEY (id_promo_code)
REFERENCES promo_code (id)
ON DELETE CASCADE ;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE promo_code_auth
SET id_user_authorization = NULL
where id_user_authorization = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM promo_code_auth
WHERE id_user_authorization NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE promo_code_auth
ADD CONSTRAINT users_fk
FOREIGN KEY (id_user_authorization)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ GENERATED USERS
-- CAMBIAR VALOR A NULL
UPDATE promo_code_auth
SET generated_by = NULL
where generated_by = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM promo_code_auth
WHERE generated_by NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE promo_code_auth
ADD CONSTRAINT generated_by_fk
FOREIGN KEY (generated_by)
REFERENCES users (id)
ON DELETE SET NULL ;




-- ############################################################################ PROMO CODE
-- CAMBIAR VALOR A NULL
UPDATE promo_code_channel
SET id_promo_code = NULL
where id_promo_code = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM promo_code_channel
WHERE id_promo_code NOT IN (
    SELECT id FROM promo_code
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE promo_code_channel
ADD CONSTRAINT promo_code_fk
FOREIGN KEY (id_promo_code)
REFERENCES promo_code (id)
ON DELETE CASCADE ;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE promo_code_channel
SET id_user_channel = NULL
where id_user_channel = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM promo_code_channel
WHERE id_user_channel NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE promo_code_channel
ADD CONSTRAINT users_fk
FOREIGN KEY (id_user_channel)
REFERENCES users (id)
ON DELETE SET NULL ;

-- ############################################################################ CANAL
-- CAMBIAR VALOR A NULL
UPDATE promo_code_channel
SET id_canal = NULL
where id_canal = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM promo_code_channel
WHERE id_canal NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE promo_code_channel
ADD CONSTRAINT channel_fk
FOREIGN KEY (id_canal)
REFERENCES channel (id)
ON DELETE SET NULL ;




-- ############################################################################ PROMO CODE
-- CAMBIAR VALOR A NULL
UPDATE promo_code_has_product_types
SET promo_code_id = NULL
where promo_code_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM promo_code_has_product_types
WHERE promo_code_id NOT IN (
    SELECT id FROM promo_code
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE promo_code_has_product_types
ADD CONSTRAINT promo_code_fk
FOREIGN KEY (promo_code_id)
REFERENCES promo_code (id)
ON DELETE SET NULL ;

-- ############################################################################ PRODUCTS
-- CAMBIAR VALOR A NULL
UPDATE promo_code_has_product_types
SET product_type_id = NULL
where product_type_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM promo_code_has_product_types
WHERE product_type_id NOT IN (
    SELECT id FROM products
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE promo_code_has_product_types
ADD CONSTRAINT products_fk
FOREIGN KEY (product_type_id)
REFERENCES products (id)
ON DELETE SET NULL ;




-- ############################################################################ PRODUCTS
-- CAMBIAR VALOR A NULL
UPDATE promo_code_season_product
SET id_promo_code_channel = NULL
where id_promo_code_channel = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM promo_code_season_product
WHERE id_promo_code_channel NOT IN (
    SELECT id FROM promo_code_channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE promo_code_season_product
ADD CONSTRAINT promo_code_channel_fk
FOREIGN KEY (id_promo_code_channel)
REFERENCES promo_code_channel (id)
ON DELETE SET NULL ;




-- ############################################################################ PROMO CODE
-- CAMBIAR VALOR A NULL
UPDATE "promoCode_channel"
SET id_promo_code = NULL
where id_promo_code = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM "promoCode_channel"
WHERE id_promo_code NOT IN (
    SELECT id FROM promo_code
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE "promoCode_channel"
ADD CONSTRAINT promo_code_fk
FOREIGN KEY (id_promo_code)
REFERENCES promo_code (id)
ON DELETE CASCADE ;

-- ############################################################################ CANAL
-- CAMBIAR VALOR A NULL
UPDATE "promoCode_channel"
SET id_canal = NULL
where id_canal = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM "promoCode_channel"
WHERE id_canal NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE "promoCode_channel"
ADD CONSTRAINT channel_fk
FOREIGN KEY (id_canal)
REFERENCES channel (id)
ON DELETE CASCADE ;




-- ############################################################################ CITY
-- CAMBIAR VALOR A NULL
UPDATE provider
SET city_id = NULL
where city_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM provider
WHERE city_id NOT IN (
    SELECT id FROM city
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE provider
ADD CONSTRAINT city_fk
FOREIGN KEY (city_id)
REFERENCES city (id)
ON DELETE CASCADE ;

-- ############################################################################ REGION
-- CAMBIAR VALOR A NULL
UPDATE provider
SET estado_id = NULL
where estado_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM provider
WHERE estado_id NOT IN (
    SELECT id FROM region
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE provider
ADD CONSTRAINT region_fk
FOREIGN KEY (estado_id)
REFERENCES region (id)
ON DELETE CASCADE ;

-- ############################################################################ COUNTRY
-- CAMBIAR VALOR A NULL
UPDATE provider
SET pais_id = NULL
where pais_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM provider
WHERE pais_id NOT IN (
    SELECT id FROM country
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE provider
ADD CONSTRAINT country_fk
FOREIGN KEY (pais_id)
REFERENCES country (id)
ON DELETE CASCADE ;




-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE provider_contacs
SET provider_id = NULL
where provider_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM provider_contacs
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE provider_contacs
ADD CONSTRAINT provider_fk
FOREIGN KEY (provider_id)
REFERENCES provider (id)
ON DELETE CASCADE ;




-- ############################################################################ LLAVE PRIMARIA
alter table provider_rappels
    add constraint provider_rappels_pk
        primary key (id);

-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE provider_rappels
SET provider_id = NULL
where provider_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM provider_rappels
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE provider_rappels
ADD CONSTRAINT provider_fk
FOREIGN KEY (provider_id)
REFERENCES provider (id)
ON DELETE CASCADE ;

-- ############################################################################ CURRENCY
-- CAMBIAR VALOR A NULL
UPDATE provider_rappels
SET currency_id = NULL
where currency_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM provider_rappels
WHERE currency_id NOT IN (
    SELECT id FROM currency
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE provider_rappels
ADD CONSTRAINT currency_fk
FOREIGN KEY (currency_id)
REFERENCES currency (id)
ON DELETE SET NULL ;




-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE providers_integrations
SET provider_id = NULL
where provider_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM providers_integrations
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE providers_integrations
ADD CONSTRAINT provider_fk
FOREIGN KEY (provider_id)
REFERENCES provider (id)
ON DELETE CASCADE ;




-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE region
SET country_id = NULL
where country_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM region
WHERE country_id NOT IN (
    SELECT id FROM country
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE region
ADD CONSTRAINT country_fk
FOREIGN KEY (country_id)
REFERENCES country (id)
ON DELETE CASCADE ;




-- ############################################################################ MODIFICAMOS FORENKEY DE PAYMENTS CON RESERVATIONS
ALTER TABLE history_reservation_payments
    DROP constraint history_reservation_payments_reservations_id_fk;

ALTER TABLE history_reservation_payments
    ADD constraint history_reservation_payments_reservations_id_fk
        foreign key (id_reservation) references reservations
            on delete cascade;

-- ############################################################################ TODO RESERVATIONS, DETAILS y PAYMENTS

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




-- ############################################################################ PRODUCTS METHOD
-- Cambiamos el valor de las reservas que en id_promo_code tengan 0 y lo cambiamos a null
UPDATE reservations_details_discs
SET id_metodo_producto = NULL
where id_metodo_producto = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_discs
WHERE id_metodo_producto NOT IN (
    SELECT id FROM product_method
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_discs
ADD CONSTRAINT reservations_discs__products_method_fk
FOREIGN KEY (id_metodo_producto)
REFERENCES product_method (id)
ON DELETE SET NULL ;

-- ############################################################################ PRODUCTS
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_discs
SET id_productos = NULL
where id_productos = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_discs
WHERE id_productos NOT IN (
    SELECT id FROM products
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_discs
ADD CONSTRAINT reservations_discs__products_fk
FOREIGN KEY (id_productos)
REFERENCES products (id)
ON DELETE SET NULL ;

-- ############################################################################ PROMO CODE AUTH
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_discs
SET id_promo_code_auth = NULL
where id_promo_code_auth = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_discs
WHERE id_promo_code_auth NOT IN (
    SELECT id FROM promo_code_auth
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_discs
ADD CONSTRAINT reservations_discs__promo_code_auth_fk
FOREIGN KEY (id_promo_code_auth)
REFERENCES promo_code_auth (id)
ON DELETE SET NULL ;

-- ############################################################################ PROMO CODE
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_discs
SET id_promo_code = NULL
where id_promo_code = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_discs
WHERE id_promo_code NOT IN (
    SELECT id FROM promo_code
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_discs
ADD CONSTRAINT reservations_discs__promo_code_fk
FOREIGN KEY (id_promo_code)
REFERENCES promo_code (id)
ON DELETE SET NULL ;

-- ############################################################################ PROVIDERS
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_discs
SET id_proveedor = NULL
where id_proveedor = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_discs
WHERE id_proveedor NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_discs
ADD CONSTRAINT reservations_discs__providers_fk
FOREIGN KEY (id_proveedor)
REFERENCES provider (id)
ON DELETE SET NULL ;

-- ############################################################################ SERVICES
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_discs
SET id_servicio = NULL
where id_servicio = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_discs
WHERE id_servicio NOT IN (
    SELECT id FROM tickets_rate
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_discs
ADD CONSTRAINT reservations_discs__services_fk
FOREIGN KEY (id_servicio)
REFERENCES tickets_rate (id)
ON DELETE SET NULL ;

-- ############################################################################ SUB PRODUCTS
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_discs
SET id_sub_producto = NULL
where id_sub_producto = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_discs
WHERE id_sub_producto NOT IN (
    SELECT id FROM sub_products
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_discs
ADD CONSTRAINT reservations_discs__sub_products_fk
FOREIGN KEY (id_sub_producto)
REFERENCES sub_products (id)
ON DELETE SET NULL ;

-- ############################################################################ WEB PROMOTIONS
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_discs
SET id_web_promotion_applied = NULL
where id_web_promotion_applied = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_discs
WHERE id_web_promotion_applied NOT IN (
    SELECT id FROM web_promotions
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_discs
ADD CONSTRAINT reservations_discs__web_promotion_fk
FOREIGN KEY (id_web_promotion_applied)
REFERENCES web_promotions (id)
ON DELETE SET NULL ;




-- ############################################################################ PACKAGES
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tickets
SET id_paquete = NULL
where id_paquete = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tickets
WHERE id_paquete NOT IN (
    SELECT id FROM packages_info
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tickets
ADD CONSTRAINT reservations_ticket__packages_fk
FOREIGN KEY (id_paquete)
REFERENCES packages_info (id)
ON DELETE SET NULL ;

-- ############################################################################ PRODUCTS METHOD
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tickets
SET id_metodo_producto = NULL
where id_metodo_producto = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tickets
WHERE id_metodo_producto NOT IN (
    SELECT id FROM product_method
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tickets
ADD CONSTRAINT reservations_ticket__products_method_fk
FOREIGN KEY (id_metodo_producto)
REFERENCES products (id)
ON DELETE SET NULL ;

-- ############################################################################ PRODUCTS
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tickets
SET id_productos = NULL
where id_productos = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tickets
WHERE id_productos NOT IN (
    SELECT id FROM products
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tickets
ADD CONSTRAINT reservations_ticket__products_fk
FOREIGN KEY (id_productos)
REFERENCES products (id)
ON DELETE SET NULL ;

-- ############################################################################ PROMO CODE AUTH
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tickets
SET id_promo_code_auth = NULL
where id_promo_code_auth = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tickets
WHERE id_promo_code_auth NOT IN (
    SELECT id FROM promo_code_auth
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tickets
ADD CONSTRAINT reservations_ticket__promo_code_auth_fk
FOREIGN KEY (id_promo_code_auth)
REFERENCES promo_code_auth (id)
ON DELETE SET NULL ;

-- ############################################################################ PROMO CODE
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tickets
SET id_promo_code = NULL
where id_promo_code = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tickets
WHERE id_promo_code NOT IN (
    SELECT id FROM promo_code
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tickets
ADD CONSTRAINT reservations_ticket__promo_code_fk
FOREIGN KEY (id_promo_code)
REFERENCES promo_code (id)
ON DELETE SET NULL ;

-- ############################################################################ PROVIDERS
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tickets
SET id_proveedor = NULL
where id_proveedor = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tickets
WHERE id_proveedor NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tickets
ADD CONSTRAINT reservations_ticket__providers_fk
FOREIGN KEY (id_proveedor)
REFERENCES provider (id)
ON DELETE SET NULL ;

-- ############################################################################ SERVICES
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tickets
SET id_servicio = NULL
where id_servicio = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tickets
WHERE id_servicio NOT IN (
    SELECT id FROM tickets_rate
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tickets
ADD CONSTRAINT reservations_ticket__services_fk
FOREIGN KEY (id_servicio)
REFERENCES tickets_rate (id)
ON DELETE SET NULL ;

-- ############################################################################ SUB PRODUCTO
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tickets
SET id_sub_producto = NULL
where id_sub_producto = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tickets
WHERE id_sub_producto NOT IN (
    SELECT id FROM sub_products
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tickets
ADD CONSTRAINT reservations_ticket__sub_products_fk
FOREIGN KEY (id_sub_producto)
REFERENCES sub_products (id)
ON DELETE SET NULL ;

-- ############################################################################ TIPS XCARET
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tickets
SET tips_id = NULL
where tips_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tickets
WHERE tips_id NOT IN (
    SELECT id FROM tips_xcaret
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tickets
ADD CONSTRAINT reservations_ticket__tips_xcaret_fk
FOREIGN KEY (tips_id)
REFERENCES tips_xcaret (id)
ON DELETE SET NULL;

-- ############################################################################ WEB PROMOTION
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tickets
SET id_web_promotion_applied = NULL
where id_web_promotion_applied = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tickets
WHERE id_web_promotion_applied NOT IN (
    SELECT id FROM web_promotions
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tickets
ADD CONSTRAINT reservations_ticket__web_promotion_fk
FOREIGN KEY (id_web_promotion_applied)
REFERENCES web_promotions (id)
ON DELETE SET NULL ;





-- ############################################################################ PACKAGES
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tour
SET id_paquete = NULL
where id_paquete = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tour
WHERE id_paquete NOT IN (
    SELECT id FROM packages_info
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tour
ADD CONSTRAINT reservations_tour__packages_fk
FOREIGN KEY (id_paquete)
REFERENCES packages_info (id)
ON DELETE SET NULL ;

-- ############################################################################ PRODUCTS METHOD
-- Cambiamos el valor de id_promo_code tengan 0 a null
UPDATE reservations_details_tour
SET id_metodo_producto = NULL
where id_metodo_producto = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tour
WHERE id_metodo_producto NOT IN (
    SELECT id FROM product_method
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tour
ADD CONSTRAINT reservations_tour__products_method_fk
FOREIGN KEY (id_metodo_producto)
REFERENCES product_method (id)
ON DELETE SET NULL ;


-- ############################################################################ PRODUCTS
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tour
SET id_productos = NULL
where id_productos = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tour
WHERE id_productos NOT IN (
    SELECT id FROM products
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tour
ADD CONSTRAINT reservations_tour__products_fk
FOREIGN KEY (id_productos)
REFERENCES products (id)
ON DELETE SET NULL ;

-- ############################################################################ PROMO CODE AUTH
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tour
SET id_promo_code_auth = NULL
where id_promo_code_auth = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tour
WHERE id_promo_code_auth NOT IN (
    SELECT id FROM promo_code_auth
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tour
ADD CONSTRAINT reservations_tour__promo_code_auth_fk
FOREIGN KEY (id_promo_code_auth)
REFERENCES promo_code_auth (id)
ON DELETE SET NULL ;

-- ############################################################################ PROMO CODE
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tour
SET id_promo_code = NULL
where id_promo_code = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tour
WHERE id_promo_code NOT IN (
    SELECT id FROM promo_code
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tour
ADD CONSTRAINT reservations_tour__promo_code_fk
FOREIGN KEY (id_promo_code)
REFERENCES promo_code (id)
ON DELETE SET NULL ;

-- ############################################################################ PROVIDERS
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tour
SET id_proveedor = NULL
where id_proveedor = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tour
WHERE id_proveedor NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tour
ADD CONSTRAINT reservations_tour__providers_fk
FOREIGN KEY (id_proveedor)
REFERENCES provider (id)
ON DELETE SET NULL ;

-- ############################################################################ SERVICES
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tour
SET id_servicio = NULL
where id_servicio = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tour
WHERE id_servicio NOT IN (
    SELECT id FROM tour_rate
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tour
ADD CONSTRAINT reservations_tour__services_fk
FOREIGN KEY (id_servicio)
REFERENCES tour_rate (id)
ON DELETE SET NULL ;

-- ############################################################################ SUB PRODUCTO
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tour
SET id_sub_producto = NULL
where id_sub_producto = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tour
WHERE id_sub_producto NOT IN (
    SELECT id FROM sub_products
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tour
ADD CONSTRAINT reservations_tour__sub_products_fk
FOREIGN KEY (id_sub_producto)
REFERENCES sub_products (id)
ON DELETE SET NULL ;

-- ############################################################################ TIPS XCARET
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tour
SET tips_id = NULL
where tips_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tour
WHERE tips_id NOT IN (
    SELECT id FROM tips_xcaret
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tour
ADD CONSTRAINT reservations_tour__tips_xcaret_fk
FOREIGN KEY (tips_id)
REFERENCES tips_xcaret (id)
ON DELETE SET NULL;

-- ############################################################################ WEB PROMOTION
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_tour
SET id_web_promotion_applied = NULL
where id_web_promotion_applied = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_tour
WHERE id_web_promotion_applied NOT IN (
    SELECT id FROM web_promotions
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_tour
ADD CONSTRAINT reservations_tour__web_promotion_fk
FOREIGN KEY (id_web_promotion_applied)
REFERENCES web_promotions (id)
ON DELETE SET NULL ;




-- ############################################################################ PRODUCTSS METHOD
-- Cambiamos el valor de las reservas que en id_promo_code tengan 0 y lo cambiamos a null
UPDATE reservations_details_transportation
SET id_metodo_producto = NULL
where id_metodo_producto = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_transportation
WHERE id_metodo_producto NOT IN (
    SELECT id FROM product_method
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_transportation
ADD CONSTRAINT reservations_transportation__products_method_fk
FOREIGN KEY (id_metodo_producto)
REFERENCES product_method (id)
ON DELETE SET NULL ;

-- ############################################################################ PRODUCTS
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_transportation
SET id_productos = NULL
where id_productos = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_transportation
WHERE id_productos NOT IN (
    SELECT id FROM products
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_transportation
ADD CONSTRAINT reservations_transportation__products_fk
FOREIGN KEY (id_productos)
REFERENCES products (id)
ON DELETE SET NULL ;

-- ############################################################################ PROMO CODE AUTH
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_transportation
SET id_promo_code_auth = NULL
where id_promo_code_auth = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_transportation
WHERE id_promo_code_auth NOT IN (
    SELECT id FROM promo_code_auth
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_transportation
ADD CONSTRAINT reservations_transportation__promo_code_auth_fk
FOREIGN KEY (id_promo_code_auth)
REFERENCES promo_code_auth (id)
ON DELETE SET NULL ;

-- ############################################################################ PROMO CODE
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_transportation
SET id_promo_code = NULL
where id_promo_code = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_transportation
WHERE id_promo_code NOT IN (
    SELECT id FROM promo_code
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_transportation
ADD CONSTRAINT reservations_transportation__promo_code_fk
FOREIGN KEY (id_promo_code)
REFERENCES promo_code (id)
ON DELETE SET NULL ;

-- ############################################################################ PROVIDERS
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_transportation
SET id_proveedor = NULL
where id_proveedor = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_transportation
WHERE id_proveedor NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_transportation
ADD CONSTRAINT reservations_transportation__providers_fk
FOREIGN KEY (id_proveedor)
REFERENCES provider (id)
ON DELETE SET NULL ;

-- ############################################################################ PERCENTAGE RATES
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_transportation
SET id_transportation_rates_percent = NULL
where id_transportation_rates_percent = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_transportation
WHERE id_transportation_rates_percent NOT IN (
    SELECT id FROM transportation_rates_percents
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_transportation
ADD CONSTRAINT reservations_transportation__rates_percents_fk
FOREIGN KEY (id_transportation_rates_percent)
REFERENCES transportation_rates_percents (id)
ON DELETE CASCADE ;

-- ############################################################################ TRANSPORTATION RATES
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_transportation
SET id_transportation_rates = NULL
where id_transportation_rates = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_transportation
WHERE id_transportation_rates NOT IN (
    SELECT id FROM transportation_rates
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_transportation
ADD CONSTRAINT reservations_transportation__rates_fk
FOREIGN KEY (id_transportation_rates)
REFERENCES transportation_rates (id)
ON DELETE CASCADE ;

-- ############################################################################ UNITS
-- LLEGADAS
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_transportation
SET id_unidad_llegada = NULL
where id_unidad_llegada = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_transportation
WHERE id_unidad_llegada NOT IN (
    SELECT id FROM transfer_units
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_transportation
ADD CONSTRAINT reservations_transportation_llegada__promo_code_fk
FOREIGN KEY (id_unidad_llegada)
REFERENCES transfer_units (id)
ON DELETE SET NULL ;

-- SALIDAS
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_transportation
SET id_unidad_salida = NULL
where id_unidad_salida = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_transportation
WHERE id_unidad_salida NOT IN (
    SELECT id FROM transfer_units
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_transportation
ADD CONSTRAINT reservations_transportation_salida__promo_code_fk
FOREIGN KEY (id_unidad_salida)
REFERENCES transfer_units (id)
ON DELETE SET NULL ;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE reservations_details_transportation
SET id_user_operated = NULL
where id_user_operated = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM reservations_details_transportation
WHERE id_user_operated NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE reservations_details_transportation
ADD CONSTRAINT reservations_transportation__users_fk
FOREIGN KEY (id_user_operated)
REFERENCES users (id)
ON DELETE SET NULL ;




-- ############################################################################ CURRENCY VALOR
-- CAMBIAR VALOR A NULL
UPDATE reservations_payments
SET id_currency_valor = NULL
where id_currency_valor = 0;

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




-- ############################################################################ SALES PLACE
-- CAMBIAR VALOR A NULL
UPDATE sales_location
SET sales_place_id = NULL
where sales_place_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM sales_location
WHERE sales_place_id NOT IN (
    SELECT id FROM sales_place
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE sales_location
ADD CONSTRAINT sales_place_fk
FOREIGN KEY (sales_place_id)
REFERENCES sales_place (id)
ON DELETE CASCADE ;




-- ############################################################################ CHANNEL
-- CAMBIAR VALOR A NULL
UPDATE sales_place
SET id_canal = NULL
where id_canal = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM sales_place
WHERE id_canal NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE sales_place
ADD CONSTRAINT channel_fk
FOREIGN KEY (id_canal)
REFERENCES channel (id)
ON DELETE CASCADE ;




-- ############################################################################ SALES PLACE
-- CAMBIAR VALOR A NULL
UPDATE sales_place_occupancies
SET sales_place_id = NULL
where sales_place_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM sales_place_occupancies
WHERE sales_place_id NOT IN (
    SELECT id FROM sales_place
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE sales_place_occupancies
ADD CONSTRAINT sales_place_fk
FOREIGN KEY (sales_place_id)
REFERENCES sales_place (id)
ON DELETE CASCADE ;

-- ############################################################################ HOTEL
-- CAMBIAR VALOR A NULL
UPDATE sales_place_occupancies
SET hotel_id = NULL
where hotel_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM sales_place_occupancies
WHERE hotel_id NOT IN (
    SELECT id FROM destinatios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE sales_place_occupancies
ADD CONSTRAINT destinatios_fk
FOREIGN KEY (hotel_id)
REFERENCES destinatios (id)
ON DELETE CASCADE ;

-- ############################################################################ CANAL
-- CAMBIAR VALOR A NULL
UPDATE sales_place_occupancies
SET channel_id = NULL
where channel_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM sales_place_occupancies
WHERE channel_id NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE sales_place_occupancies
ADD CONSTRAINT channel_fk
FOREIGN KEY (channel_id)
REFERENCES channel (id)
ON DELETE CASCADE ;




-- ############################################################################ CHANGE COLUMN
alter table save_booking_logs
    alter column booking_id drop not null;

alter table save_booking_logs
    alter column booking_id drop default;

alter table save_booking_logs
    alter column user_id drop not null;

alter table save_booking_logs
    alter column user_id drop default;

-- ############################################################################ RESERVATIONS
-- CAMBIAR VALOR A NULL
UPDATE save_booking_logs
SET booking_id = NULL
where booking_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM save_booking_logs
WHERE booking_id NOT IN (
    SELECT id FROM reservations
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE save_booking_logs
ADD CONSTRAINT reservations_fk
FOREIGN KEY (booking_id)
REFERENCES reservations (id)
ON DELETE CASCADE ;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE save_booking_logs
SET user_id = NULL
where user_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM save_booking_logs
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE save_booking_logs
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;




-- ############################################################################ LABELS
-- CAMBIAR VALOR A NULL
UPDATE service_label_by_pax
SET label_service_id = NULL
where label_service_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM service_label_by_pax
WHERE label_service_id NOT IN (
    SELECT id FROM labels
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE service_label_by_pax
ADD CONSTRAINT labels_fk
FOREIGN KEY (label_service_id)
REFERENCES labels (id)
ON DELETE CASCADE ;




-- ############################################################################ CHANGE COLUMN
alter table services_nim
    alter column channel_id drop not null;

alter table services_nim
    alter column channel_id drop default;

alter table services_nim
    alter column provider_id drop not null;

alter table services_nim
    alter column provider_id drop default;

-- ############################################################################ CANAL
-- CAMBIAR VALOR A NULL
UPDATE services_nim
SET channel_id = NULL
where channel_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM services_nim
WHERE channel_id NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE services_nim
ADD CONSTRAINT channel_fk
FOREIGN KEY (channel_id)
REFERENCES channel (id)
ON DELETE CASCADE ;

-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE services_nim
SET provider_id = NULL
where provider_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM services_nim
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE services_nim
ADD CONSTRAINT provider_fk
FOREIGN KEY (provider_id)
REFERENCES provider (id)
ON DELETE CASCADE ;




-- ############################################################################ USER
-- CAMBIAR VALOR A NULL
UPDATE supervisor_has_user
SET user_id = NULL
where user_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM supervisor_has_user
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE supervisor_has_user
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ SUPERVISOR
-- CAMBIAR VALOR A NULL
UPDATE supervisor_has_user
SET supervisor_id = NULL
where supervisor_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM supervisor_has_user
WHERE supervisor_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE supervisor_has_user
ADD CONSTRAINT supervisor_fk
FOREIGN KEY (supervisor_id)
REFERENCES users (id)
ON DELETE CASCADE ;




-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE supplier_invoice
SET proveedor_id = NULL
where proveedor_id = 0;


-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM supplier_invoice
WHERE proveedor_id NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE supplier_invoice
ADD CONSTRAINT provider_fk
FOREIGN KEY (proveedor_id)
REFERENCES provider (id)
ON DELETE CASCADE ;

-- ############################################################################ FORMA DE PAGO
-- CAMBIAR VALOR A NULL
UPDATE supplier_invoice
SET forma_de_pago_id = NULL
where forma_de_pago_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM supplier_invoice
WHERE forma_de_pago_id NOT IN (
    SELECT id FROM form_of_payment
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE supplier_invoice
ADD CONSTRAINT form_of_payment_fk
FOREIGN KEY (forma_de_pago_id)
REFERENCES form_of_payment (id)
ON DELETE SET NULL ;




-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE supplier_invoice_items
SET proveedor_id = NULL
where proveedor_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM supplier_invoice_items
WHERE proveedor_id NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE supplier_invoice_items
ADD CONSTRAINT provider_fk
FOREIGN KEY (proveedor_id)
REFERENCES provider (id)
ON DELETE CASCADE ;

-- ############################################################################ SUPPLICER INVOICE
-- CAMBIAR VALOR A NULL
UPDATE supplier_invoice_items
SET supplicer_invoice_id = NULL
where supplicer_invoice_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM supplier_invoice_items
WHERE supplicer_invoice_id NOT IN (
    SELECT id FROM supplier_invoice
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE supplier_invoice_items
ADD CONSTRAINT supplier_invoice_fk
FOREIGN KEY (supplicer_invoice_id)
REFERENCES supplier_invoice (id)
ON DELETE CASCADE ;

-- ############################################################################ CHANNEL
-- CAMBIAR VALOR A NULL
UPDATE supplier_invoice_items
SET canal_id = NULL
where canal_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM supplier_invoice_items
WHERE canal_id NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE supplier_invoice_items
ADD CONSTRAINT channel_fk
FOREIGN KEY (canal_id)
REFERENCES channel (id)
ON DELETE CASCADE ;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE supplier_invoice_items
SET user_id = NULL
where user_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM supplier_invoice_items
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE supplier_invoice_items
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ RESERVATIONS
-- CAMBIAR VALOR A NULL
UPDATE supplier_invoice_items
SET localizador = NULL
where localizador = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM supplier_invoice_items
WHERE localizador NOT IN (
    SELECT id FROM reservations
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE supplier_invoice_items
ADD CONSTRAINT reservations_fk
FOREIGN KEY (localizador)
REFERENCES reservations (id)
ON DELETE CASCADE ;




-- ############################################################################ CHANGE COLUMN
alter table ticket_seasons_has_providers
    alter column ticket_season_id drop not null;

alter table ticket_seasons_has_providers
    alter column ticket_season_id drop default;

alter table ticket_seasons_has_providers
    alter column provider_id drop not null;

alter table ticket_seasons_has_providers
    alter column provider_id drop default;

-- ############################################################################ SEASON
-- CAMBIAR VALOR A NULL
UPDATE ticket_seasons_has_providers
SET ticket_season_id = NULL
where ticket_season_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM ticket_seasons_has_providers
WHERE ticket_season_id NOT IN (
    SELECT id FROM tickets_season
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE ticket_seasons_has_providers
ADD CONSTRAINT tickets_season_fk
FOREIGN KEY (ticket_season_id)
REFERENCES tickets_season (id)
ON DELETE CASCADE ;

-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE ticket_seasons_has_providers
SET provider_id = NULL
where provider_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM ticket_seasons_has_providers
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE ticket_seasons_has_providers
ADD CONSTRAINT provider_fk
FOREIGN KEY (provider_id)
REFERENCES provider (id)
ON DELETE CASCADE ;




-- ############################################################################ TICKETS SERVICIOS
-- CAMBIAR VALOR A NULL
UPDATE ticket_service_labels
SET ticket_service_id = NULL
where ticket_service_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM ticket_service_labels
WHERE ticket_service_id NOT IN (
    SELECT id FROM tickets_servicios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE ticket_service_labels
ADD CONSTRAINT tickets_servicios_fk
FOREIGN KEY (ticket_service_id)
REFERENCES tickets_servicios (id)
ON DELETE CASCADE ;

-- ############################################################################ LABEL
-- CAMBIAR VALOR A NULL
UPDATE ticket_service_labels
SET label_id = NULL
where label_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM ticket_service_labels
WHERE label_id NOT IN (
    SELECT id FROM labels
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE ticket_service_labels
ADD CONSTRAINT labels_fk
FOREIGN KEY (label_id)
REFERENCES labels (id)
ON DELETE CASCADE ;




-- ############################################################################ SERVICES
-- CAMBIAR VALOR A NULL
UPDATE ticket_service_promo_details
SET ticket_service_id = NULL
where ticket_service_id = 0;


-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM ticket_service_promo_details
WHERE ticket_service_id NOT IN (
    SELECT id FROM tickets_servicios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE ticket_service_promo_details
ADD CONSTRAINT tickets_servicios_fk
FOREIGN KEY (ticket_service_id)
REFERENCES tickets_servicios (id)
ON DELETE CASCADE ;




-- ############################################################################ SERVICES
-- CAMBIAR VALOR A NULL
UPDATE ticket_services_rules
SET ticket_service_id = NULL
where ticket_service_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM ticket_services_rules
WHERE ticket_service_id NOT IN (
    SELECT id FROM tickets_servicios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE ticket_services_rules
ADD CONSTRAINT tickets_servicios_fk
FOREIGN KEY (ticket_service_id)
REFERENCES tickets_servicios (id)
ON DELETE CASCADE ;




-- ############################################################################ SUB PRODUCT
-- CAMBIAR VALOR A NULL
UPDATE tickets
SET id_sub_producto = NULL
where id_sub_producto = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tickets
WHERE id_sub_producto NOT IN (
    SELECT id FROM sub_products
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tickets
ADD CONSTRAINT sub_products_fk
FOREIGN KEY (id_sub_producto)
REFERENCES sub_products (id)
ON DELETE SET NULL ;

-- ############################################################################ COUNTRY
-- CAMBIAR VALOR A NULL
UPDATE tickets
SET pais_id = NULL
where pais_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tickets
WHERE pais_id NOT IN (
    SELECT id FROM country
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tickets
ADD CONSTRAINT country_fk
FOREIGN KEY (pais_id)
REFERENCES country (id)
ON DELETE SET NULL ;

-- ############################################################################ REGION
-- CAMBIAR VALOR A NULL
UPDATE tickets
SET estado_id = NULL
where estado_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tickets
WHERE estado_id NOT IN (
    SELECT id FROM region
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tickets
ADD CONSTRAINT region_fk
FOREIGN KEY (estado_id)
REFERENCES region (id)
ON DELETE SET NULL ;




-- ############################################################################ TICKETS
-- CAMBIAR VALOR A NULL
UPDATE tickets_has_category
SET id_entrada = NULL
where id_entrada = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tickets_has_category
WHERE id_entrada NOT IN (
    SELECT id FROM tickets
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tickets_has_category
ADD CONSTRAINT tickets_fk
FOREIGN KEY (id_entrada)
REFERENCES tickets (id)
ON DELETE SET NULL ;




-- ############################################################################ SERVICES
-- CAMBIAR VALOR A NULL
UPDATE tickets_has_tickets_schedule
SET tickets_id = NULL
where tickets_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tickets_has_tickets_schedule
WHERE tickets_id NOT IN (
    SELECT id FROM tickets_servicios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tickets_has_tickets_schedule
ADD CONSTRAINT tickets_servicios_fk
FOREIGN KEY (tickets_id)
REFERENCES tickets_servicios (id)
ON DELETE SET NULL ;




-- ############################################################################ SEASON
-- CAMBIAR VALOR A NULL
UPDATE tickets_rate
SET id_tickets_season = NULL
where id_tickets_season = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tickets_rate
WHERE id_tickets_season NOT IN (
    SELECT id FROM tickets_season
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tickets_rate
ADD CONSTRAINT tickets_season_fk
FOREIGN KEY (id_tickets_season)
REFERENCES tickets_season (id)
ON DELETE CASCADE;

-- ############################################################################ SERVICE
-- CAMBIAR VALOR A NULL
UPDATE tickets_rate
SET id_ticket_servicio = NULL
where id_ticket_servicio = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tickets_rate
WHERE id_ticket_servicio NOT IN (
    SELECT id FROM tickets_servicios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tickets_rate
ADD CONSTRAINT tickets_servicios_fk
FOREIGN KEY (id_ticket_servicio)
REFERENCES tickets_servicios (id)
ON DELETE CASCADE ;

-- ############################################################################ CURRENCY
-- CAMBIAR VALOR A NULL
UPDATE tickets_rate
SET id_currency = NULL
where id_currency = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tickets_rate
WHERE id_currency NOT IN (
    SELECT id FROM currency
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tickets_rate
ADD CONSTRAINT currency_fk
FOREIGN KEY (id_currency)
REFERENCES currency (id)
ON DELETE SET NULL ;





-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE tickets_season
SET provider_id = NULL
where provider_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tickets_season
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tickets_season
ADD CONSTRAINT provider_fk
FOREIGN KEY (provider_id)
REFERENCES provider (id)
ON DELETE CASCADE ;




-- ############################################################################ CHANGE COLUMN
alter table tickets_servicios
    alter column "user" type integer using "user"::integer;

-- ############################################################################ TICKETS
-- CAMBIAR VALOR A NULL
UPDATE tickets_servicios
SET id_ticket = NULL
where id_ticket = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tickets_servicios
WHERE id_ticket NOT IN (
    SELECT id FROM tickets
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tickets_servicios
ADD CONSTRAINT tickets_fk
FOREIGN KEY (id_ticket)
REFERENCES tickets (id)
ON DELETE SET NULL ;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE tickets_servicios
SET "user" = NULL
where "user" = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tickets_servicios
WHERE "user" NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tickets_servicios
ADD CONSTRAINT users_fk
FOREIGN KEY ("user")
REFERENCES users (id)
ON DELETE SET NULL ;





-- ############################################################################ SUB PRODUCTO
-- CAMBIAR VALOR A NULL
UPDATE tour
SET id_sub_producto = NULL
where id_sub_producto = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tour
WHERE id_sub_producto NOT IN (
    SELECT id FROM sub_products
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tour
ADD CONSTRAINT sub_products_fk
FOREIGN KEY (id_sub_producto)
REFERENCES sub_products (id)
ON DELETE SET NULL ;

-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE tour
SET provider_id = NULL
where provider_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tour
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tour
ADD CONSTRAINT provider_fk
FOREIGN KEY (provider_id)
REFERENCES provider (id)
ON DELETE CASCADE ;

-- ############################################################################ PAIS
-- CAMBIAR VALOR A NULL
UPDATE tour
SET pais_id = NULL
where pais_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tour
WHERE pais_id NOT IN (
    SELECT id FROM country
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tour
ADD CONSTRAINT country_fk
FOREIGN KEY (pais_id)
REFERENCES country (id)
ON DELETE SET NULL ;

-- ############################################################################ ESTADO
-- CAMBIAR VALOR A NULL
UPDATE tour
SET estado_id = NULL
where estado_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tour
WHERE estado_id NOT IN (
    SELECT id FROM region
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tour
ADD CONSTRAINT region_fk
FOREIGN KEY (estado_id)
REFERENCES region (id)
ON DELETE SET NULL ;

-- ############################################################################ CITY
-- CAMBIAR VALOR A NULL
UPDATE tour
SET city_id = NULL
where city_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tour
WHERE city_id NOT IN (
    SELECT id FROM city
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tour
ADD CONSTRAINT city_fk
FOREIGN KEY (city_id)
REFERENCES city (id)
ON DELETE SET NULL ;




-- ############################################################################ SEASON
-- CAMBIAR VALOR A NULL
UPDATE tour_rate
SET id_tour_season = NULL
where id_tour_season = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tour_rate
WHERE id_tour_season NOT IN (
    SELECT id FROM tour_season
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tour_rate
ADD CONSTRAINT tour_season_fk
FOREIGN KEY (id_tour_season)
REFERENCES tour_season (id)
ON DELETE CASCADE ;

-- ############################################################################ SERVICE
-- CAMBIAR VALOR A NULL
UPDATE tour_rate
SET id_tour_servicio = NULL
where id_tour_servicio = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tour_rate
WHERE id_tour_servicio NOT IN (
    SELECT id FROM tour_servicios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tour_rate
ADD CONSTRAINT tour_servicios_fk
FOREIGN KEY (id_tour_servicio)
REFERENCES tour_servicios (id)
ON DELETE CASCADE ;

-- ############################################################################ CURRENCY
-- CAMBIAR VALOR A NULL
UPDATE tour_rate
SET id_currency = NULL
where id_currency = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tour_rate
WHERE id_currency NOT IN (
    SELECT id FROM currency
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tour_rate
ADD CONSTRAINT currency_fk
FOREIGN KEY (id_currency)
REFERENCES currency (id)
ON DELETE CASCADE ;




-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE tour_season
SET provider_id = NULL
where provider_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tour_season
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tour_season
ADD CONSTRAINT provider_fk
FOREIGN KEY (provider_id)
REFERENCES provider (id)
ON DELETE CASCADE ;




-- ############################################################################ SEASON
-- CAMBIAR VALOR A NULL
UPDATE tour_seasons_has_providers
SET tour_season_id = NULL
where tour_season_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tour_seasons_has_providers
WHERE tour_season_id NOT IN (
    SELECT id FROM tour_season
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tour_seasons_has_providers
ADD CONSTRAINT tour_season_fk
FOREIGN KEY (tour_season_id)
REFERENCES tour_season (id)
ON DELETE CASCADE ;

-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE tour_seasons_has_providers
SET provider_id = NULL
where provider_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tour_seasons_has_providers
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tour_seasons_has_providers
ADD CONSTRAINT provider_fk
FOREIGN KEY (provider_id)
REFERENCES provider (id)
ON DELETE CASCADE ;





-- ############################################################################ SERVICE
-- CAMBIAR VALOR A NULL
UPDATE tour_service_labels
SET tour_service_id = NULL
where tour_service_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tour_service_labels
WHERE tour_service_id NOT IN (
    SELECT id FROM tour_servicios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tour_service_labels
ADD CONSTRAINT tour_servicios_fk
FOREIGN KEY (tour_service_id)
REFERENCES tour_servicios (id)
ON DELETE CASCADE ;

-- ############################################################################ LABEL
-- CAMBIAR VALOR A NULL
UPDATE tour_service_labels
SET label_id = NULL
where label_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tour_service_labels
WHERE label_id NOT IN (
    SELECT id FROM labels
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tour_service_labels
ADD CONSTRAINT labels_fk
FOREIGN KEY (label_id)
REFERENCES labels (id)
ON DELETE CASCADE ;





-- ############################################################################ SERVICE
-- CAMBIAR VALOR A NULL
UPDATE tour_service_promo_details
SET tour_service_id = NULL
where tour_service_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tour_service_promo_details
WHERE tour_service_id NOT IN (
    SELECT id FROM tour_servicios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tour_service_promo_details
ADD CONSTRAINT tour_servicios_fk
FOREIGN KEY (tour_service_id)
REFERENCES tour_servicios (id)
ON DELETE CASCADE ;




-- ############################################################################ SERVICE
-- CAMBIAR VALOR A NULL
UPDATE tour_services_rules
SET tour_service_id = NULL
where tour_service_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tour_services_rules
WHERE tour_service_id NOT IN (
    SELECT id FROM tour_servicios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tour_services_rules
ADD CONSTRAINT tour_servicios_fk
FOREIGN KEY (tour_service_id)
REFERENCES tour_servicios (id)
ON DELETE CASCADE ;





-- ############################################################################ CHANGE COLUMN
alter table tour_servicios
    alter column "user" type integer using "user"::integer;

-- ############################################################################ TOUR
-- CAMBIAR VALOR A NULL
UPDATE tour_servicios
SET id_tour = NULL
where id_tour = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tour_servicios
WHERE id_tour NOT IN (
    SELECT id FROM tour
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tour_servicios
ADD CONSTRAINT tour_fk
FOREIGN KEY (id_tour)
REFERENCES tour (id)
ON DELETE CASCADE ;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE tour_servicios
SET "user" = NULL
where "user" = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tour_servicios
WHERE "user" NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tour_servicios
ADD CONSTRAINT users_fk
FOREIGN KEY ("user")
REFERENCES users (id)
ON DELETE CASCADE ;




-- ############################################################################ SERVICE
-- CAMBIAR VALOR A NULL
UPDATE tours_services_availability_users
SET tours_service_id = NULL
where tours_service_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tours_services_availability_users
WHERE tours_service_id NOT IN (
    SELECT id FROM tour_servicios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tours_services_availability_users
ADD CONSTRAINT tour_servicios_fk
FOREIGN KEY (tours_service_id)
REFERENCES tour_servicios (id)
ON DELETE CASCADE ;

-- ############################################################################ USER
-- CAMBIAR VALOR A NULL
UPDATE tours_services_availability_users
SET user_id = NULL
where user_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM tours_services_availability_users
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE tours_services_availability_users
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;




-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE transfer_units
SET id_proveedor = NULL
where id_proveedor = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM transfer_units
WHERE id_proveedor NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE transfer_units
ADD CONSTRAINT provider_fk
FOREIGN KEY (id_proveedor)
REFERENCES provider (id)
ON DELETE CASCADE ;





-- ############################################################################ RESERVATIONS
-- CAMBIAR VALOR A NULL
UPDATE transportacion_grupos
SET id_reserva = NULL
where id_reserva = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM transportacion_grupos
WHERE id_reserva NOT IN (
    SELECT id FROM reservations
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE transportacion_grupos
ADD CONSTRAINT reservations_fk
FOREIGN KEY (id_reserva)
REFERENCES reservations (id)
ON DELETE CASCADE ;





-- ############################################################################ RATES PERCENT
-- CAMBIAR VALOR A NULL
UPDATE transportation_percent_users
SET transportation_rates_percent_id = NULL
where transportation_rates_percent_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM transportation_percent_users
WHERE transportation_rates_percent_id NOT IN (
    SELECT id FROM transportation_rates_percents
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE transportation_percent_users
ADD CONSTRAINT transportation_rates_percents_fk
FOREIGN KEY (transportation_rates_percent_id)
REFERENCES transportation_rates_percents (id)
ON DELETE CASCADE ;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE transportation_percent_users
SET user_id = NULL
where user_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM transportation_percent_users
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE transportation_percent_users
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;




-- ############################################################################ ZONE
-- CAMBIAR VALOR A NULL
UPDATE transportation_rates
SET id_zona_transportacion = NULL
where id_zona_transportacion = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM transportation_rates
WHERE id_zona_transportacion NOT IN (
    SELECT id FROM transport_zones
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE transportation_rates
ADD CONSTRAINT transport_zones_fk
FOREIGN KEY (id_zona_transportacion)
REFERENCES transport_zones (id)
ON DELETE SET NULL ;

-- ############################################################################ UNIT
-- CAMBIAR VALOR A NULL
UPDATE transportation_rates
SET id_unidad_traslado = NULL
where id_unidad_traslado = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM transportation_rates
WHERE id_unidad_traslado NOT IN (
    SELECT id FROM transfer_units
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE transportation_rates
ADD CONSTRAINT transfer_units_fk
FOREIGN KEY (id_unidad_traslado)
REFERENCES transfer_units (id)
ON DELETE CASCADE ;

-- ############################################################################ SEASON
-- CAMBIAR VALOR A NULL
UPDATE transportation_rates
SET id_transportacion_season = NULL
where id_transportacion_season = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM transportation_rates
WHERE id_transportacion_season NOT IN (
    SELECT id FROM transportation_season
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE transportation_rates
ADD CONSTRAINT transportation_season_fk
FOREIGN KEY (id_transportacion_season)
REFERENCES transportation_season (id)
ON DELETE CASCADE ;


-- ############################################################################ METODO
-- CAMBIAR VALOR A NULL
UPDATE transportation_rates
SET id_metodo_producto = NULL
where id_metodo_producto = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM transportation_rates
WHERE id_metodo_producto NOT IN (
    SELECT id FROM product_method
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE transportation_rates
ADD CONSTRAINT product_method_fk
FOREIGN KEY (id_metodo_producto)
REFERENCES product_method (id)
ON DELETE SET NULL ;

-- ############################################################################ CURRENCY
-- CAMBIAR VALOR A NULL
UPDATE transportation_rates
SET id_currency = NULL
where id_currency = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM transportation_rates
WHERE id_currency NOT IN (
    SELECT id FROM currency
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE transportation_rates
ADD CONSTRAINT currency_fk
FOREIGN KEY (id_currency)
REFERENCES currency (id)
ON DELETE SET NULL ;




-- ############################################################################ CHANNEL
-- CAMBIAR VALOR A NULL
UPDATE transportation_rates_percents
SET canal_id = NULL
where canal_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM transportation_rates_percents
WHERE canal_id NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE transportation_rates_percents
ADD CONSTRAINT channel_fk
FOREIGN KEY (canal_id)
REFERENCES channel (id)
ON DELETE SET NULL ;

-- ############################################################################ RATES
-- CAMBIAR VALOR A NULL
UPDATE transportation_rates_percents
SET transportation_rates_id = NULL
where transportation_rates_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM transportation_rates_percents
WHERE transportation_rates_id NOT IN (
    SELECT id FROM transportation_rates
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE transportation_rates_percents
ADD CONSTRAINT transportation_rates_fk
FOREIGN KEY (transportation_rates_id)
REFERENCES transportation_rates (id)
ON DELETE CASCADE ;




-- ############################################################################ SALE LEAGUES
-- CAMBIAR VALOR A NULL
UPDATE user_by_leagues
SET sale_league_id = NULL
where sale_league_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM user_by_leagues
WHERE sale_league_id NOT IN (
    SELECT id FROM sales_leagues
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE user_by_leagues
ADD CONSTRAINT sales_leagues_fk
FOREIGN KEY (sale_league_id)
REFERENCES sales_leagues (id)
ON DELETE CASCADE ;

-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE user_by_leagues
SET user_id = NULL
where user_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM user_by_leagues
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE user_by_leagues
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;





-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE user_goals
SET user_id = NULL
where user_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM user_goals
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE user_goals
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ CHANNEL
-- CAMBIAR VALOR A NULL
UPDATE user_goals
SET channel_id = NULL
where channel_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM user_goals
WHERE channel_id NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE user_goals
ADD CONSTRAINT channel_fk
FOREIGN KEY (channel_id)
REFERENCES channel (id)
ON DELETE CASCADE ;




-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE user_has_channel
SET id_user = NULL
where id_user = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM user_has_channel
WHERE id_user NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE user_has_channel
ADD CONSTRAINT users_fk
FOREIGN KEY (id_user)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ CHANNEl
-- CAMBIAR VALOR A NULL
UPDATE user_has_channel
SET id_canal = NULL
where id_canal = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM user_has_channel
WHERE id_canal NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE user_has_channel
ADD CONSTRAINT channel_fk
FOREIGN KEY (id_canal)
REFERENCES channel (id)
ON DELETE CASCADE ;

-- ############################################################################ PRODUCTS
-- CAMBIAR VALOR A NULL
UPDATE user_has_channel
SET id_producto = NULL
where id_producto = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM user_has_channel
WHERE id_producto NOT IN (
    SELECT id FROM products
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE user_has_channel
ADD CONSTRAINT products_fk
FOREIGN KEY (id_producto)
REFERENCES products (id)
ON DELETE CASCADE ;




-- ############################################################################ USERS HAS CHANNEL
-- CAMBIAR VALOR A NULL
UPDATE user_has_metodo_producto
SET id_user_has_channel = NULL
where id_user_has_channel = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM user_has_metodo_producto
WHERE id_user_has_channel NOT IN (
    SELECT id FROM user_has_channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE user_has_metodo_producto
ADD CONSTRAINT user_has_channel_fk
FOREIGN KEY (id_user_has_channel)
REFERENCES user_has_channel (id)
ON DELETE CASCADE ;

-- ############################################################################ METHOD PRODUCT
-- CAMBIAR VALOR A NULL
UPDATE user_has_metodo_producto
SET id_metodo_producto = NULL
where id_metodo_producto = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM user_has_metodo_producto
WHERE id_metodo_producto NOT IN (
    SELECT id FROM product_method
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE user_has_metodo_producto
ADD CONSTRAINT product_method_fk
FOREIGN KEY (id_metodo_producto)
REFERENCES product_method (id)
ON DELETE CASCADE ;




-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE user_has_permissions
SET user_id = NULL
where user_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM user_has_permissions
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE user_has_permissions
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ PERMISSIONS
-- CAMBIAR VALOR A NULL
UPDATE user_has_permissions
SET permission_id = NULL
where permission_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM user_has_permissions
WHERE permission_id NOT IN (
    SELECT id FROM permissions
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE user_has_permissions
ADD CONSTRAINT permissions_fk
FOREIGN KEY (permission_id)
REFERENCES permissions (id)
ON DELETE CASCADE ;




-- ############################################################################ USERS AHS PRODUCTS
-- CAMBIAR VALOR A NULL
UPDATE user_has_servicios
SET id_user_has_metodo_producto = NULL
where id_user_has_metodo_producto = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM user_has_servicios
WHERE id_user_has_metodo_producto NOT IN (
    SELECT id FROM user_has_metodo_producto
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE user_has_servicios
ADD CONSTRAINT user_has_metodo_producto_fk
FOREIGN KEY (id_user_has_metodo_producto)
REFERENCES user_has_metodo_producto (id)
ON DELETE CASCADE ;




-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE users
SET id_proveedor = NULL
where id_proveedor = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM users
WHERE id_proveedor NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE users
ADD CONSTRAINT provider_fk
FOREIGN KEY (id_proveedor)
REFERENCES provider (id)
ON DELETE CASCADE ;

-- ############################################################################ CONTACT
-- CAMBIAR VALOR A NULL
UPDATE users
SET id_contact_user_agency = NULL
where id_contact_user_agency = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM users
WHERE id_contact_user_agency NOT IN (
    SELECT id FROM contact
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE users
ADD CONSTRAINT contact_fk
FOREIGN KEY (id_contact_user_agency)
REFERENCES contact (id)
ON DELETE SET NULL ;

-- ############################################################################ DESTINATIOS
-- CAMBIAR VALOR A NULL
UPDATE users
SET id_hotel = NULL
where id_hotel = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM users
WHERE id_hotel NOT IN (
    SELECT id FROM destinatios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE users
ADD CONSTRAINT destinatios_fk
FOREIGN KEY (id_hotel)
REFERENCES destinatios (id)
ON DELETE CASCADE ;




-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE users_provider
SET user_id = NULL
where user_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM users_provider
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE users_provider
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE users_provider
SET provider_id = NULL
where provider_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM users_provider
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE users_provider
ADD CONSTRAINT provider_fk
FOREIGN KEY (provider_id)
REFERENCES provider (id)
ON DELETE CASCADE ;





-- ############################################################################ WEB DISCS
-- CAMBIAR VALOR A NULL
UPDATE web_activity_disc
SET web_disc_id = NULL
where web_disc_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_activity_disc
WHERE web_disc_id NOT IN (
    SELECT id FROM web_discs
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_activity_disc
ADD CONSTRAINT web_discs_fk
FOREIGN KEY (web_disc_id)
REFERENCES web_discs (id)
ON DELETE CASCADE ;

-- ############################################################################ WEB ACTIVITY
-- CAMBIAR VALOR A NULL
UPDATE web_activity_disc
SET web_activity_id = NULL
where web_disc_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_activity_disc
WHERE web_activity_id NOT IN (
    SELECT id FROM web_activities
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_activity_disc
ADD CONSTRAINT web_activities_fk
FOREIGN KEY (web_activity_id)
REFERENCES web_activities (id)
ON DELETE CASCADE ;




-- ############################################################################ WEB PARKS
-- CAMBIAR VALOR A NULL
UPDATE web_activity_park
SET web_park_id = NULL
where web_park_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_activity_park
WHERE web_park_id NOT IN (
    SELECT id FROM web_parks
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_activity_park
ADD CONSTRAINT web_parks_fk
FOREIGN KEY (web_park_id)
REFERENCES web_parks (id)
ON DELETE CASCADE ;

-- ############################################################################ WEB ACTIVITIES
-- CAMBIAR VALOR A NULL
UPDATE web_activity_park
SET web_activity_id = NULL
where web_activity_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_activity_park
WHERE web_activity_id NOT IN (
    SELECT id FROM web_activities
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_activity_park
ADD CONSTRAINT web_activities_fk
FOREIGN KEY (web_activity_id)
REFERENCES web_activities (id)
ON DELETE CASCADE ;




-- ############################################################################ CHANGE COLUMN
alter table web_background_discs
    add constraint web_background_discs_pk
        primary key (id);

-- ############################################################################ WEB DISC
-- CAMBIAR VALOR A NULL
UPDATE web_background_discs
SET web_disc_id = NULL
where web_disc_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_background_discs
WHERE web_disc_id NOT IN (
    SELECT id FROM web_discs
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_background_discs
ADD CONSTRAINT web_discs_fk
FOREIGN KEY (web_disc_id)
REFERENCES web_discs (id)
ON DELETE CASCADE ;




-- ############################################################################ WEB PARK
-- CAMBIAR VALOR A NULL
UPDATE web_background_parks
SET web_park_id = NULL
where web_park_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_background_parks
WHERE web_park_id NOT IN (
    SELECT id FROM web_parks
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_background_parks
ADD CONSTRAINT web_parks_fk
FOREIGN KEY (web_park_id)
REFERENCES web_parks (id)
ON DELETE CASCADE ;




-- ############################################################################ WEB PROMO
-- CAMBIAR VALOR A NULL
UPDATE web_background_promos
SET web_promo_id = NULL
where web_promo_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_background_promos
WHERE web_promo_id NOT IN (
    SELECT id FROM web_promos
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_background_promos
ADD CONSTRAINT web_promos_fk
FOREIGN KEY (web_promo_id)
REFERENCES web_promos (id)
ON DELETE CASCADE ;





-- ############################################################################ WEB DISC
-- CAMBIAR VALOR A NULL
UPDATE web_category_disc
SET web_disc_id = NULL
where web_disc_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_category_disc
WHERE web_disc_id NOT IN (
    SELECT id FROM web_discs
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_category_disc
ADD CONSTRAINT web_discs_fk
FOREIGN KEY (web_disc_id)
REFERENCES web_discs (id)
ON DELETE CASCADE ;

-- ############################################################################ WEB CATEGORY
-- CAMBIAR VALOR A NULL
UPDATE web_category_disc
SET web_category_id = NULL
where web_category_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_category_disc
WHERE web_category_id NOT IN (
    SELECT id FROM web_categories
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_category_disc
ADD CONSTRAINT web_categories_fk
FOREIGN KEY (web_category_id)
REFERENCES web_categories (id)
ON DELETE CASCADE ;





-- ############################################################################ WEB CATEGORIES
-- CAMBIAR VALOR A NULL
UPDATE web_category_park
SET web_category_id = NULL
where web_category_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_category_park
WHERE web_category_id NOT IN (
    SELECT id FROM web_categories
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_category_park
ADD CONSTRAINT web_categories_fk
FOREIGN KEY (web_category_id)
REFERENCES web_categories (id)
ON DELETE CASCADE ;

-- ############################################################################ WEB PARKS
-- CAMBIAR VALOR A NULL
UPDATE web_category_park
SET web_park_id = NULL
where web_park_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_category_park
WHERE web_park_id NOT IN (
    SELECT id FROM web_parks
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_category_park
ADD CONSTRAINT web_parks_fk
FOREIGN KEY (web_park_id)
REFERENCES web_parks (id)
ON DELETE CASCADE ;





-- ############################################################################ WEB PARKS
-- CAMBIAR VALOR A NULL
UPDATE web_city_park
SET web_park_id = NULL
where web_park_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_city_park
WHERE web_park_id NOT IN (
    SELECT id FROM web_parks
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_city_park
ADD CONSTRAINT web_parks_fk
FOREIGN KEY (web_park_id)
REFERENCES web_parks (id)
ON DELETE CASCADE ;

-- ############################################################################ CITY
-- CAMBIAR VALOR A NULL
UPDATE web_city_park
SET city_id = NULL
where city_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_city_park
WHERE city_id NOT IN (
    SELECT id FROM city
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_city_park
ADD CONSTRAINT city_fk
FOREIGN KEY (city_id)
REFERENCES city (id)
ON DELETE CASCADE ;





-- ############################################################################ RESERVATIONS
-- CAMBIAR VALOR A NULL
UPDATE web_credit_card
SET reservation_id = NULL
where reservation_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_credit_card
WHERE reservation_id NOT IN (
    SELECT id FROM reservations
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_credit_card
ADD CONSTRAINT reservations_fk
FOREIGN KEY (reservation_id)
REFERENCES reservations (id)
ON DELETE CASCADE ;





-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE web_details_transportation
SET id_user = NULL
where id_user = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_details_transportation
WHERE id_user NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_details_transportation
ADD CONSTRAINT users_fk
FOREIGN KEY (id_user)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ CHANNEL
-- CAMBIAR VALOR A NULL
UPDATE web_details_transportation
SET id_canal = NULL
where id_canal = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_details_transportation
WHERE id_canal NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_details_transportation
ADD CONSTRAINT channel_fk
FOREIGN KEY (id_canal)
REFERENCES channel (id)
ON DELETE CASCADE ;

-- ############################################################################ UNITS
-- CAMBIAR VALOR A NULL
UPDATE web_details_transportation
SET id_unidad = NULL
where id_unidad = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_details_transportation
WHERE id_unidad NOT IN (
    SELECT id FROM transfer_units
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_details_transportation
ADD CONSTRAINT transfer_units_fk
FOREIGN KEY (id_unidad)
REFERENCES transfer_units (id)
ON DELETE CASCADE ;





-- ############################################################################ WEB DISC
-- CAMBIAR VALOR A NULL
UPDATE web_disc_attractions
SET web_disc_id = NULL
where web_disc_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_disc_attractions
WHERE web_disc_id NOT IN (
    SELECT id FROM web_discs
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_disc_attractions
ADD CONSTRAINT web_discs_fk
FOREIGN KEY (web_disc_id)
REFERENCES web_discs (id)
ON DELETE CASCADE ;





-- ############################################################################ WEB DISCS
-- CAMBIAR VALOR A NULL
UPDATE web_disc_services
SET web_disc_id = NULL
where web_disc_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_disc_services
WHERE web_disc_id NOT IN (
    SELECT id FROM web_discs
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_disc_services
ADD CONSTRAINT web_discs_fk
FOREIGN KEY (web_disc_id)
REFERENCES web_discs (id)
ON DELETE CASCADE ;

-- ############################################################################ DISC SERVICES
-- CAMBIAR VALOR A NULL
UPDATE web_disc_services
SET disc_service_id = NULL
where disc_service_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_disc_services
WHERE disc_service_id NOT IN (
    SELECT id FROM discs_servicios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_disc_services
ADD CONSTRAINT discs_servicios_fk
FOREIGN KEY (disc_service_id)
REFERENCES discs_servicios (id)
ON DELETE CASCADE ;

-- ############################################################################ PROVIDER
-- CAMBIAR VALOR A NULL
UPDATE web_disc_services
SET provider_id = NULL
where provider_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_disc_services
WHERE provider_id NOT IN (
    SELECT id FROM provider
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_disc_services
ADD CONSTRAINT provider_fk
FOREIGN KEY (provider_id)
REFERENCES provider (id)
ON DELETE CASCADE ;






-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE web_discs
SET user_id = NULL
where user_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_discs
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_discs
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ CHANNEL
-- CAMBIAR VALOR A NULL
UPDATE web_discs
SET channel_id = NULL
where channel_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_discs
WHERE channel_id NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_discs
ADD CONSTRAINT channel_fk
FOREIGN KEY (channel_id)
REFERENCES channel (id)
ON DELETE CASCADE ;

-- ############################################################################ CITY
-- CAMBIAR VALOR A NULL
UPDATE web_discs
SET city_id = NULL
where city_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_discs
WHERE city_id NOT IN (
    SELECT id FROM city
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_discs
ADD CONSTRAINT city_fk
FOREIGN KEY (city_id)
REFERENCES city (id)
ON DELETE CASCADE ;





-- ############################################################################ WEB PARK
-- CAMBIAR VALOR A NULL
UPDATE web_galleries
SET web_park_id = NULL
where web_park_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_galleries
WHERE web_park_id NOT IN (
    SELECT id FROM web_parks
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_galleries
ADD CONSTRAINT web_parks_fk
FOREIGN KEY (web_park_id)
REFERENCES web_parks (id)
ON DELETE CASCADE ;





-- ############################################################################ WEB DISCS
-- CAMBIAR VALOR A NULL
UPDATE web_galleries_discs
SET web_disc_id = NULL
where web_disc_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_galleries_discs
WHERE web_disc_id NOT IN (
    SELECT id FROM web_discs
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_galleries_discs
ADD CONSTRAINT web_discs_fk
FOREIGN KEY (web_disc_id)
REFERENCES web_discs (id)
ON DELETE CASCADE ;





-- ############################################################################ WEB LANDINGS
-- CAMBIAR VALOR A NULL
UPDATE web_galleries_landings
SET web_landing_id = NULL
where web_landing_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_galleries_landings
WHERE web_landing_id NOT IN (
    SELECT id FROM web_landings
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_galleries_landings
ADD CONSTRAINT web_landings_fk
FOREIGN KEY (web_landing_id)
REFERENCES web_landings (id)
ON DELETE CASCADE ;





-- ############################################################################ SALES PLACE
-- CAMBIAR VALOR A NULL
UPDATE web_landings
SET type_landing_id = NULL
where type_landing_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_landings
WHERE type_landing_id NOT IN (
    SELECT id FROM sales_place
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_landings
ADD CONSTRAINT sales_place_fk
FOREIGN KEY (type_landing_id)
REFERENCES sales_place (id)
ON DELETE CASCADE ;

-- ############################################################################ SEASON
-- CAMBIAR VALOR A NULL
UPDATE web_landings
SET season_id = NULL
where season_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_landings
WHERE season_id NOT IN (
    SELECT id FROM transportation_season
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_landings
ADD CONSTRAINT transportation_season_fk
FOREIGN KEY (season_id)
REFERENCES transportation_season (id)
ON DELETE CASCADE ;

-- ############################################################################ GROUP
-- CAMBIAR VALOR A NULL
UPDATE web_landings
SET group_id = NULL
where group_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_landings
WHERE group_id NOT IN (
    SELECT id FROM sales_location
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_landings
ADD CONSTRAINT sales_location_fk
FOREIGN KEY (group_id)
REFERENCES sales_location (id)
ON DELETE CASCADE ;





-- ############################################################################ WEB LANDINGS
-- CAMBIAR VALOR A NULL
UPDATE web_main_galleries_landings
SET web_landing_id = NULL
where web_landing_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_main_galleries_landings
WHERE web_landing_id NOT IN (
    SELECT id FROM web_landings
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_main_galleries_landings
ADD CONSTRAINT web_landings_fk
FOREIGN KEY (web_landing_id)
REFERENCES web_landings (id)
ON DELETE CASCADE ;





-- ############################################################################ WEB PARKS
-- CAMBIAR VALOR A NULL
UPDATE web_park_attractions
SET web_park_id = NULL
where web_park_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_park_attractions
WHERE web_park_id NOT IN (
    SELECT id FROM web_parks
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_park_attractions
ADD CONSTRAINT web_parks_fk
FOREIGN KEY (web_park_id)
REFERENCES web_parks (id)
ON DELETE CASCADE ;





-- ############################################################################ SCHEDULES
-- CAMBIAR VALOR A NULL
UPDATE web_park_services_assign_schedules
SET id_schedule = NULL
where id_schedule = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_park_services_assign_schedules
WHERE id_schedule NOT IN (
    SELECT id FROM web_park_services_schedules
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_park_services_assign_schedules
ADD CONSTRAINT web_park_services_schedules_fk
FOREIGN KEY (id_schedule)
REFERENCES web_park_services_schedules (id)
ON DELETE CASCADE ;

-- ############################################################################ DESTINATIOS
-- CAMBIAR VALOR A NULL
UPDATE web_park_services_assign_schedules
SET id_hotel = NULL
where id_hotel = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_park_services_assign_schedules
WHERE id_hotel NOT IN (
    SELECT id FROM destinatios
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_park_services_assign_schedules
ADD CONSTRAINT destinatios_fk
FOREIGN KEY (id_hotel)
REFERENCES destinatios (id)
ON DELETE SET NULL ;





-- ############################################################################ PARKS
-- CAMBIAR VALOR A NULL
UPDATE web_park_services_schedules
SET id_park = NULL
where id_park = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_park_services_schedules
WHERE id_park NOT IN (
    SELECT id FROM web_parks
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_park_services_schedules
ADD CONSTRAINT web_parks_fk
FOREIGN KEY (id_park)
REFERENCES web_parks (id)
ON DELETE CASCADE ;





-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE web_parks
SET user_id = NULL
where user_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_parks
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_parks
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ CHANNEL
-- CAMBIAR VALOR A NULL
UPDATE web_parks
SET channel_id = NULL
where channel_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_parks
WHERE channel_id NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_parks
ADD CONSTRAINT channel_fk
FOREIGN KEY (channel_id)
REFERENCES channel (id)
ON DELETE CASCADE ;

-- ############################################################################ CITY
-- CAMBIAR VALOR A NULL
UPDATE web_parks
SET city_id = NULL
where city_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_parks
WHERE city_id NOT IN (
    SELECT id FROM city
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_parks
ADD CONSTRAINT city_fk
FOREIGN KEY (city_id)
REFERENCES city (id)
ON DELETE SET NULL ;

-- ############################################################################ PACKAGES
-- CAMBIAR VALOR A NULL
UPDATE web_parks
SET id_package = NULL
where id_package = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_parks
WHERE id_package NOT IN (
    SELECT id FROM packages_info
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_parks
ADD CONSTRAINT packages_info_fk
FOREIGN KEY (id_package)
REFERENCES packages_info (id)
ON DELETE SET NULL ;





-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE web_promos
SET user_id = NULL
where user_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_promos
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_promos
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;


-- ############################################################################ CHANNEL
-- CAMBIAR VALOR A NULL
UPDATE web_promos
SET channel_id = NULL
where channel_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_promos
WHERE channel_id NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_promos
ADD CONSTRAINT channel_fk
FOREIGN KEY (channel_id)
REFERENCES channel (id)
ON DELETE CASCADE ;

-- ############################################################################ CITY
-- CAMBIAR VALOR A NULL
UPDATE web_promos
SET city_id = NULL
where city_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_promos
WHERE city_id NOT IN (
    SELECT id FROM city
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_promos
ADD CONSTRAINT city_fk
FOREIGN KEY (city_id)
REFERENCES city (id)
ON DELETE CASCADE ;





-- ############################################################################ USERS
-- CAMBIAR VALOR A NULL
UPDATE web_promotions
SET user_id = NULL
where user_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_promotions
WHERE user_id NOT IN (
    SELECT id FROM users
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_promotions
ADD CONSTRAINT users_fk
FOREIGN KEY (user_id)
REFERENCES users (id)
ON DELETE CASCADE ;

-- ############################################################################ CHANNEL
-- CAMBIAR VALOR A NULL
UPDATE web_promotions
SET channel_id = NULL
where channel_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_promotions
WHERE channel_id NOT IN (
    SELECT id FROM channel
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_promotions
ADD CONSTRAINT channel_fk
FOREIGN KEY (channel_id)
REFERENCES channel (id)
ON DELETE CASCADE ;

-- ############################################################################ WEB PROMOTIONS
-- CAMBIAR VALOR A NULL
UPDATE web_promotions
SET web_promotion_type_id = NULL
where web_promotion_type_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_promotions
WHERE web_promotion_type_id NOT IN (
    SELECT id FROM web_promotions_type
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_promotions
ADD CONSTRAINT web_promotions_type_fk
FOREIGN KEY (web_promotion_type_id)
REFERENCES web_promotions_type (id)
ON DELETE CASCADE ;





-- ############################################################################ COLUMN CHANGES
alter table web_promotions_disc_services
    add constraint web_promotions_disc_services_pk
        primary key (id);

-- ############################################################################ WEB PROMOTION
-- CAMBIAR VALOR A NULL
UPDATE web_promotions_disc_services
SET web_promotion_id = NULL
where web_promotion_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_promotions_disc_services
WHERE web_promotion_id NOT IN (
    SELECT id FROM web_promotions
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_promotions_disc_services
ADD CONSTRAINT web_promotions_fk
FOREIGN KEY (web_promotion_id)
REFERENCES web_promotions (id)
ON DELETE CASCADE ;

-- ############################################################################ WEB SERVICES
-- CAMBIAR VALOR A NULL
UPDATE web_promotions_disc_services
SET web_service_id = NULL
where web_service_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_promotions_disc_services
WHERE web_service_id NOT IN (
    SELECT id FROM web_services
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_promotions_disc_services
ADD CONSTRAINT web_services_fk
FOREIGN KEY (web_service_id)
REFERENCES web_services (id)
ON DELETE CASCADE ;





-- ############################################################################ COLUMNS CHANGE
alter table web_promotions_has_landings
    add constraint web_promotions_has_landings_pk
        primary key (id);


-- ############################################################################ WEB PROMOTIONS
-- CAMBIAR VALOR A NULL
UPDATE web_promotions_has_landings
SET web_promotion_id = NULL
where web_promotion_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_promotions_has_landings
WHERE web_promotion_id NOT IN (
    SELECT id FROM web_promotions
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_promotions_has_landings
ADD CONSTRAINT web_promotions_fk
FOREIGN KEY (web_promotion_id)
REFERENCES web_promotions (id)
ON DELETE CASCADE ;

-- ############################################################################ WEB LANDINGS
-- CAMBIAR VALOR A NULL
UPDATE web_promotions_has_landings
SET web_landing_id = NULL
where web_landing_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_promotions_has_landings
WHERE web_landing_id NOT IN (
    SELECT id FROM web_landings
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_promotions_has_landings
ADD CONSTRAINT web_landings_fk
FOREIGN KEY (web_landing_id)
REFERENCES web_landings (id)
ON DELETE CASCADE ;





-- ############################################################################ WEB PROMOTIONS
-- CAMBIAR VALOR A NULL
UPDATE web_promotions_has_products
SET web_promotion_id = NULL
where web_promotion_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_promotions_has_products
WHERE web_promotion_id NOT IN (
    SELECT id FROM web_promotions
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_promotions_has_products
ADD CONSTRAINT web_promotions_fk
FOREIGN KEY (web_promotion_id)
REFERENCES web_promotions (id)
ON DELETE CASCADE ;





-- ############################################################################ WEB PROMOTIONS
-- CAMBIAR VALOR A NULL
UPDATE web_promotions_services
SET web_promotion_id = NULL
where web_promotion_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_promotions_services
WHERE web_promotion_id NOT IN (
    SELECT id FROM web_promotions
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_promotions_services
ADD CONSTRAINT web_promotions_fk
FOREIGN KEY (web_promotion_id)
REFERENCES web_promotions (id)
ON DELETE CASCADE ;

-- ############################################################################ WEB SERVICE
-- CAMBIAR VALOR A NULL
UPDATE web_promotions_services
SET web_service_id = NULL
where web_service_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_promotions_services
WHERE web_service_id NOT IN (
    SELECT id FROM web_services
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_promotions_services
ADD CONSTRAINT web_services_fk
FOREIGN KEY (web_service_id)
REFERENCES web_services (id)
ON DELETE CASCADE ;





-- ############################################################################ WEB PARK
-- CAMBIAR VALOR A NULL
UPDATE web_questions
SET web_park_id = NULL
where web_park_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_questions
WHERE web_park_id NOT IN (
    SELECT id FROM web_parks
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_questions
ADD CONSTRAINT web_parks_fk
FOREIGN KEY (web_park_id)
REFERENCES web_parks (id)
ON DELETE CASCADE ;





-- ############################################################################ COLUMN CHANGES
alter table web_questions_discs
    add constraint web_questions_discs_pk
        primary key (id);


-- ############################################################################ WEB DISCS
-- CAMBIAR VALOR A NULL
UPDATE web_questions_discs
SET web_disc_id = NULL
where web_disc_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_questions_discs
WHERE web_disc_id NOT IN (
    SELECT id FROM web_discs
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_questions_discs
ADD CONSTRAINT web_discs_fk
FOREIGN KEY (web_disc_id)
REFERENCES web_discs (id)
ON DELETE CASCADE ;





-- ############################################################################ COLUMNS CHANGE
alter table web_seo_discs
    add constraint web_seo_discs_pk
        primary key (id);

-- ############################################################################ WEB DISCS
-- CAMBIAR VALOR A NULL
UPDATE web_seo_discs
SET web_disc_id = NULL
where web_disc_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_seo_discs
WHERE web_disc_id NOT IN (
    SELECT id FROM web_discs
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_seo_discs
ADD CONSTRAINT web_discs_fk
FOREIGN KEY (web_disc_id)
REFERENCES web_discs (id)
ON DELETE CASCADE ;





-- ############################################################################ WEB CATEGORY
-- CAMBIAR VALOR A NULL
UPDATE web_seo_pages
SET seo_category_id = NULL
where seo_category_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_seo_pages
WHERE seo_category_id NOT IN (
    SELECT id FROM web_seo_categories
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_seo_pages
ADD CONSTRAINT web_seo_categories_fk
FOREIGN KEY (seo_category_id)
REFERENCES web_seo_categories (id)
ON DELETE CASCADE ;





-- ############################################################################ WEB PARKS
-- CAMBIAR VALOR A NULL
UPDATE web_seo_parks
SET web_park_id = NULL
where web_park_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_seo_parks
WHERE web_park_id NOT IN (
    SELECT id FROM web_parks
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_seo_parks
ADD CONSTRAINT web_parks_fk
FOREIGN KEY (web_park_id)
REFERENCES web_parks (id)
ON DELETE CASCADE ;





-- ############################################################################ WEB PARKS
-- CAMBIAR VALOR A NULL
UPDATE web_services
SET web_park_id = NULL
where web_park_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_services
WHERE web_park_id NOT IN (
    SELECT id FROM web_parks
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_services
ADD CONSTRAINT web_parks_fk
FOREIGN KEY (web_park_id)
REFERENCES web_parks (id)
ON DELETE CASCADE ;





-- ############################################################################ WEB DISCS
-- CAMBIAR VALOR A NULL
UPDATE web_templates
SET section_id = NULL
where section_id = 0;

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





-- ############################################################################ WEB PARKS
-- CAMBIAR VALOR A NULL
UPDATE web_testimonials
SET web_park_id = NULL
where web_park_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_testimonials
WHERE web_park_id NOT IN (
    SELECT id FROM web_parks
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_testimonials
ADD CONSTRAINT web_parks_fk
FOREIGN KEY (web_park_id)
REFERENCES web_parks (id)
ON DELETE CASCADE ;





-- ############################################################################ SEASON
-- CAMBIAR VALOR A NULL
UPDATE web_transfer_unit_seasons
SET season_id = NULL
where season_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_transfer_unit_seasons
WHERE season_id NOT IN (
    SELECT id FROM transportation_season
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_transfer_unit_seasons
ADD CONSTRAINT transportation_season_fk
FOREIGN KEY (season_id)
REFERENCES transportation_season (id)
ON DELETE CASCADE ;

-- ############################################################################ DETAILS TRANSPORTATION
-- CAMBIAR VALOR A NULL
UPDATE web_transfer_unit_seasons
SET transfer_unit_id = NULL
where transfer_unit_id = 0;

-- AQUI YA LOS QUERYS PARA ELIMINAR ESOS REGISTROS
DELETE FROM web_transfer_unit_seasons
WHERE transfer_unit_id NOT IN (
    SELECT id FROM web_details_transportation
);

-- YA PODEMOS CREAR LAS LLAVES FORANEAS
ALTER TABLE web_transfer_unit_seasons
ADD CONSTRAINT web_details_transportation_fk
FOREIGN KEY (transfer_unit_id)
REFERENCES web_details_transportation (id)
ON DELETE CASCADE ;


-- ############################################################################ FINAL