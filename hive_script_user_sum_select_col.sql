use itemRecommend;
drop table if exists user_sum;
create table user_sum as select * from user_f1 join user_f2 on user_f1.user_id=user_f2.user_id2 join user_f3 on user_f1.user_id=user_f3.user_id3;
