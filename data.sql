insert into offer(id, price, seller)
values (1, 10, 'decathlon'),
       (2, 20, 'gosport'),
       (3, 5, 'zara'),
       (4, 40, 'timberland'),
       (5, 50, 'jules'),
       (6, 3, 'decathlon');

insert into model (id, document)
values (1, '{"kind": "shoes", "color": "blue"}'),
       (2, '{"kind": "shoes", "color": "green"}'),
       (3, '{"kind": "shoes", "color": "yellow"}');

insert into myproduct (offer_id, model_id)
values (1, 1),
       (2, 1),
       (3, 1),
       (4, 2),
       (5, 3),
       (6, 2);

insert into rating(model_id, score, comment)
values (1, 5, 'Chaussures au top'),
       (1, 0, 'Pas content'),
       (1, 3, 'Un comment'),
       (1, 3, 'Bof'),
       (2, 2, 'Mauvais !'),
       (2, 4, 'Satisfaite'),
       (3, 1, 'Un comment'),
       (3, 1, 'Un comment'),
       (3, 1, 'Un comment');
