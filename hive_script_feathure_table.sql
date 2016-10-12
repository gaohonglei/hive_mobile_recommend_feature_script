use itemRecommend;
drop table if exists feature_table; 
create table feature_table as  
select a.user_id,a.item_id,a.tag,
i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i14,i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25,i26,i27,i28,i29,i30,i31,i32,i33,i34,i35,i36,i37,i38,i39,i40,i41,i42,i43,i44,i45,i46,i47,i48,i49,i50,i51,i52,i53,i54,i55,i56,i57,i58,i59,i60,i61,i62,i63,i64,i65,i66,i67,i68,i69,i70,i71,i72,i73,i74,i75,i76,i77
,u1,u2,u3,u4,u5,u6,u7,u8,u9,u10,u11,u12,u14,u15,u16,u17,u18,u19,u20,u21,u22,u23,u24,u25,u26,u27,u28,u29,u30,u31,u32,u33,u34,u35,u36,u37,u38,u39,u40,u41,u42,u43,u44,u45,u46,u47,u48,u49,u50,u51,u52,u53,u54,u55,u56,u57,u58,u59,u60,u61,u62,u63,u64,u65,u66,u67,u68,u69,u70,u71,u72,u73,u74,u75,u76
,ui1,ui2,ui3,ui4,ui5,ui6,ui7,ui8,ui9,ui10,ui11,ui12,ui14,ui15,ui16,ui17,ui18,ui19,ui20,ui21,ui22,ui23,ui24,ui25,ui26,ui27,ui28,ui29,ui30,ui31,ui32,ui33,ui34,ui35,ui36,ui37,ui38,ui39,ui40,ui41,ui42,ui43,ui44,ui45,ui46,ui47,ui48,ui49,ui50,ui51,ui52,ui53,ui54,ui56,ui57,ui58,ui59,ui60,ui61,ui62,ui63,ui64,ui65,ui66,ui67,ui68,ui69,ui70,ui71,ui72,ui73,ui74,ui75,ui76,ui77,ui78,ui79,ui80,ui81,ui82,ui83,ui84,ui85,ui86,ui87,ui88,ui89,ui90,ui91,ui92,ui93,ui94,ui95,ui96,ui97,ui98,ui99,ui100,ui101,ui102,ui103,ui104,ui105,ui106,ui107,ui108,ui109,ui110,ui111,ui119,ui120,ui121,ui122,ui123,ui124,ui125,ui126,ui127,ui128,ui129,ui130,ui131,ui132,ui133,ui134,ui135,ui136,ui137,ui138,ui139,ui140,ui141,ui142,ui143,ui144,ui145,ui146,ui147,ui148,ui149,ui150,ui151,ui152,ui153,ui154,ui155 
from temp_label_table as a 
left outer join item on a.item_id =item.item_id 
left outer join user_table on a.user_id=user_table.user_id 
left outer join user_item on a.user_id=user_item.user_id and a.item_id=user_item.item_id;
