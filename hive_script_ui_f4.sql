use itemRecommend;
drop table if exists ui_f4;
create table ui_f4 as select user_id as ui_user_id4,item_id as ui_item_id4,
sum(case when t1.behavior_type=1 and t2.behavior_type=1 and t2.hour<=t1.s then 1 else 0 end) as ui148,
sum(case when t1.behavior_type=2 and t2.behavior_type=2 and t2.hour<=t1.s then 1 else 0 end) as ui149,
sum(case when t1.behavior_type=3 and t2.behavior_type=3 and t2.hour<=t1.s then 1 else 0 end) as ui150,
sum(case when t2.behavior_type=4 and t2.hour<=t1.s then 1 else 0 end) as ui151,
sum(case when t1.behavior_type=1 and t2.behavior_type=1 and t2.hour>t1.e then 1 else 0 end) as ui152,
sum(case when t1.behavior_type=2 and t2.behavior_type=1 and t2.hour>t1.e then 1 else 0 end) as ui153,
sum(case when t1.behavior_type=3 and t2.behavior_type=1 and t2.hour>t1.e then 1 else 0 end) as ui154,
sum(case when t2.behavior_type=4 and t2.hour>t1.e then 1 else 0 end) as ui155  
from 
(
select user_id,item_id,behavior_type,min(cast(substr(time,-2,2) as int)) as s,max(cast(substr(time,-2,2) as int)) as e 
from train_user 
where datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1 
group by user_id,item_id,behavior_type 
) as t1 
join 
(
select distinct user_id,item_id,behavior_type,cast(substr(time,-2,2) as int) as hour 
from train_user 
where datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1 
) as t2 
on t1.user_id=t2.user_id group by t1.user_id,t1.item_id;

