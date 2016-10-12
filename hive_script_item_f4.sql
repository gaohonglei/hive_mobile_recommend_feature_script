use itemRecommend;
drop table if exists item_f4;
create table item_f4 as 
select item_id as item_id4,
case when t2.click>0 then t1.click/t2.click else 0 end as i74,
case when t2.favorite>0 then t1.favorite/t2.favorite else 0 end i75,
case when t2.cart>0 then t1.cart/t2.cart else 0 end i76,
case when t2.buy>0 then t1.buy/t2.buy else 0 end i77 
from
(
select item_id,item_category,
sum(case when behavior_type=1 then 1 else 0 end) as click,
sum(case when behavior_type=2 then 1 else 0 end) as favorite,
sum(case when behavior_type=3 then 1 else 0 end) as cart,
sum(case when behavior_type=4 then 1 else 0 end) as buy 
from train_user where time<'${hiveconf:feature_time}' group by item_id,item_category
) as t1 
join
(
select item_category,
avg(case when behavior_type=1 then 1 else 0 end) as click,
avg(case when behavior_type=2 then 1 else 0 end) as favorite,
avg(case when behavior_type=3 then 1 else 0 end) as cart,
avg(case when behavior_type=4 then 1 else 0 end) as buy 
from train_user where time<'${hiveconf:feature_time}' group by item_category 
) as t2 
on t1.item_category=t2.item_category;
