insert into sys_qq_trance_base_info (qq,nick,distence,date1,addr,date2,province,city,addr_name)
select qq,nick,t.distance as distence,to_char(t.cjsj,'YYYY/MM/DD HH24:MI:SS') as date1,province||city asaddr,t.dlsj date2,province,city,name as addr_name from fjr_jiuquan_tt t;
commit;





insert into sys_qq_trance_base_info (qq,nick,distence,date1,addr,date2,province,city,addr_name)
select qq,nick,t.distance as distence,to_char(t.cjsj,'YYYY/MM/DD HH24:MI:SS') as date1,province||city asaddr,t.dlsj date2,province,city,name as addr_name from fjr_lanzhou_tt t;
commit;


insert into sys_qq_trance_base_info
  (qq, nick, distence, date1, addr, date2, province, city, addr_name,district)
  select qq,
         nick,
         t.distance as distence,
         t.cjsj as date1,
         province || city||name as addr,
         t.dlsj date2,
         province,
         city,
         name as addr_name
         ,t.district
    from fjr_linxia_tt t;
commit;