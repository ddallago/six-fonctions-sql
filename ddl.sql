drop table if exists product cascade;
drop table if exists model cascade;
drop table if exists offer cascade;
drop table if exists category cascade;
drop table if exists rating cascade;

create table category
(
    id                 serial not null primary key,
    parent_category_id int,
    description        varchar,
    CONSTRAINT fk_parent_category
        FOREIGN KEY (parent_category_id) REFERENCES category (id)
);

create table model
(
    id       int   not null primary key,
    document jsonb not null,
    category_id int not null,
    CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES category (id)
);

create table rating
(
    id       serial  not null primary key,
    model_id int     not null,
    score    int     not null,
    comment  varchar not null,
    CONSTRAINT fk_model
        FOREIGN KEY (model_id)
            REFERENCES model (id)
);

create table offer
(
    id     int     not null primary key,
    price  bigint  not null,
    seller varchar not null
);

create table product
(
    id       serial not null primary key,
    offer_id bigint not null,
    model_id bigint not null,
    CONSTRAINT fk_model
        FOREIGN KEY (model_id)
            REFERENCES model (id),
    CONSTRAINT fk_offer
        FOREIGN KEY (offer_id)
            REFERENCES offer (id)
);
