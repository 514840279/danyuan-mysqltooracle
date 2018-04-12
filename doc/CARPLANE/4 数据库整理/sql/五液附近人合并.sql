insert into sys_qq_trance_base_info
  (QQ ,NICK, distence , date2 , date1 , PROVINCE, CITY, DISTRICT, addr_name )

  select QQ,
         NICK,
         to_char(DISTANCE) as distence ,
         DLSJ date2 ,
         CJSJ date1 ,
         PROVINCE,
         CITY,
         DISTRICT,
         NAME addr_name 
    from fjr_zhangye_tt t
    ;
    commit;
    
    