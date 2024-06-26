-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://github.com/pgadmin-org/pgadmin4/issues/new/choose if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public."Inventory"
(
    product_id integer NOT NULL,
    quantity_available integer NOT NULL,
    CONSTRAINT "Inventory_pkey" PRIMARY KEY (product_id)
);

CREATE TABLE IF NOT EXISTS public."Review "
(
    "review_id " serial NOT NULL,
    product_id integer NOT NULL,
    "user_id " integer NOT NULL,
    rating integer NOT NULL,
    comment text COLLATE pg_catalog."default",
    date timestamp with time zone NOT NULL,
    CONSTRAINT "Review _pkey" PRIMARY KEY ("review_id ")
);

CREATE TABLE IF NOT EXISTS public."cart item"
(
    "cart_item_id " serial NOT NULL,
    "cart_id " integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    CONSTRAINT "cart item_pkey" PRIMARY KEY ("cart_item_id ")
);

CREATE TABLE IF NOT EXISTS public.category
(
    "category_ID" serial NOT NULL,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT category_pkey PRIMARY KEY ("category_ID")
);

CREATE TABLE IF NOT EXISTS public."order"
(
    "order_ID" serial NOT NULL,
    "user_ID" integer NOT NULL,
    order_date timestamp with time zone NOT NULL,
    "total_amount " numeric(10, 2) NOT NULL,
    status character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT order_pkey PRIMARY KEY ("order_ID")
);

CREATE TABLE IF NOT EXISTS public."order item"
(
    "order_item_ID" serial NOT NULL,
    "order_ID" integer NOT NULL,
    "product_ID" integer NOT NULL,
    quantity integer NOT NULL,
    unit_price numeric(2, 2) NOT NULL,
    CONSTRAINT "order item_pkey" PRIMARY KEY ("order_item_ID")
);

CREATE TABLE IF NOT EXISTS public.product
(
    "product_ID" serial NOT NULL,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    description text COLLATE pg_catalog."default",
    price numeric NOT NULL,
    "category_ID" serial NOT NULL,
    CONSTRAINT product_pkey PRIMARY KEY ("product_ID", "category_ID")
);

CREATE TABLE IF NOT EXISTS public."recommendation "
(
    recommendation_id serial NOT NULL,
    user_id integer NOT NULL,
    product_id integer NOT NULL,
    CONSTRAINT "recommendation _pkey" PRIMARY KEY (recommendation_id)
);

CREATE TABLE IF NOT EXISTS public."shopping cart"
(
    cart_id serial NOT NULL,
    "user_id " integer NOT NULL,
    CONSTRAINT "shopping cart_pkey" PRIMARY KEY (cart_id)
);

CREATE TABLE IF NOT EXISTS public."user"
(
    "user_ID" serial NOT NULL,
    "user_Name" character varying COLLATE pg_catalog."default",
    "Email" character varying COLLATE pg_catalog."default",
    "Password" character varying COLLATE pg_catalog."default",
    address text COLLATE pg_catalog."default",
    "phone number" character varying COLLATE pg_catalog."default"
);

ALTER TABLE IF EXISTS public."Inventory"
    ADD CONSTRAINT product_fg FOREIGN KEY (product_id)
    REFERENCES public.product ("product_ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Review "
    ADD CONSTRAINT review_fk FOREIGN KEY ("user_id ")
    REFERENCES public."user" ("user_ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Review "
    ADD CONSTRAINT product_review_fk FOREIGN KEY (product_id)
    REFERENCES public.product ("product_ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."cart item"
    ADD CONSTRAINT cart_fk FOREIGN KEY ("cart_id ")
    REFERENCES public."shopping cart" (cart_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."cart item"
    ADD CONSTRAINT product_cart_item_fk FOREIGN KEY (product_id)
    REFERENCES public.product ("product_ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."order"
    ADD CONSTRAINT user_orders_fk FOREIGN KEY ("user_ID")
    REFERENCES public."user" ("user_ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."order item"
    ADD CONSTRAINT order_fk FOREIGN KEY ("order_ID")
    REFERENCES public."order" ("order_ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."order item"
    ADD CONSTRAINT product_order_item_fk FOREIGN KEY ("product_ID")
    REFERENCES public.product ("product_ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.product
    ADD CONSTRAINT category_fk FOREIGN KEY ("category_ID")
    REFERENCES public.category ("category_ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."recommendation "
    ADD CONSTRAINT user_recommendation_fk FOREIGN KEY (user_id)
    REFERENCES public."user" ("user_ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."recommendation "
    ADD CONSTRAINT product_recommendation_fk FOREIGN KEY (product_id)
    REFERENCES public.product ("product_ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."shopping cart"
    ADD CONSTRAINT user_cart_fk FOREIGN KEY ("user_id ")
    REFERENCES public."user" ("user_ID") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;