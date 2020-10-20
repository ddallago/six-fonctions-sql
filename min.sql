select mp1.model_id, m.document, o.price
from myproduct mp1
         join offer o on o.id = mp1.offer_id
         join model m on mp1.model_id = m.id
where mp1.model_id in (1, 2);

select *
from (
         select mp1.model_id, m.document, o.price, min(o.price) over (partition by mp1.model_id) minPrice
         from myproduct mp1
                  join offer o on o.id = mp1.offer_id
                  join model m on mp1.model_id = m.id
         where mp1.model_id in (1, 2)) maSubquery
where price = minPrice;
