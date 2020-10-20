drop table if exists myproduct cascade;
drop table if exists model cascade;
drop table if exists offer cascade;
create table model
(
    id       int   not null primary key,
    document jsonb not null
);

--

drop table if exists rating cascade;
create table rating
(
    id       serial  not null primary key,
    model_id int     not null,
    score   int     not null,
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

create table myproduct
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
