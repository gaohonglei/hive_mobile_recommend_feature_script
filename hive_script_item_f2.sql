use itemRecommend;
drop table if exists item_f2;
create table item_f2 as select item_id as item_id2,
cnt1/(sum(cnt1) over (partition by item_category)) as i17,
cnt2/(sum(cnt2) over (partition by item_category)) as i18,
cnt3/(sum(cnt3) over (partition by item_category)) as i19,
cnt4/(sum(cnt4) over (partition by item_category)) as i20 
from
(select item_category,item_id,
sum(case when behavior_type=1 then 1 else 0 end) as cnt1,
sum(case when behavior_type=2 then 1 else 0 end) as cnt2,
sum(case when behavior_type=3 then 1 else 0 end) as cnt3,
sum(case when behavior_type=4 then 1 else 0 end) as cnt4 
from train_user where time < '${hiveconf:feature_time}' group by item_id,item_category) as cnt;

