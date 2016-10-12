use itemRecommend;
drop table if exists user_f2;
create table user_f2 as select tmp.user_id as user_id2,
case when (count(distinct case when (tmp.count_by >=2) then tmp.item_id end))>0 then count(distinct case when (tmp.count_by >= 1) then tmp.item_id end )/count(distinct case when (tmp.count_by >=2) then tmp.item_id end) else 0 end as u76 from (select user_id,item_id,sum(case when (behavior_type=4) then 1 else 0 end) as count_by from train_user where time<'${hiveconf:feature_time}' group by user_id,item_id) as tmp group by tmp.user_id;
