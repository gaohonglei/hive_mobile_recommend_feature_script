use itemRecommend;
drop table if exists item_sum;create table item_sum as select * from item_f1 join item_f2 on item_f1.item_id=item_f2.item_id2 join item_f3 on item_f1.item_id=item_f3.item_id3 join item_f4 on item_f1.item_id=item_f4.item_id4;
