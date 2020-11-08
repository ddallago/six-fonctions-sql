insert into category(id, parent_category_id, description)
values (1, null, 'clothes'),
       (2, null, 'furniture'),
       (3, 1, 'accessories'),
       (4, 3, 'shoes'),
       (5, 3, 'hats'),
       (6, 2, 'living room'),
       (7, 2, 'garden');

insert into offer(id, price, seller)
values (1, 10, 'decathlon'),
       (2, 20, 'gosport'),
       (3, 5, 'zara'),
       (4, 40, 'timberland'),
       (5, 50, 'jules'),
       (6, 3, 'decathlon');

insert into model (id, category_id, document)
values (1, 3, '{
          "kind": "shoes",
          "color": "blue"
        }'),
       (2, 3, '{
         "kind": "shoes",
         "color": "green"
       }'),
       (3, 3, '{
         "kind": "shoes",
         "color": "yellow"
       }');

insert into product (offer_id, model_id)
values (1, 1),
       (2, 1),
       (3, 1),
       (4, 2),
       (5, 3),
       (6, 2);

insert into rating(model_id, score, comment)
values (1, 5, 'Very good shoes!'),
       (1, 0, 'Poor shoes'),
       (1, 3, 'Nice'),
       (1, 3, 'Average'),
       (2, 2, 'Bad quality!'),
       (2, 4, 'Satisfied'),
       (3, 1, 'Meh'),
       (3, 1, 'Meh'),
       (3, 1, 'Meh');
