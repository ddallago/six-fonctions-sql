-- Data
select m.id modelId, r.id ratingId, r.comment, r.score, m.document
from model m
         join rating r on m.id = r.model_id
where m.id in (1, 2);

-- Analytic
select modelId, ratingId, comment, score, document
from (
         select m.id modelId, r.id ratingId, r.comment, r.score, m.document, max(r.score) over (partition by m.id) maxScore
         from model m
                  join rating r on m.id = r.model_id
         where m.id in (1, 2)) subquery
where score = maxScore;
