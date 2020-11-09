-- Number of offers by model with associated models
-- Data
select m.id                                 modelId,
       p.offer_id                           offerId,
       o.seller
from model m
         join product p on m.id = p.model_id
         join offer o on p.offer_id = o.id
order by model_id;

-- Count
select m.id                                 modelId,
       p.offer_id                           offerId,
       o.seller,
       count(p.id) over (partition by m.id) nbOffers
from model m
         join product p on m.id = p.model_id
         join offer o on p.offer_id = o.id
order by model_id;
