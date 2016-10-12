use itemRecommend;
drop table if exists user_f3;
create table user_f3 as select t.user_id as user_id3,
sum(case when t.behavior_type=1 then 1 else 0 end) as u72,
sum(case when t.behavior_type=2 then 1 else 0 end) as u73,
sum(case when t.behavior_type=3 then 1 else 0 end) as u74,
sum(case when t.behavior_type=4 then 1 else 0 end) as u75 
from (select distinct user_id,behavior_type,substr(time,9,2) as daynum from train_user where time <'${hiveconf:feature_time}') as t group by user_id;
