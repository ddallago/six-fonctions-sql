-- Data
select m.id modelId, p.offer_id, o.seller, m.document
from product p
         join model m on p.model_id = m.id
         join offer o on p.offer_id = o.id
where m.id in (1, 2);

-- Analytic
select modelId, offerId, seller, document
from (
         select m.id modelId, p.offer_id offerId, o.seller, m.document,
                max(o.id) over (partition by m.id) maxOfferId
         from product p
                  join model m on p.model_id = m.id
                  join offer o on p.offer_id = o.id
         where m.id in (1, 2)) subquery
where offerId = maxOfferId;
