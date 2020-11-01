--- Average : have offers associated with models and offers price average for each record
select m.id                                                    modelId,
       o.id                                                    offerId,
       o.price,
       round(avg(o.price) over (partition by mp1.model_id), 2) priceAvg,
       m.document
from myproduct mp1
         join offer o on o.id = mp1.offer_id
         join model m on mp1.model_id = m.id
where mp1.model_id in (1, 2, 3);
