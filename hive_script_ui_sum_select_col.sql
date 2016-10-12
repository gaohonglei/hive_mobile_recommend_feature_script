use itemRecommend;
drop table if exists ui_sum;create table ui_sum as select * from ui_f1 left outer join ui_f2 on ui_f1.user_id=ui_f2.user_id2 and ui_f1.item_id=ui_f2.item_id2 left outer join ui_f3 on ui_f1.user_id=ui_f3.user_id3 and ui_f1.item_id=ui_f3.item_id3 left outer join ui_f4 on ui_f1.user_id=ui_f4.user_id4 and ui_f1.item_id=ui_f4.item_id4;

