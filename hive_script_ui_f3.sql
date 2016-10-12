use itemRecommend;
drop table if exists ui_f3;
create table ui_f3 as select user_id as ui_user_id3,item_id as ui_item_id3,
sum(case when behavior_type=1 then 1 else 0 end) as ui136,
sum(case when behavior_type=2 then 1 else 0 end) as ui137,
sum(case when behavior_type=3 then 1 else 0 end) as ui138,
sum(case when behavior_type=4 then 1 else 0 end) as ui139,
sum(case when behavior_type=1 then 1 else 0 end)*sum(case when behavior_type=1 then 1 else 0 end) as ui140,
sum(case when behavior_type=2 then 1 else 0 end)*sum(case when behavior_type=2 then 1 else 0 end) as ui141,
sum(case when behavior_type=3 then 1 else 0 end)*sum(case when behavior_type=2 then 1 else 0 end) as ui142,
sum(case when behavior_type=4 then 1 else 0 end)*sum(case when behavior_type=4 then 1 else 0 end) as ui143,
case when sum(case when behavior_type=4 then 1 else 0 end)>0 then sum(case when behavior_type=1 then 1 else 0 end)/sum(case when behavior_type=4 then 1 else 0 end) else 0 end as ui144,
case when sum(case when behavior_type=4 then 1 else 0 end)>0 then sum(case when behavior_type=2 then 1 else 0 end)/sum(case when behavior_type=4 then 1 else 0 end) else 0 end as ui145,
case when sum(case when behavior_type=4 then 1 else 0 end)>0 then sum(case when behavior_type=3 then 1 else 0 end)/sum(case when behavior_type=4 then 1 else 0 end) else 0 end as ui146,
case when sum(case when behavior_type=4 then 1 else 0 end)>0 then sum(case when behavior_type=4 then 1 else 0 end)/sum(case when behavior_type=4 then 1 else 0 end) else 0 end as ui147
from train_user where time<'${hiveconf:feature_time}' group by user_id,item_id;

