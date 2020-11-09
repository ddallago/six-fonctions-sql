-- Get category tree for clothes
-- Data
select parent_category.id,
       parent_category.parent_category_id,
       parent_category.description path,
       parent_category.description tree
from category parent_category
where parent_category.id = 1;

-- Tree
WITH RECURSIVE cte as (
    select parent_category.id,
           parent_category.parent_category_id,
           parent_category.description path,
           parent_category.description tree,
           1 as                        level
    from category parent_category
    where parent_category.id = 1
    UNION ALL
    select child_category.id,
           child_category.parent_category_id,
           cte.path || '/' || child_category.description,
           lpad(' ', level * 2) || child_category.description tree,
           cte.level + 1
    from category child_category
             join cte on cte.id = child_category.parent_category_id
)
select id, parent_category_id, path, tree, level
from cte;
