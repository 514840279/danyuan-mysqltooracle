create or replace view sys_qq_persion_nature_info as
select QQ,REALNAME as REAL_NAME,ASTRO,SEX,province||city as address, BITTHDAY as BIRTHDAY,BLOOD_TYPE,ENAME as user_name from HADOOP.PL_QQ_PENGYOU_ALL_CUST_0928
union all
select QQ,REALNAME as REAL_NAME,ASTRO,SEX,province||city as address,BITTHDAY as BIRTHDAY,BLOOD_TYPE,ENAME as user_name from HADOOP.PL_QQ_PENGYOU_ALL_CUST_150213
union all
select QQ,name  as REAL_NAME,'' as ASTRO,'' as SEX,nvl(home,location) as address,BIRTHDAY,''as BLOOD_TYPE,'' as user_name from HADOOP.PL_QQ_PENGYOU_CUSTOMER20140518

