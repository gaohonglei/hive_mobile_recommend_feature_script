use itemRecommend;
drop table if exists user_f1;
create table user_f1 as select user_id,
sum(case when (behavior_type=1 and time <'${hiveconf:feature_time}') then 1 else 0 end) as u1,
sum(case when (behavior_type=2 and time <'${hiveconf:feature_time}') then 1 else 0 end) as u2,
sum(case when (behavior_type=3 and time <'${hiveconf:feature_time}') then 1 else 0 end) as u3,
sum(case when (behavior_type=4 and time <'${hiveconf:feature_time}') then 1 else 0 end) as u4,
count( distinct case when (behavior_type=1) then item_id end ) as u5,
count( distinct case when (behavior_type=2) then item_id end ) as u6,
count( distinct case when (behavior_type=3) then item_id end) as u7,
count( distinct case when (behavior_type=4) then item_id end) as u8,
case when sum(case when (behavior_type=4) then 1 else 0 end)>0 then sum(case when (behavior_type=1) then 1 else 0 end)/sum(case when (behavior_type=4) then 1 else 0 end) else 0 end as u9,
case when sum(case when (behavior_type=4) then 1 else 0 end)>0 then sum(case when (behavior_type=2) then 1 else 0 end)/sum(case when (behavior_type=4) then 1 else 0 end) else 0 end as u10,
case when sum(case when (behavior_type=4) then 1 else 0 end)>0 then sum(case when (behavior_type=3) then 1 else 0 end)/sum(case when (behavior_type=4) then 1 else 0 end) else 0 end as u11,
min(case when behavior_type=1 then datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10)) else 31 end) as u12,
min(case when behavior_type=4 then datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10)) else 31 end) as u13,

sum(case when (behavior_type=1 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then 1 else 0 end) as u14,
sum(case when (behavior_type=1 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=2) then 1 else 0 end) as u15,
sum(case when (behavior_type=1 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=3) then 1 else 0 end) as u16,
sum(case when (behavior_type=1 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=5) then 1 else 0 end) as u17,
sum(case when (behavior_type=1 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=7) then 1 else 0 end) as u18,

sum(case when (behavior_type=2 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then 1 else 0 end) as u19,
sum(case when (behavior_type=2 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=2) then 1 else 0 end) as u20,
sum(case when (behavior_type=2 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=3) then 1 else 0 end) as u21,
sum(case when (behavior_type=2 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=5) then 1 else 0 end) as u22,
sum(case when (behavior_type=2 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=7) then 1 else 0 end) as u23,

sum(case when (behavior_type=3 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then 1 else 0 end) as u24,
sum(case when (behavior_type=3 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=2) then 1 else 0 end) as u25,
sum(case when (behavior_type=3 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=3) then 1 else 0 end) as u26,
sum(case when (behavior_type=3 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=5) then 1 else 0 end) as u27,
sum(case when (behavior_type=3 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=7) then 1 else 0 end) as u28,

sum(case when (behavior_type=4 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then 1 else 0 end) as u29,
sum(case when (behavior_type=4 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=2) then 1 else 0 end) as u30,
sum(case when (behavior_type=4 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=3) then 1 else 0 end) as u31,
sum(case when (behavior_type=4 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=5) then 1 else 0 end) as u32,
sum(case when (behavior_type=4 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=7) then 1 else 0 end) as u33,

count( distinct case when (behavior_type=1 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then item_id end) as u34,
count( distinct case when (behavior_type=1 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=2) then item_id end) as u35,
count( distinct case when (behavior_type=1 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=3) then item_id end) as u36,
count( distinct case when (behavior_type=1 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=5) then item_id end) as u37,
count( distinct case when (behavior_type=1 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=7) then item_id end) as u38,

count( distinct case when (behavior_type=2 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then item_id end) as u39,
count( distinct case when (behavior_type=2 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=2) then item_id end) as u40,
count( distinct case when (behavior_type=2 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=3) then item_id end) as u41,
count( distinct case when (behavior_type=2 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=5) then item_id end) as u42,
count( distinct case when (behavior_type=2 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=7) then item_id end) as u43,

count( distinct case when (behavior_type=3 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then item_id end) as u44,
count( distinct case when (behavior_type=3 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=2) then item_id end) as u45,
count( distinct case when (behavior_type=3 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=3) then item_id end) as u46,
count( distinct case when (behavior_type=3 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=5) then item_id end) as u47,
count( distinct case when (behavior_type=3 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=7) then item_id end) as u48,

count( distinct case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then item_id end) as u49,
count( distinct case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=2) then item_id end) as u50,
count( distinct case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=3) then item_id end) as u51,
count( distinct case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=5) then item_id end) as u52,
count( distinct case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=7) then item_id end) as u53,

case when sum(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then 1 else 0 end)>0 then sum(case when (behavior_type=1 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then 1 else 0 end)/sum(case when (behavior_type=4 and  datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then 1 else 0 end) else 0 end as u54,
case when sum(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=2) then 1 else 0 end)>0 then sum(case when (behavior_type=1 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=2) then 1 else 0 end)/sum(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=2) then 1 else 0 end) else 0 end as u55,
case when sum(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=3) then 1 else 0 end)>0 then sum(case when (behavior_type=1 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=3) then 1 else 0 end)/sum(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=3) then 1 else 0 end) else 0 end as u56,
case when sum(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=5) then 1 else 0 end)>0 then sum(case when (behavior_type=1 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=5) then 1 else 0 end)/sum(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=5) then 1 else 0 end) else 0 end as u57,
case when sum(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=7) then 1 else 0 end)>0 then sum(case when (behavior_type=1 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=7) then 1 else 0 end)/sum(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=7) then 1 else 0 end) else 0 end as u58,


case when sum(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then 1 else 0 end)>0 then sum(case when (behavior_type=2 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then 1 else 0 end)/sum(case when (behavior_type=4 and  datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then 1 else 0 end) else 0 end as u59,
case when sum(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=2) then 1 else 0 end)>0 then sum(case when (behavior_type=2 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=2) then 1 else 0 end)/sum(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=2) then 1 else 0 end) else 0 end as u60,
case when sum(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=3) then 1 else 0 end)>0 then sum(case when (behavior_type=2 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=3) then 1 else 0 end)/sum(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=3) then 1 else 0 end) else 0 end as u61,
case when sum(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=5) then 1 else 0 end)>0 then sum(case when (behavior_type=2 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=5) then 1 else 0 end)/sum(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=5) then 1 else 0 end) else 0 end as u62,
case when sum(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=7) then 1 else 0 end)>0 then sum(case when (behavior_type=2 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=7) then 1 else 0 end)/sum(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=7) then 1 else 0 end) else 0 end as u63,


case when sum(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then 1 else 0 end)>0 then sum(case when (behavior_type=3 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then 1 else 0 end)/sum(case when (behavior_type=4 and  datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then 1 else 0 end) else 0 end as u64,
case when sum(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=2) then 1 else 0 end)>0 then sum(case when (behavior_type=3 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=2) then 1 else 0 end)/sum(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=2) then 1 else 0 end) else 0 end as u65,
case when sum(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=3) then 1 else 0 end)>0 then sum(case when (behavior_type=3 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=3) then 1 else 0 end)/sum(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=3) then 1 else 0 end) else 0 end as u66,
case when sum(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=5) then 1 else 0 end)>0 then sum(case when (behavior_type=3 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=5) then 1 else 0 end)/sum(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=5) then 1 else 0 end) else 0 end as u67,
case when sum(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=7) then 1 else 0 end)>0 then sum(case when (behavior_type=3 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=7) then 1 else 0 end)/sum(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=7) then 1 else 0 end) else 0 end as u68,

max(cast(substr(time,-2,2) as int)) as u69,
min(cast(substr(time,-2,2) as int)) as u70,
avg(cast(substr(time,-2,2) as int)) as u71 
from train_user where time<'${hiveconf:feature_time}' group by user_id;

