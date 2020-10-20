--- Rank : Avoir les offres associées à leur modèles, ainsi que la moyenne des prix des offres du modèle sur chaque offre
with maQuery as (
    select o.id                                                               offerId,
           mp1.model_id,
           o.price,
           o.seller,
           avg(o.price) over (partition by mp1.model_id)                      priceAvg,
           row_number() over (partition by mp1.model_id order by o.price) rank
    from myproduct mp1
             join offer o on o.id = mp1.offer_id
             join model m on mp1.model_id = m.id
    where mp1.model_id in (1, 2, 3))
select *
from maQuery
order by model_id, rank;
