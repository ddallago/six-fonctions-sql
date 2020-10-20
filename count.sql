-- Number of offers by model with associated models
select mp.offer_id                           offerId,
       m.id                                  modelId,
       m.document,
       count(mp.id) over (partition by m.id) nbOffers
from model m
         join myproduct mp on m.id = mp.model_id
order by offer_id;
