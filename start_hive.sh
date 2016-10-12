#!/bin/sh
#/root/tools/hive/bin/hive -hiveconf feature_time='2014-12-18 00' -f /root/hive_script_item_f1.sql >/root/item_f1 2>&1 
#/root/tools/hive/bin/hive -hiveconf feature_time='2014-12-18 00' -f /root/hive_script_item_f2.sql >/root/item_f2 2>&1
#/root/tools/hive/bin/hive -hiveconf feature_time='2014-12-18 00' -f /root/hive_script_item_f3.sql >/root/item_f3 2>&1
#/root/tools/hive/bin/hive -hiveconf feature_time='2014-12-18 00' -f /root/hive_script_item_f4.sql >/root/item_f4 2>&1
#/root/tools/hive/bin/hive -hiveconf feature_time='2014-12-18 00' -f /root/hive_script_item_f5.sql >/root/item_f5 2>&1
#/root/tools/hive/bin/hive -hiveconf feature_time='2014-12-18 00' -f /root/hive_script_ui_f1.sql >/root/ui_f1 2>&1
#hive -hiveconf feature_time='2014-12-18 00' -f /root/hive_script_ui_f2.sql >/root/ui_f2 2>&1
#/root/tools/hive/bin/hive -hiveconf feature_time='2014-12-18 00' -f /root/hive_script_ui_f3.sql >/root/ui_f3 2>&1
#/root/tools/hive/bin/hive -hiveconf feature_time='2014-12-18 00' -f /root/hive_script_ui_f4.sql >ui_f4 2>&1
#/root/tools/hive/bin/hive -hiveconf feature_time='2014-12-18 00' -f /root/hive_script_user_f1.sql >/root/user_f1 2>&1
#/root/tools/hive/bin/hive -hiveconf feature_time='2014-12-18 00' -f /root/hive_script_user_f2.sql >/root/user_f2 2>&1
#/root/tools/hive/bin/hive -hiveconf feature_time='2014-12-18 00' -f /root/hive_script_user_f3.sql >/root/user_f3 2>&1
#/root/tools/hive/bin/hive -f /root/hive_script_user_sum_select_col.sql >/root/user_sum_select_col 2>&1
#/root/tools/hive/bin/hive -f /root/hive_script_user_sum_select.sql >/root/user_sum_select 2>&1
#/root/tools/hive/bin/hive -f /root/hive_script_item_sum_select_col.sql >/root/item_sum_select_col 2>&1
#/root/tools/hive/bin/hive -f /root/hive_script_item_sum_select.sql >/root/item_sum_select 2>&1
/root/tools/hive/bin/hive -f /root/hive_script_ui_sum_select_col.sql >/root/ui_sum_select_col 2>&1
/root/tools/hive/bin/hive -f /root/hive_script_ui_sum_select.sql >/root/ui_sum_select 2>&1

#/root/tools/hive/bin/hive -hiveconf feature_time='2014-12-18 00' -f /root/hive_script_result_18.sql >/root/label_table 2>&1
#/root/tools/hive/bin/hive -f /root/hive_script_feathure_table.sql >/root/feature_table 2>&1
