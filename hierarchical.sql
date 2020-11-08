WITH RECURSIVE tree as (
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
           tree.path || '/' || child_category.description,
           lpad(' ', level * 2) || child_category.description tree,
           tree.level + 1
    from category child_category
             join tree on tree.id = child_category.parent_category_id
)
select *
from tree;
