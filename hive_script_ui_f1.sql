use itemRecommend;
drop table if exists ui_f1;
create table ui_f1 as select user_id,item_id,
sum(case when (behavior_type=1 and time <'${hiveconf:feature_time}') then 1 else 0 end)/30 as ui1,
sum(case when (behavior_type=2 and time <'${hiveconf:feature_time}') then 1 else 0 end)/30 as ui2,
sum(case when (behavior_type=3 and time <'${hiveconf:feature_time}') then 1 else 0 end)/30 as ui3,
sum(case when (behavior_type=4 and time <'${hiveconf:feature_time}') then 1 else 0 end)/30 as ui4,

sum(case when (behavior_type=1 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then 1 else 0 end) as ui5,
sum(case when (behavior_type=1 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=2) then 1 else 0 end) as ui6,
sum(case when (behavior_type=1 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=3) then 1 else 0 end) as ui7,
sum(case when (behavior_type=1 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=5) then 1 else 0 end) as ui8,
sum(case when (behavior_type=1 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=7) then 1 else 0 end) as ui9,

sum(case when (behavior_type=2 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then 1 else 0 end) as ui10,
sum(case when (behavior_type=2 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=2) then 1 else 0 end) as ui11,
sum(case when (behavior_type=2 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=3) then 1 else 0 end) as ui12,
sum(case when (behavior_type=2 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=5) then 1 else 0 end) as ui13,
sum(case when (behavior_type=2 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=7) then 1 else 0 end) as ui14,

sum(case when (behavior_type=3 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then 1 else 0 end) as ui15,
sum(case when (behavior_type=3 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=2) then 1 else 0 end) as ui16,
sum(case when (behavior_type=3 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=3) then 1 else 0 end) as ui17,
sum(case when (behavior_type=3 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=5) then 1 else 0 end) as ui18,
sum(case when (behavior_type=3 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=7) then 1 else 0 end) as ui19,

sum(case when (behavior_type=4 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then 1 else 0 end) as ui20,
sum(case when (behavior_type=4 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=2) then 1 else 0 end) as ui21,
sum(case when (behavior_type=4 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=3) then 1 else 0 end) as ui22,
sum(case when (behavior_type=4 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=5) then 1 else 0 end) as ui23,
sum(case when (behavior_type=4 and time <'${hiveconf:feature_time}' and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))<=7) then 1 else 0 end) as ui24,

max(case when (behavior_type=1 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then cast(substr(time,-2,2) as int) else 0 end) as ui25,
max(case when (behavior_type=2 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then cast(substr(time,-2,2) as int) else 0 end) as ui26,
max(case when (behavior_type=3 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then cast(substr(time,-2,2) as int) else 0 end) as ui27,
max(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then cast(substr(time,-2,2) as int) else 0 end) as ui28,

min(case when (behavior_type=1 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then cast(substr(time,-2,2) as int) else 24 end) as ui29,
min(case when (behavior_type=2 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then cast(substr(time,-2,2) as int) else 24 end) as ui30,
min(case when (behavior_type=3 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then cast(substr(time,-2,2) as int) else 24 end) as ui31,
min(case when (behavior_type=4 and datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10))=1) then cast(substr(time,-2,2) as int) else 24 end) as ui32
,
min(case when behavior_type=1 then datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10)) else 30 end) as ui33,
min(case when behavior_type=2 then datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10)) else 30 end) as ui34,
min(case when behavior_type=3 then datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10)) else 30 end) as ui35,
min(case when behavior_type=4 then datediff(substr('${hiveconf:feature_time}',0,10),substr(time,0,10)) else 30 end) as ui36,

count(distinct case when behavior_type=1 then substr(time,7,4) end) as ui37,
count(distinct case when behavior_type=4 then substr(time,7,4) end) as ui38 
from train_user where time<'${hiveconf:feature_time}' group by user_id,item_id;
