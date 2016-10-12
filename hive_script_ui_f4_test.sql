use itemRecommend;
drop table if exists ui_f4;
create table ui_f4 as 
select t1.user_id,t1.item_id  
from 
(
select user_id,item_id,behavior_type,min(cast(substr(time,-2,2) as int)) as s,max(cast(substr(time,-2,2) as int)) as e 
from train_user 
where datediff(substr('2014-12-17 00',0,10),substr(time,0,10))=1 
group by user_id,item_id,behavior_type 
) as t1 
join 
(
select distinct user_id,item_id,behavior_type,cast(substr(time,-2,2) as int) as hour 
from train_user 
where datediff(substr('2014-12-17',0,10),substr(time,0,10))=1 
) as t2 
on (t1.user_id=t2.user_id) group by t1.user_id,t1.item_id;

