use itemRecommend;
drop table if exists temp_label_table;
create table temp_label_table as 
select a.user_id,a.item_id,case when b.user_id is null and b.item_id is null then 0 else 1 end as tag 
from temp_pairs_table as a 
left outer join 
(
select distinct user_id,item_id 
from train_user 
where datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=0 and behavior_type=4 
) b on a.user_id=b.user_id and a.item_id=b.item_id;
