--Data
select mp1.model_id, m.document, o.price
from myproduct mp1
         join offer o on o.id = mp1.offer_id
         join model m on mp1.model_id = m.id
where mp1.model_id in (1, 2);

--Analytic
select model_id,  offerId, price, document
from (
         select mp1.model_id, m.document, o.id offerId, o.price, min(o.price) over (partition by mp1.model_id) minPrice
         from myproduct mp1
                  join offer o on o.id = mp1.offer_id
                  join model m on mp1.model_id = m.id
         where mp1.model_id in (1, 2)) subquery
where price = minPrice;
