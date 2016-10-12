use itemRecommend;
drop table if exists item_f3;
create table item_f3 as 
select item_id as item_id3,r1 as i68,r2 as i69,r3 as i70,
case when cr1>0 then r1/cr1 else 0 end as i71,
case when cr2>0 then r2/cr2 else 0 end as i72,
case when cr3>0 then r3/cr3 else 0 end as i73 
from
(
select item_id,item_category, 
case when sum(case when behavior_type=4 then 1 else 0 end)>0 then sum(case when behavior_type=1 then 1 else 0 end)/sum(case when behavior_type=4 then 1 else 0 end) else 0 end as r1,
case when sum(case when behavior_type=4 then 1 else 0 end)>0 then sum(case when behavior_type=2 then 1 else 0 end)/sum(case when behavior_type=4 then 1 else 0 end) else 0 end as r2,
case when sum(case when behavior_type=4 then 1 else 0 end)>0 then sum(case when behavior_type=3 then 1 else 0 end)/sum(case when behavior_type=4 then 1 else 0 end) else 0 end as r3  
from train_user where time<'${hiveconf:feature_time}' group by item_id,item_category
) as t1
join
(
select item_category,
case when sum(case when behavior_type=4 then 1 else 0 end)>0 then sum(case when behavior_type=1 then 1 else 0 end)/sum(case when behavior_type=4 then 1 else 0 end) else 0 end as cr1,
case when sum(case when behavior_type=4 then 1 else 0 end)>0 then sum(case when behavior_type=2 then 1 else 0 end)/sum(case when behavior_type=4 then 1 else 0 end) else 0 end as cr2,
case when sum(case when behavior_type=4 then 1 else 0 end)>0 then sum(case when behavior_type=3 then 1 else 0 end)/sum(case when behavior_type=4 then 1 else 0 end) else 0 end as cr3 
from train_user where time<'${hiveconf:feature_time}' group by item_category 
) as t2 
on t1.item_category = t2.item_category;

