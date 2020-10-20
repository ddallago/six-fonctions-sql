-- Contextexte : group vs window
select m.id modelId, o.id offerId, o.price, m.document
from offer o
         join myproduct mp on o.id = mp.offer_id
         join model m on mp.model_id = m.id;

-- Group
select mp.model_id, min(price) minprice
from offer
         join myproduct mp on offer.id = mp.offer_id
         join model m on mp.model_id = m.id
group by mp.model_id;

-- Window
select m.id modelId, o.id offerId, o.price, m.document, min(o.price) over (partition by mp.model_id) minPrice
from offer o
         join myproduct mp on o.id = mp.offer_id
         join model m on mp.model_id = m.id;
