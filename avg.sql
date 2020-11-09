-- Average : have offers associated with models and offers price average for each record
-- Data
select m.id modelId,
       o.id offerId,
       o.price,
       m.document
from product p
         join offer o on o.id = p.offer_id
         join model m on p.model_id = m.id
where p.model_id in (1, 2, 3);

-- Analytic
select m.id                                                  modelId,
       o.id                                                  offerId,
       o.price,
       round(avg(o.price) over (partition by p.model_id), 2) priceAvg,
       m.document
from product p
         join offer o on o.id = p.offer_id
         join model m on p.model_id = m.id
where p.model_id in (1, 2, 3);
