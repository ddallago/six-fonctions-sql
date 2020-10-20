---- Chercher un exemple où on utilise plusieurs fois la vue ?
with maQuery as (
    select mp1.model_id,
           m.document,
           o.price,
           min(o.price) over (partition by mp1.model_id) minPrice,
           max(o.price) over (partition by mp1.model_id) maxPrice
    from myproduct mp1
             join offer o on o.id = mp1.offer_id
             join model m on mp1.model_id = m.id
    where mp1.model_id in (1, 2))
select *
from maQuery maQueryMin
where price = minPrice;
