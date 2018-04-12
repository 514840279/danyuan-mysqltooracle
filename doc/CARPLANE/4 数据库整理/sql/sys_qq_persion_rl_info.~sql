create or replace view sys_qq_persion_rl_info as
select qq,t.nickname as user_name,t.user_name as real_name,mobile,email,nvl(t.province||t.city,address) as address
from HADOOP.TMP_CORE_RELATION t
where qq is not null
and nickname is not null
and user_name is not null
union all

select T_qq,t_ename as user_name,t_realname as real_name,'' as mobile,'' as email,t1.t_province||t_city as address
from ZHCX.WLXX_QQXG_QQPYXX@dblink_172_16_3_18 t1
 where t_qq is not null
 and t_ename is not null
 and t_realname is not null

union all
/*
select tuin as qq,nick as user_name,'' as real_name,phone as mobile,email,province||city as address
 from HADOOP.PL_QQ_PERSONAL_20140518
 where tuin is not null
 and nick is not null
union all
 */
select tuin as qq,nick as user_name,'' as real_name,phone as mobile,email,province||city as address
from HADOOP.PL_QQ_PERSONAL_20141114
where tuin is not null
and nick is not null
union all

select tuin as qq,昵称 as user_name, '' as real_name,手机 as mobile, 电子邮箱 as email,省||城市 as address
from ZHCX.WLXX_QQXG_QQGRXX@dblink_172_16_3_18
where tuin is not null
and 昵称 is not null
and 手机 is not null
and 电子邮箱 is not null
union all

select tuin as qq,nick as user_name,'' as real_name,phone as mobile,email,province||city as address
from HADOOP.PL_QQ_PERSONAL_20150131
where tuin is not null
and nick is not null
and phone is not null

