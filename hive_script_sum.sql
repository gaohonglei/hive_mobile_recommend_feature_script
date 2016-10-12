use itemRecommend;
drop table if exists item_sum;create table item_sum as select * from item_f1 join item_f2 on item_f1.item_id=item_f2.item_id2 join item_f3 on item_f1.item_id=item_f3.item_id3 join item_f4 on item_f1.item_id=item_f4.item_id4;
drop table if exists user_sum;create table user_sum as select * from user_f1 join user_f2 on user_f1.user_id=user_f2.user_id2 join user_f3 on user_f1.user_id=user_f3.user_id3;
drop table if exists ui_sum;create table ui_sum as select * from ui_f1 join ui_f2 on ui_f1.ui_user_id=ui_f2.ui_user_id2 and ui_f1.ui_item_id=ui_f2.ui_item_id2 join ui_f3 on ui_f1.ui_user_id=ui_f3.ui_user_id3 and ui_f1.ui_item_id=ui_f3.ui_item_id3 join ui_f4 on ui_f1.ui_user_id=ui_f4.ui_user_id4 and ui_f1.ui_item_id=ui_f4.ui_item_id4;

select item_id,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25,i26,i27,i28,i29,i30,i31,i32,i33,i34,i35,i36,i37,i38,i39,i40,i41,i42,i43,i44,i45,i46,i47,i48,i49,i50,i51,i52,i53,i54,i55,i56,i57,i58,i59,i60,i61,i62,i63,i64,i65,i66,i67,i68,i69,i70,i71,i72,i73,i74,i75,i76,i77 from item_sum;
select user_id,u1,u2,u3,u4,u5,u6,u7,u8,u9,u10,u11,u12,,u14,u15,u16,u17,u18,u19,u20,u21,u22,u23,u24,u25,u26,u27,u28,u29,u30,u31,u32,u33,u34,u35,u36,u37,u38,u39,u40,u41,u42,u43,u44,u45,u46,u47,u48,u49,u50,u51,u52,u53,u54,u55,u56,u57,u58,u59,u60,u61,u62,u63,u64,u65,u66,u67,u68,u69,u70,u71,u72,u73,u74,u75,u76 from user_sum;
select user_id,item_id,
