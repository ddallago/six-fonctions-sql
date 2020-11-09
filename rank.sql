--- Rank : les deux meilleurs ratings en face de chaque modèle en les comparant au price avg
-- Data
select p.model_id modelId,
       o.id       offerId,
       o.price,
       o.seller,
       r.score
from product p
         join offer o on o.id = p.offer_id
         join model m on p.model_id = m.id
         join rating r on m.id = r.model_id
where p.model_id in (1, 2);

select modelId, offerId, price, seller, score, priceAvg, ratingRn
from (
         select o.id                                                              offerId,
                p.model_id                                                        modelId,
                o.price,
                o.seller,
                r.score,
                round(avg(o.price) over (partition by p.model_id), 2)             priceAvg,
                row_number() over (partition by p.model_id order by r.score desc) ratingRn
         from product p
                  join offer o on o.id = p.offer_id
                  join model m on p.model_id = m.id
                  join rating r on m.id = r.model_id
         where p.model_id in (1, 2)) subquery
where ratingRn <= 2;

