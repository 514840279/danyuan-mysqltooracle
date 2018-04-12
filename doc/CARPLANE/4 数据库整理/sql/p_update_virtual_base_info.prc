create or replace procedure p_update_virtual_base_info as
  v_UUID        varchar2(4000);
  v_ID          varchar2(4000);
  v_QQ          varchar2(4000);
  v_NICK        varchar2(4000);
  v_REAL_NAME   varchar2(4000);
  v_ADDRESS     varchar2(4000);
  v_MOBILE      varchar2(4000);
  v_EMAIL       varchar2(4000);
  v_ASTRO       varchar2(4000);
  v_SEX         varchar2(4000);
  v_BIRTHDAY    varchar2(4000);
  v_BLOOD_TYPE  varchar2(4000);
  v_ID_CARD     varchar2(4000);
  v_CORPORATION varchar2(4000);
  v_SCHOOL_NAME varchar2(4000);
  v_HOMETOWN    varchar2(4000);
begin
  <<fst_loop>>
  loop
    v_UUID        := '';
    v_ID          := '';
    v_QQ          := '';
    v_NICK        := '';
    v_REAL_NAME   := '';
    v_ADDRESS     := '';
    v_MOBILE      := '';
    v_EMAIL       := '';
    v_ASTRO       := '';
    v_SEX         := '';
    v_BIRTHDAY    := '';
    v_BLOOD_TYPE  := '';
    v_ID_CARD     := '';
    v_CORPORATION := '';
    v_SCHOOL_NAME := '';
    v_HOMETOWN    := '';
    -- 查询一个qq号码
    select qq
      into v_QQ
      from dis_pic_qq
     where flag = 0
       and rownum = 1;
    exit fst_loop when v_QQ is null;
    -- 更新flag
    update dis_pic_qq set flag = 1 where qq = v_QQ;
  
    -- 查询数据 ==========================================================
    -- v_UUID varchar2(4000);
    -- v_UUID := sys_guid();
    select sys_guid() into v_UUID from dual;
  
    -- v_ID varchar2(4000);
    -- v_QQ varchar2(4000);
    --select qq into v_QQ from zhcx.sys_qq_persion_rl_info;
    v_ID := v_QQ;
  
    -- v_NICK varchar2(4000);
    BEGIN
      select t.user_name
        into v_NICK
        from zhcx.sys_qq_persion_rl_info t
       where t.user_name is not null
         and t.qq = v_QQ
         and rownum = 1;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        null;
    end;
    BEGIN
      if (v_NICK is null) then
        select t.user_name
          into v_NICK
          from zhcx.sys_qq_persion_nature_info t
         where t.user_name is not null
           and t.qq = v_QQ
           and rownum = 1;
      
      end if;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        null;
    end;
    BEGIN
      -- v_REAL_NAME varchar2(4000);
      select t.real_name
        into v_REAL_NAME
        from zhcx.sys_qq_persion_rl_info t
       where t.real_name is not null
         and t.qq = v_QQ
         and rownum = 1;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        null;
    end;
    BEGIN
      if (v_REAL_NAME is null) then
        select t.REAL_NAME
          into v_REAL_NAME
          from zhcx.sys_qq_persion_nature_info t
         where t.REAL_NAME is not null
           and t.qq = v_QQ
           and rownum = 1;
      
      end if;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        null;
    end;
    BEGIN
      -- v_ADDRESS varchar2(4000);
      select t.address
        into v_ADDRESS
        from zhcx.sys_qq_persion_rl_info t
       where t.address is not null
         and t.qq = v_QQ
         and rownum = 1;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        null;
    end;
    BEGIN
      if (v_REAL_NAME is null) then
        select t.address
          into v_REAL_NAME
          from zhcx.sys_qq_persion_nature_info t
         where t.address is not null
           and t.qq = v_QQ
           and rownum = 1;
      
      end if;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        null;
    end;
    BEGIN
      -- v_MOBILE varchar2(4000);
      select t.mobile
        into v_MOBILE
        from zhcx.sys_qq_persion_rl_info t
       where t.mobile is not null
         and t.qq = v_QQ
         AND LENGTHB(T.mobile)<15
         and rownum = 1;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        null;
    end;
    BEGIN
      -- v_EMAIL varchar2(4000);
      select t.mobile
        into v_MOBILE
        from zhcx.sys_qq_persion_rl_info t
       where t.mobile is not null
         and t.qq = v_QQ
         and rownum = 1;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        null;
    end;
    BEGIN
      -- v_ASTRO varchar2(4000);
      select t.ASTRO
        into v_ASTRO
        from zhcx.sys_qq_persion_nature_info t
       where t.ASTRO is not null
         and t.qq = v_QQ
         and rownum = 1;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        null;
    end;
    BEGIN
      -- v_SEX varchar2(4000);
      select t.SEX
        into v_SEX
        from zhcx.sys_qq_persion_nature_info t
       where t.SEX is not null
         and t.qq = v_QQ
         and rownum = 1;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        null;
    end;
    BEGIN
      -- v_BIRTHDAY varchar2(4000);
      select t.BIRTHDAY
        into v_BIRTHDAY
        from zhcx.sys_qq_persion_nature_info t
       where t.BIRTHDAY is not null
         and t.qq = v_QQ
         and rownum = 1;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        null;
    end;
    BEGIN
      -- v_BLOOD_TYPE varchar2(4000);
      select t.BLOOD_TYPE
        into v_BLOOD_TYPE
        from zhcx.sys_qq_persion_nature_info t
       where t.BLOOD_TYPE is not null
         and t.qq = v_QQ
         and rownum = 1;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        null;
    end;
    -- v_ID_CARD varchar2(4000);
    -- v_CORPORATION varchar2(4000);
    -- v_SCHOOL_NAME varchar2(4000);
    -- v_HOMETOWN varchar2(4000);
  
    -- 查询数据 ==========================================================
    insert into sys_virtual_persion_base_info
      (UUID,
       ID,
       QQ,
       NICK,
       REAL_NAME,
       ADDRESS,
       MOBILE,
       EMAIL,
       ASTRO,
       SEX,
       BIRTHDAY,
       BLOOD_TYPE)
    values
      (v_UUID,
       v_ID,
       v_QQ,
       v_NICK,
       v_REAL_NAME,
       v_ADDRESS,
       v_MOBILE,
       v_EMAIL,
       v_ASTRO,
       v_SEX,
       v_BIRTHDAY,
       v_BLOOD_TYPE);
    commit;
  end loop;
  dbms_output.put_line('LOOP循环已经结束！');
end;
/
