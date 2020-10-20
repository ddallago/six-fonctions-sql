---- MAX
select *
from (
         select m.id, m.document, r.comment, r.score, max(r.score) over (partition by m.id) maxScore
         from model m
                  join rating r on m.id = r.model_id
         where m.id in (1, 2)) maSubquery
where score = maxScore;
