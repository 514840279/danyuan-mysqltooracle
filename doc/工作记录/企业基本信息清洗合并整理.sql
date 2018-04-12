-- ÆóÒµ»ù±¾ÐÅÏ¢ÕûÀíÇåÏ´
/*
shxg_qyxg_¹«Ë¾»ù±¾ÐÅÏ¢
shxg_qyxg_¹«Ë¾»ù±¾ÐÅÏ¢_8g
shxg_qyxg_¹«Ë¾»ù±¾ÐÅÏ¢_Î÷¸Ú
shxg_qyxg_¹«Ë¾»ù±¾ÐÅÏ¢_qyfl
shxg_qyxg_¹«Ë¾»ù±¾ÐÅÏ¢_´óÁ¬1
shxg_qyxg_¹«Ë¾»ù±¾ÐÅÏ¢_ÁÉÄþ
shxg_qyxg_¹«Ë¾»ù±¾ÐÅÏ¢_Î÷¸Ú
*/

-- È¥µôÃ»ÓÐÓÃµÄÊý¾Ý
--drop table   
--drop table  shxg_qyxg_¹«Ë¾»ù±¾ÐÅÏ¢_qyfl;
--drop table  shxg_qyxg_¹«Ë¾»ù±¾ÐÅÏ¢_´óÁ¬1;
--drop table  shxg_qyxg_¹«Ë¾»ù±¾ÐÅÏ¢_ÁÉÄþ;
--drop table  shxg_qyxg_¹«Ë¾»ù±¾ÐÅÏ¢_Î÷¸Ú;
--drop table  shxg_qyxg_xyxg_¹«Ë¾»ù±¾ÐÅÏ¢_sz;

-- NO1 ºÏ²¢Êý¾Ý¿â Éú³ÉÀúÊ·Êý¾Ý
create table  shxg_qyxg_cropBase_unionall
as
select ×¢²áºÅ,       ×éÖ¯»ú¹¹´úÂë,       ¹«Ë¾Ãû³Æ,       ÆóÒµÀàÐÍ,       ¹ú±ð»òµØÇø,       ÐÐÕþÇø»®,       ÓÊÕþ±àÂë,       ËùÊôµØÇø,       ÏêÏ¸µØÖ·,
       ËùÊôÐÐÒµ,       ¾­Óª·¶Î§,       ¾­ÓªÃæ»ý,       ³ÉÁ¢ÈÕÆÚ,       ×¢²áÀàÐÍ,       ×¢²á×Ê½ð,       ×¢²áÈÕÆÚ,       ÆóÒµµÇ¼Ç×´Ì¬,       ½ø³ö¿Ú´úÂë,
       ¹úË°ºÅ,       µØË°ºÅ,       ¹«»ý½ðºÅ,       ¼ìÒßµÇ¼ÇºÅ,       ÍøÖ·,       ÁªÏµµç»°,       ·Ö»úºÅ,       ´«Õæ,       Ô±¹¤Êý,       ·¨ÈË´ú±í,       ·¨ÈËµç»°,
       ÆäËûÐÅÏ¢,       ¸üÐÂÊ±¼ä,       ²É¼¯Ê±¼ä,       Êý¾ÝÀ´Ô´,       Èë¿âÊ±¼ä,       ÎÄ¼þÃû,       ÊÖ»ú,       µç×ÓÓÊÏä,       ¸ºÔðÈË,       ¹«Ë¾¼ò³Æ,
       µÇ¼Ç»ú¹Ø,       Ö¤È¯¼ò³Æ,       ¹«Ë¾Ó¢ÎÄÃû,       ÔøÓÃÃû,       Ö¤È¯¼ò³Æ±ä¸üÀúÊ·,       ×¢²áµØÖ·,       ¹«Ë¾¼ò½é,       ¾­ÓªÄ£Ê½,       Ö÷Òª²úÆ·,
       Ö°Îñ,       ÓªÒµÆÚÏÞÖÁ,       ÓªÒµÆÚÏÞ×Ô,       ºË×¼Ê±¼ä,       ×é³ÉÐÎÊ½
  from shxg_qyxg_¹«Ë¾»ù±¾ÐÅÏ¢
union all
select ×¢²áºÅ,       ×éÖ¯»ú¹¹´úÂë,       ¹«Ë¾Ãû³Æ,       ÆóÒµÀàÐÍ,       ¹ú±ð»òµØÇø,       ÐÐÕþÇø»®,       ÓÊÕþ±àÂë,       ËùÊôµØÇø,       ÏêÏ¸µØÖ·,
       ËùÊôÐÐÒµ,       ¾­Óª·¶Î§,       ¾­ÓªÃæ»ý,       ³ÉÁ¢ÈÕÆÚ,       ×¢²áÀàÐÍ,       ×¢²á×Ê½ð,       ×¢²áÈÕÆÚ,       ÆóÒµµÇ¼Ç×´Ì¬,       ½ø³ö¿Ú´úÂë,
       ¹úË°ºÅ,       µØË°ºÅ,       ¹«»ý½ðºÅ,       ¼ìÒßµÇ¼ÇºÅ,       ÍøÖ·,       ÁªÏµµç»°,       ·Ö»úºÅ,       ´«Õæ,       Ô±¹¤Êý,       ·¨ÈË´ú±í,       ·¨ÈËµç»°,
       ÆäËûÐÅÏ¢,       ¸üÐÂÊ±¼ä,       ²É¼¯Ê±¼ä,       Êý¾ÝÀ´Ô´,       Èë¿âÊ±¼ä,       ÎÄ¼þÃû,       ÊÖ»ú,       µç×ÓÓÊÏä,       ¸ºÔðÈË,       ¹«Ë¾¼ò³Æ,
       µÇ¼Ç»ú¹Ø,       Ö¤È¯¼ò³Æ,       ¹«Ë¾Ó¢ÎÄÃû,       ÔøÓÃÃû,       Ö¤È¯¼ò³Æ±ä¸üÀúÊ·,       ×¢²áµØÖ·,       ¹«Ë¾¼ò½é,       ¾­ÓªÄ£Ê½,       Ö÷Òª²úÆ·,
       Ö°Îñ,       ÓªÒµÆÚÏÞÖÁ,       ÓªÒµÆÚÏÞ×Ô,       ºË×¼Ê±¼ä,       ×é³ÉÐÎÊ½
  from shxg_qyxg_¹«Ë¾»ù±¾ÐÅÏ¢_8g
;



-- NO¡£2 É¸Ñ¡³öÎÒÏëÒªµÄÐÅÏ¢

--  1 cropBase_union_full_name

create table cropBase_unionall_temp as
select trim(×¢²áºÅ) as ×¢²áºÅ,         trim(×éÖ¯»ú¹¹´úÂë) as ×éÖ¯»ú¹¹´úÂë,        trim(¹«Ë¾Ãû³Æ) as ¹«Ë¾Ãû³Æ,        trim(ÆóÒµÀàÐÍ) as ÆóÒµÀàÐÍ,       
       trim(ÐÐÕþÇø»®) as ÐÐÕþÇø»®,     trim(ÓÊÕþ±àÂë) as ÓÊÕþ±àÂë,                trim(ËùÊôµØÇø) as ËùÊôµØÇø,        trim(ÏêÏ¸µØÖ·) as ÏêÏ¸µØÖ·,      
       trim(ËùÊôÐÐÒµ) as ËùÊôÐÐÒµ,     trim(¾­Óª·¶Î§) as ¾­Óª·¶Î§,                trim(¾­ÓªÃæ»ý) as ¾­ÓªÃæ»ý,        trim(³ÉÁ¢ÈÕÆÚ) as ³ÉÁ¢ÈÕÆÚ,       
       trim(×¢²á×Ê½ð) as ×¢²á×Ê½ð,     trim(×¢²áÈÕÆÚ) as ×¢²áÈÕÆÚ,                trim(ÆóÒµµÇ¼Ç×´Ì¬) as ÆóÒµµÇ¼Ç×´Ì¬,trim(½ø³ö¿Ú´úÂë) as ½ø³ö¿Ú´úÂë,    
       trim(¹ú±ð»òµØÇø) as ¹ú±ð»òµØÇø, trim(ÁªÏµµç»°) as ÁªÏµµç»°,                trim(ÊÖ»ú) as ÊÖ»ú,                trim(²É¼¯Ê±¼ä) as ²É¼¯Ê±¼ä, 
       trim(¹úË°ºÅ) as ¹úË°ºÅ,         trim(µØË°ºÅ) as µØË°ºÅ,                    trim(¹«»ý½ðºÅ) as ¹«»ý½ðºÅ,        trim(¼ìÒßµÇ¼ÇºÅ) as ¼ìÒßµÇ¼ÇºÅ,               
       trim(·Ö»úºÅ) as ·Ö»úºÅ,         trim(´«Õæ) as ´«Õæ,                        trim(Ô±¹¤Êý) as Ô±¹¤Êý,            trim(·¨ÈË´ú±í) as ·¨ÈË´ú±í,       
       trim(ÆäËûÐÅÏ¢) as ÆäËûÐÅÏ¢,     trim(¸üÐÂÊ±¼ä) as ¸üÐÂÊ±¼ä,                trim(ÎÄ¼þÃû) as ÎÄ¼þÃû,            trim(Êý¾ÝÀ´Ô´) as Êý¾ÝÀ´Ô´,                
       trim(µç×ÓÓÊÏä) as µç×ÓÓÊÏä,     trim(¸ºÔðÈË) as ¸ºÔðÈË,                    trim(¹«Ë¾¼ò³Æ) as ¹«Ë¾¼ò³Æ,        trim(µÇ¼Ç»ú¹Ø) as µÇ¼Ç»ú¹Ø,              
       trim(ÔøÓÃÃû) as ÔøÓÃÃû,         trim(Ö¤È¯¼ò³Æ±ä¸üÀúÊ·) as Ö¤È¯¼ò³Æ±ä¸üÀúÊ·,trim(×¢²áµØÖ·) as ×¢²áµØÖ·,        trim(¹«Ë¾¼ò½é) as ¹«Ë¾¼ò½é,        
       trim(Ö°Îñ) as Ö°Îñ,             trim(ÓªÒµÆÚÏÞÖÁ) as ÓªÒµÆÚÏÞÖÁ,            trim(ÓªÒµÆÚÏÞ×Ô) as ÓªÒµÆÚÏÞ×Ô,    trim(ºË×¼Ê±¼ä) as ºË×¼Ê±¼ä,  
       trim(·¨ÈËµç»°) as ·¨ÈËµç»°,     trim(ÍøÖ·) asÍøÖ·,                         trim(Èë¿âÊ±¼ä) as Èë¿âÊ±¼ä,        trim(Ö¤È¯¼ò³Æ) as Ö¤È¯¼ò³Æ,  
       trim(¾­ÓªÄ£Ê½) as ¾­ÓªÄ£Ê½,     trim(×¢²áÀàÐÍ) as ×¢²áÀàÐÍ,                trim(¹«Ë¾Ó¢ÎÄÃû) as ¹«Ë¾Ó¢ÎÄÃû,    trim(Ö÷Òª²úÆ·) as Ö÷Òª²úÆ·,
       trim(×é³ÉÐÎÊ½)  as ×é³ÉÐÎÊ½
from shxg_qyxg_cropBase_unionall  t
where  t.¹«Ë¾Ãû³Æ is not null;

-- 2 È¥ÖØ  
-- I  1 Ö±½ÓÄÃ³ö²»ÖØ¸´µÄÊý¾Ýµ½×îÖÕ±íÖÐ
/*
create table cropBase_union_full_name 
as
select * from cropBase_unionall_temp
where ¹«Ë¾Ãû³Æ in(
  select ¹«Ë¾Ãû³Æ from cropBase_unionall_temp
  group by ¹«Ë¾Ãû³Æ
  having count(1)<2
)
;

--    2 È¥µôÁÙÊ±±íÖÐµÄµ¥Ìõ¼ÇÂ¼
delete from cropBase_unionall_temp
where ¹«Ë¾Ãû³Æ in(
  select ¹«Ë¾Ãû³Æ from cropBase_unionall_temp
  group by ¹«Ë¾Ãû³Æ
  having count(1)<2
)
;*/
-- II  ¶àÌõ¼ÇÂ¼µÄ´¦Àí
--   1 ÄÃµ½²»ÖØ¸´µÄÆóÒµÃû ¡¢×¢²áºÅ
create table cropBase_union_full_name 
as
select  ×¢²áºÅ,  ×éÖ¯»ú¹¹´úÂë,¹«Ë¾Ãû³Æ,  ÆóÒµÀàÐÍ,  ¹ú±ð»òµØÇø,      ÐÐÕþÇø»®,  ÓÊÕþ±àÂë, ËùÊôµØÇø,    ÏêÏ¸µØÖ·,
       ËùÊôÐÐÒµ,¾­Óª·¶Î§,    ¾­ÓªÃæ»ý,  ³ÉÁ¢ÈÕÆÚ,  ×¢²áÀàÐÍ,        ×¢²á×Ê½ð,  ×¢²áÈÕÆÚ, ÆóÒµµÇ¼Ç×´Ì¬,½ø³ö¿Ú´úÂë,
       ¹úË°ºÅ,  µØË°ºÅ,      ¹«»ý½ðºÅ,  ¼ìÒßµÇ¼ÇºÅ,ÍøÖ·,            ÁªÏµµç»°,  ·Ö»úºÅ,   ´«Õæ,        Ô±¹¤Êý,            
       ÆäËûÐÅÏ¢,¸üÐÂÊ±¼ä,    ²É¼¯Ê±¼ä,  Êý¾ÝÀ´Ô´,  Èë¿âÊ±¼ä,        ÎÄ¼þÃû,    ÊÖ»ú,     µç×ÓÓÊÏä,    ¸ºÔðÈË,       
       µÇ¼Ç»ú¹Ø,Ö¤È¯¼ò³Æ,    ¹«Ë¾Ó¢ÎÄÃû,ÔøÓÃÃû,    Ö¤È¯¼ò³Æ±ä¸üÀúÊ·,×¢²áµØÖ·,  ¹«Ë¾¼ò½é, ¾­ÓªÄ£Ê½,    Ö÷Òª²úÆ·,
       ·¨ÈË´ú±í,¹«Ë¾¼ò³Æ,    ·¨ÈËµç»°,  Ö°Îñ,      ÓªÒµÆÚÏÞÖÁ,      ÓªÒµÆÚÏÞ×Ô,ºË×¼Ê±¼ä, ×é³ÉÐÎÊ½ 
from(
  select ×¢²áºÅ,  ×éÖ¯»ú¹¹´úÂë,¹«Ë¾Ãû³Æ,  ÆóÒµÀàÐÍ,  ¹ú±ð»òµØÇø,      ÐÐÕþÇø»®,  ÓÊÕþ±àÂë, ËùÊôµØÇø,    ÏêÏ¸µØÖ·,
       ËùÊôÐÐÒµ,¾­Óª·¶Î§,    ¾­ÓªÃæ»ý,  ³ÉÁ¢ÈÕÆÚ,  ×¢²áÀàÐÍ,        ×¢²á×Ê½ð,  ×¢²áÈÕÆÚ, ÆóÒµµÇ¼Ç×´Ì¬,½ø³ö¿Ú´úÂë,
       ¹úË°ºÅ,  µØË°ºÅ,      ¹«»ý½ðºÅ,  ¼ìÒßµÇ¼ÇºÅ,ÍøÖ·,            ÁªÏµµç»°,  ·Ö»úºÅ,   ´«Õæ,        Ô±¹¤Êý,            
       ÆäËûÐÅÏ¢,¸üÐÂÊ±¼ä,    ²É¼¯Ê±¼ä,  Êý¾ÝÀ´Ô´,  Èë¿âÊ±¼ä,        ÎÄ¼þÃû,    ÊÖ»ú,     µç×ÓÓÊÏä,    ¸ºÔðÈË,       
       µÇ¼Ç»ú¹Ø,Ö¤È¯¼ò³Æ,    ¹«Ë¾Ó¢ÎÄÃû,ÔøÓÃÃû,    Ö¤È¯¼ò³Æ±ä¸üÀúÊ·,×¢²áµØÖ·,  ¹«Ë¾¼ò½é, ¾­ÓªÄ£Ê½,    Ö÷Òª²úÆ·,
       ·¨ÈË´ú±í,¹«Ë¾¼ò³Æ,    ·¨ÈËµç»°,  Ö°Îñ,      ÓªÒµÆÚÏÞÖÁ,      ÓªÒµÆÚÏÞ×Ô,ºË×¼Ê±¼ä, ×é³ÉÐÎÊ½ ,row_number() over (partition by ¹«Ë¾Ãû³Æ order by i desc) ord 
   from (
    select  ×¢²áºÅ,  ×éÖ¯»ú¹¹´úÂë,¹«Ë¾Ãû³Æ,  ÆóÒµÀàÐÍ,  ¹ú±ð»òµØÇø,      ÐÐÕþÇø»®,  ÓÊÕþ±àÂë, ËùÊôµØÇø,    ÏêÏ¸µØÖ·,
           ËùÊôÐÐÒµ,¾­Óª·¶Î§,    ¾­ÓªÃæ»ý,  ³ÉÁ¢ÈÕÆÚ,  ×¢²áÀàÐÍ,        ×¢²á×Ê½ð,  ×¢²áÈÕÆÚ, ÆóÒµµÇ¼Ç×´Ì¬,½ø³ö¿Ú´úÂë,
           ¹úË°ºÅ,  µØË°ºÅ,      ¹«»ý½ðºÅ,  ¼ìÒßµÇ¼ÇºÅ,ÍøÖ·,            ÁªÏµµç»°,  ·Ö»úºÅ,   ´«Õæ,        Ô±¹¤Êý,            
           ÆäËûÐÅÏ¢,¸üÐÂÊ±¼ä,    ²É¼¯Ê±¼ä,  Êý¾ÝÀ´Ô´,  Èë¿âÊ±¼ä,        ÎÄ¼þÃû,    ÊÖ»ú,     µç×ÓÓÊÏä,    ¸ºÔðÈË,       
           µÇ¼Ç»ú¹Ø,Ö¤È¯¼ò³Æ,    ¹«Ë¾Ó¢ÎÄÃû,ÔøÓÃÃû,    Ö¤È¯¼ò³Æ±ä¸üÀúÊ·,×¢²áµØÖ·,  ¹«Ë¾¼ò½é, ¾­ÓªÄ£Ê½,    Ö÷Òª²úÆ·,
           ·¨ÈË´ú±í,¹«Ë¾¼ò³Æ,    ·¨ÈËµç»°,  Ö°Îñ,      ÓªÒµÆÚÏÞÖÁ,      ÓªÒµÆÚÏÞ×Ô,ºË×¼Ê±¼ä, ×é³ÉÐÎÊ½,
          (
          a1+a2+a3+a4+a5+a6+a7+a8+a9+
          b1+b2+b3+b4+b5+b6+b7+b8+b9+
          c1+c2+c3+c4+c5+c6+c7+c8+c9+
          d1+d2+d3+d4+d5+d6+d7+d8+d9+
          e1+e2+e3+e4+e5+e6+e7+e8+e9+
          f1+f2+f3+f4+f5+f6+f7+f8
          ) i 
    from (
      select  ×¢²áºÅ,  ×éÖ¯»ú¹¹´úÂë,¹«Ë¾Ãû³Æ,  ÆóÒµÀàÐÍ,  ¹ú±ð»òµØÇø,      ÐÐÕþÇø»®,  ÓÊÕþ±àÂë, ËùÊôµØÇø,    ÏêÏ¸µØÖ·,
             ËùÊôÐÐÒµ,¾­Óª·¶Î§,    ¾­ÓªÃæ»ý,  ³ÉÁ¢ÈÕÆÚ,  ×¢²áÀàÐÍ,        ×¢²á×Ê½ð,  ×¢²áÈÕÆÚ, ÆóÒµµÇ¼Ç×´Ì¬,½ø³ö¿Ú´úÂë,
             ¹úË°ºÅ,  µØË°ºÅ,      ¹«»ý½ðºÅ,  ¼ìÒßµÇ¼ÇºÅ,asÍøÖ· as ÍøÖ·,            ÁªÏµµç»°,  ·Ö»úºÅ,   ´«Õæ,        Ô±¹¤Êý,            
             ÆäËûÐÅÏ¢,¸üÐÂÊ±¼ä,    ²É¼¯Ê±¼ä,  Êý¾ÝÀ´Ô´,  Èë¿âÊ±¼ä,        ÎÄ¼þÃû,    ÊÖ»ú,     µç×ÓÓÊÏä,    ¸ºÔðÈË,       
             µÇ¼Ç»ú¹Ø,Ö¤È¯¼ò³Æ,    ¹«Ë¾Ó¢ÎÄÃû,ÔøÓÃÃû,    Ö¤È¯¼ò³Æ±ä¸üÀúÊ·,×¢²áµØÖ·,  ¹«Ë¾¼ò½é, ¾­ÓªÄ£Ê½,    Ö÷Òª²úÆ·,
             ·¨ÈË´ú±í,¹«Ë¾¼ò³Æ,    ·¨ÈËµç»°,  Ö°Îñ,      ÓªÒµÆÚÏÞÖÁ,      ÓªÒµÆÚÏÞ×Ô,ºË×¼Ê±¼ä, ×é³ÉÐÎÊ½
            --,×¢²áºÅ,  ×éÖ¯»ú¹¹´úÂë,¹«Ë¾Ãû³Æ,  ÆóÒµÀàÐÍ,  ¹ú±ð»òµØÇø,      ÐÐÕþÇø»®,  ÓÊÕþ±àÂë, ËùÊôµØÇø,    ÏêÏ¸µØÖ·,
            ,nvl2(×¢²áºÅ,1,0) a1,nvl2(×éÖ¯»ú¹¹´úÂë,1,0) a2,nvl2(¹«Ë¾Ãû³Æ,1,0) a3
            ,nvl2(ÆóÒµÀàÐÍ,1,0) a4,nvl2(¹ú±ð»òµØÇø,1,0) a5,nvl2(ÐÐÕþÇø»®,1,0) a6
            ,nvl2(ÓÊÕþ±àÂë,1,0) a7,nvl2(ËùÊôµØÇø,1,0) a8,nvl2(ÏêÏ¸µØÖ·,1,0) a9
            --  ËùÊôÐÐÒµ,¾­Óª·¶Î§,    ¾­ÓªÃæ»ý,  ³ÉÁ¢ÈÕÆÚ,  ×¢²áÀàÐÍ,        ×¢²á×Ê½ð,  ×¢²áÈÕÆÚ, ÆóÒµµÇ¼Ç×´Ì¬,½ø³ö¿Ú´úÂë,
            ,nvl2(ËùÊôÐÐÒµ,1,0) b1,nvl2(¾­Óª·¶Î§,1,0) b2,nvl2(¾­ÓªÃæ»ý,1,0) b3
            ,nvl2(³ÉÁ¢ÈÕÆÚ,1,0) b4,nvl2(×¢²áÀàÐÍ,1,0) b5,nvl2(×¢²á×Ê½ð,1,0) b6
            ,nvl2(×¢²áÈÕÆÚ,1,0) b7,nvl2(ÆóÒµµÇ¼Ç×´Ì¬,1,0) b8,nvl2(½ø³ö¿Ú´úÂë,1,0) b9
            -- ¹úË°ºÅ,  µØË°ºÅ,      ¹«»ý½ðºÅ,  ¼ìÒßµÇ¼ÇºÅ,ÍøÖ·,            ÁªÏµµç»°,  ·Ö»úºÅ,   ´«Õæ,        Ô±¹¤Êý,     
            ,nvl2(¹úË°ºÅ,1,0) c1,nvl2(µØË°ºÅ,1,0) c2,nvl2(¹«»ý½ðºÅ,1,0) c3
            ,nvl2(¼ìÒßµÇ¼ÇºÅ,1,0) c4,nvl2(asÍøÖ·,1,0) c5,nvl2(ÁªÏµµç»°,1,0) c6
            ,nvl2(·Ö»úºÅ,1,0) c7,nvl2(´«Õæ,1,0) c8,nvl2(Ô±¹¤Êý,1,0) c9
            -- ÆäËûÐÅÏ¢,¸üÐÂÊ±¼ä,    ²É¼¯Ê±¼ä,  Êý¾ÝÀ´Ô´,  Èë¿âÊ±¼ä,        ÎÄ¼þÃû,    ÊÖ»ú,     µç×ÓÓÊÏä,    ¸ºÔðÈË,     
            ,nvl2(ÆäËûÐÅÏ¢,1,0) d1,nvl2(¸üÐÂÊ±¼ä,1,0) d2,nvl2(²É¼¯Ê±¼ä,1,0) d3
            ,nvl2(Êý¾ÝÀ´Ô´,1,0) d4,nvl2(Èë¿âÊ±¼ä,1,0) d5,nvl2(ÎÄ¼þÃû,1,0) d6
            ,nvl2(ÊÖ»ú,1,0) d7,nvl2(µç×ÓÓÊÏä,1,0) d8,nvl2(¸ºÔðÈË,1,0) d9
            --  µÇ¼Ç»ú¹Ø,Ö¤È¯¼ò³Æ,    ¹«Ë¾Ó¢ÎÄÃû,ÔøÓÃÃû,    Ö¤È¯¼ò³Æ±ä¸üÀúÊ·,×¢²áµØÖ·,  ¹«Ë¾¼ò½é, ¾­ÓªÄ£Ê½,    Ö÷Òª²úÆ·,
            ,nvl2(µÇ¼Ç»ú¹Ø,1,0) e1,nvl2(Ö¤È¯¼ò³Æ,1,0) e2,nvl2(¹«Ë¾Ó¢ÎÄÃû,1,0) e3
            ,nvl2(ÔøÓÃÃû,1,0) e4,nvl2(Ö¤È¯¼ò³Æ±ä¸üÀúÊ·,1,0) e5,nvl2(×¢²áµØÖ·,1,0) e6
            ,nvl2(¹«Ë¾¼ò½é,1,0) e7,nvl2(¾­ÓªÄ£Ê½,1,0) e8,nvl2(Ö÷Òª²úÆ·,1,0) e9
            -- ·¨ÈË´ú±í,¹«Ë¾¼ò³Æ,    ·¨ÈËµç»°,  Ö°Îñ,      ÓªÒµÆÚÏÞÖÁ,      ÓªÒµÆÚÏÞ×Ô,ºË×¼Ê±¼ä, ×é³ÉÐÎÊ½
            ,nvl2(·¨ÈË´ú±í,1,0) f1,nvl2(¹«Ë¾¼ò³Æ,1,0) f2,nvl2(·¨ÈËµç»°,1,0) f3
            ,nvl2(Ö°Îñ,1,0) f4,nvl2(ÓªÒµÆÚÏÞÖÁ,1,0) f5,nvl2(ÓªÒµÆÚÏÞ×Ô,1,0) f6
            ,nvl2(ºË×¼Ê±¼ä,1,0) f7,nvl2(×é³ÉÐÎÊ½,1,0) f8

       from zhcx.cropBase_unionall_temp
      ) v
    )
  )
where ord=1
;
--   2  drop
--drop table cropBase_unionall_temp;


-- III ÕûÀí
--   1 ×¢²áºÅÕûÀí ÐÅÓÃ´úÂëºÍ×¢²áºÅ
alter table cropBase_union_full_name add Í³Ò»Éç»áÐÅÓÃ´úÂë varchar2(20);
update cropBase_union_full_name
set Í³Ò»Éç»áÐÅÓÃ´úÂë = ×¢²áºÅ,
×¢²áºÅ = ''
where lengthb(×¢²áºÅ) = 18
and ×¢²áºÅ not like '%-%'
and ×¢²áºÅ not like '%(%'
--lengthb(×¢²áºÅ) = length(×¢²áºÅ)
;
commit;
 
update cropBase_union_full_name
set ×¢²áºÅ = Í³Ò»Éç»áÐÅÓÃ´úÂë
, Í³Ò»Éç»áÐÅÓÃ´úÂë = ''
where lengthb(Í³Ò»Éç»áÐÅÓÃ´úÂë) <> length(Í³Ò»Éç»áÐÅÓÃ´úÂë)
and Í³Ò»Éç»áÐÅÓÃ´úÂë is not null;
commit;

--   2 ÎÄ¼þÃû Èë¿âÊ±¼ä
 alter table cropBase_union_full_name drop column ÎÄ¼þÃû;  
 alter table cropBase_union_full_name drop column Èë¿âÊ±¼ä;  
 
--  3  ¹«Ë¾Ãû³ÆÇåÏ´
--  É¾µôÊý×Ö
update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = to_single_byte(¹«Ë¾Ãû³Æ)
;
commit;


delete from cropBase_union_full_name
where length(¹«Ë¾Ãû³Æ) = lengthb(¹«Ë¾Ãû³Æ);
commit;

delete from cropBase_union_full_name
where ¹«Ë¾Ãû³Æ like '____Äê__ÔÂ__ÈÕ';
commit;
--
 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'?',''))
where ¹«Ë¾Ãû³Æ like '%?%';
commit;


-- ¸Ã±í¸üÐÂÊ±¼ä




 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'',''))
where ¹«Ë¾Ãû³Æ like '%%';
commit;

 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'
',''))
where ¹«Ë¾Ãû³Æ like '%
%';
commit;

 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'',''))
where ¹«Ë¾Ãû³Æ like '%%';
commit;

 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'',''))
where ¹«Ë¾Ãû³Æ like '%%';
commit;


 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'',''))
where ¹«Ë¾Ãû³Æ like '%%';
commit;


 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'!',''))
where ¹«Ë¾Ãû³Æ like '%!%';
commit;

 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'"',''))
where ¹«Ë¾Ãû³Æ like '%"%';
commit;

--
 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,')',''))
where ¹«Ë¾Ãû³Æ like ')%';
commit;

 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'.',''))
where ¹«Ë¾Ãû³Æ like '%.%';
commit;

 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'*',''))
where ¹«Ë¾Ãû³Æ like '%*%';
commit;


 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'+',''))
where ¹«Ë¾Ãû³Æ like '+%';
commit;


 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,',',''))
where ¹«Ë¾Ãû³Æ like ',%';
commit;

 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'-',''))
where ¹«Ë¾Ãû³Æ like '-%';
commit;

 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'/',''))
where ¹«Ë¾Ãû³Æ like '/%';
commit;


 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'=',''))
where ¹«Ë¾Ãû³Æ like '=%';
commit;

 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'>',''))
where ¹«Ë¾Ãû³Æ like '>%';
commit;


 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,' ',''))
where ¹«Ë¾Ãû³Æ like ' %';
commit;

 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'¡¯',''))
where ¹«Ë¾Ãû³Æ like '¡¯%';
commit;
 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'¡¬',''))
where ¹«Ë¾Ãû³Æ like '¡¬%';
commit;
 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'¡¤',''))
where ¹«Ë¾Ãû³Æ like '¡¤%';
commit;
 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'¡£',''))
where ¹«Ë¾Ãû³Æ like '¡£%';
commit;
 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'¡£',''))
where ¹«Ë¾Ãû³Æ like '¡£%';
commit;
 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'|',''))
where ¹«Ë¾Ãû³Æ like '|%';
commit;
 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'nbsp;',''))
where ¹«Ë¾Ãû³Æ like 'nbsp;%';
commit;

 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'~',''))
where ¹«Ë¾Ãû³Æ like '~%';
commit;

 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'#',''))
where ¹«Ë¾Ãû³Æ like '#%';
commit;
 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'`',''))
where ¹«Ë¾Ãû³Æ like '`%';
commit;
 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'_',''))
where ¹«Ë¾Ãû³Æ like '_%';
commit;
 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'^',''))
where ¹«Ë¾Ãû³Æ like '^%';
commit;
 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,']',''))
where ¹«Ë¾Ãû³Æ like ']%';
commit;
 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'\',''))
where ¹«Ë¾Ãû³Æ like '\%';
commit;
 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'>',''))
where ¹«Ë¾Ãû³Æ like '>%';
commit;
 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'?',''))
where ¹«Ë¾Ãû³Æ like '?%';
commit;
 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'@',''))
where ¹«Ë¾Ãû³Æ like '@%';
commit;
 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,';',''))
where ¹«Ë¾Ãû³Æ like ';%';
commit;
 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'&',''))
where ¹«Ë¾Ãû³Æ like '&%';
commit;
 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'''',''))
where ¹«Ë¾Ãû³Æ like '''%';
commit;
-- È«½Ç¿Õ¸ñ
 update cropBase_union_full_name
set ¹«Ë¾Ãû³Æ = trim(replace(¹«Ë¾Ãû³Æ,'¡¡',''))
where ¹«Ë¾Ãû³Æ like '%¡¡%';
commit;

--
select * from cropBase_union_full_name
where length(¹«Ë¾Ãû³Æ) = lengthb(¹«Ë¾Ãû³Æ)


--  *** É¾µô ¿ÕµÄ
delete from cropBase_union_full_name
where length(¹«Ë¾Ãû³Æ) = lengthb(¹«Ë¾Ãû³Æ);
commit;

delete from cropBase_union_full_name t
where length(t.¹«Ë¾Ãû³Æ)<4
;
commit;
-- ´ÓÐÂÈ¥ÖØÉú³É±í
select t.¹«Ë¾Ãû³Æ from cropBase_union_full_name t
group by t.¹«Ë¾Ãû³Æ
having count(1)>1



-- alter 
rename cropBase_union_full_name to cropBase_unionall_temp1;


create table cropBase_union_full_name 
as
select  ×¢²áºÅ,  ×éÖ¯»ú¹¹´úÂë,¹«Ë¾Ãû³Æ,  ÆóÒµÀàÐÍ,  ¹ú±ð»òµØÇø,      ÐÐÕþÇø»®,  ÓÊÕþ±àÂë, ËùÊôµØÇø,    ÏêÏ¸µØÖ·,
       ËùÊôÐÐÒµ,¾­Óª·¶Î§,    ¾­ÓªÃæ»ý,  ³ÉÁ¢ÈÕÆÚ,  ×¢²áÀàÐÍ,        ×¢²á×Ê½ð,  ×¢²áÈÕÆÚ, ÆóÒµµÇ¼Ç×´Ì¬,½ø³ö¿Ú´úÂë,
       ¹úË°ºÅ,  µØË°ºÅ,      ¹«»ý½ðºÅ,  ¼ìÒßµÇ¼ÇºÅ,ÍøÖ·,            ÁªÏµµç»°,  ·Ö»úºÅ,   ´«Õæ,        Ô±¹¤Êý,            
       ÆäËûÐÅÏ¢,¸üÐÂÊ±¼ä,    ²É¼¯Ê±¼ä,  Êý¾ÝÀ´Ô´, /* Èë¿âÊ±¼ä,        ÎÄ¼þÃû,*/    ÊÖ»ú,     µç×ÓÓÊÏä,    ¸ºÔðÈË,       
       µÇ¼Ç»ú¹Ø,Ö¤È¯¼ò³Æ,    ¹«Ë¾Ó¢ÎÄÃû,ÔøÓÃÃû,    Ö¤È¯¼ò³Æ±ä¸üÀúÊ·,×¢²áµØÖ·,  ¹«Ë¾¼ò½é, ¾­ÓªÄ£Ê½,    Ö÷Òª²úÆ·,
       ·¨ÈË´ú±í,¹«Ë¾¼ò³Æ,    ·¨ÈËµç»°,  Ö°Îñ,      ÓªÒµÆÚÏÞÖÁ,      ÓªÒµÆÚÏÞ×Ô,ºË×¼Ê±¼ä, ×é³ÉÐÎÊ½ ,Í³Ò»Éç»áÐÅÓÃ´úÂë
from(
  select ×¢²áºÅ,  ×éÖ¯»ú¹¹´úÂë,¹«Ë¾Ãû³Æ,  ÆóÒµÀàÐÍ,  ¹ú±ð»òµØÇø,      ÐÐÕþÇø»®,  ÓÊÕþ±àÂë, ËùÊôµØÇø,    ÏêÏ¸µØÖ·,
       ËùÊôÐÐÒµ,¾­Óª·¶Î§,    ¾­ÓªÃæ»ý,  ³ÉÁ¢ÈÕÆÚ,  ×¢²áÀàÐÍ,        ×¢²á×Ê½ð,  ×¢²áÈÕÆÚ, ÆóÒµµÇ¼Ç×´Ì¬,½ø³ö¿Ú´úÂë,
       ¹úË°ºÅ,  µØË°ºÅ,      ¹«»ý½ðºÅ,  ¼ìÒßµÇ¼ÇºÅ,ÍøÖ·,            ÁªÏµµç»°,  ·Ö»úºÅ,   ´«Õæ,        Ô±¹¤Êý,            
       ÆäËûÐÅÏ¢,¸üÐÂÊ±¼ä,    ²É¼¯Ê±¼ä,  Êý¾ÝÀ´Ô´,  /*Èë¿âÊ±¼ä,        ÎÄ¼þÃû,  */  ÊÖ»ú,     µç×ÓÓÊÏä,    ¸ºÔðÈË,       
       µÇ¼Ç»ú¹Ø,Ö¤È¯¼ò³Æ,    ¹«Ë¾Ó¢ÎÄÃû,ÔøÓÃÃû,    Ö¤È¯¼ò³Æ±ä¸üÀúÊ·,×¢²áµØÖ·,  ¹«Ë¾¼ò½é, ¾­ÓªÄ£Ê½,    Ö÷Òª²úÆ·,
       ·¨ÈË´ú±í,¹«Ë¾¼ò³Æ,    ·¨ÈËµç»°,  Ö°Îñ,      ÓªÒµÆÚÏÞÖÁ,      ÓªÒµÆÚÏÞ×Ô,ºË×¼Ê±¼ä, ×é³ÉÐÎÊ½,Í³Ò»Éç»áÐÅÓÃ´úÂë
        ,row_number() over (partition by ¹«Ë¾Ãû³Æ order by i desc) ord 
   from (
    select  ×¢²áºÅ,  ×éÖ¯»ú¹¹´úÂë,¹«Ë¾Ãû³Æ,  ÆóÒµÀàÐÍ,  ¹ú±ð»òµØÇø,      ÐÐÕþÇø»®,  ÓÊÕþ±àÂë, ËùÊôµØÇø,    ÏêÏ¸µØÖ·,
           ËùÊôÐÐÒµ,¾­Óª·¶Î§,    ¾­ÓªÃæ»ý,  ³ÉÁ¢ÈÕÆÚ,  ×¢²áÀàÐÍ,        ×¢²á×Ê½ð,  ×¢²áÈÕÆÚ, ÆóÒµµÇ¼Ç×´Ì¬,½ø³ö¿Ú´úÂë,
           ¹úË°ºÅ,  µØË°ºÅ,      ¹«»ý½ðºÅ,  ¼ìÒßµÇ¼ÇºÅ,ÍøÖ·,            ÁªÏµµç»°,  ·Ö»úºÅ,   ´«Õæ,        Ô±¹¤Êý,            
           ÆäËûÐÅÏ¢,¸üÐÂÊ±¼ä,    ²É¼¯Ê±¼ä,  Êý¾ÝÀ´Ô´, /* Èë¿âÊ±¼ä,        ÎÄ¼þÃû,*/    ÊÖ»ú,     µç×ÓÓÊÏä,    ¸ºÔðÈË,       
           µÇ¼Ç»ú¹Ø,Ö¤È¯¼ò³Æ,    ¹«Ë¾Ó¢ÎÄÃû,ÔøÓÃÃû,    Ö¤È¯¼ò³Æ±ä¸üÀúÊ·,×¢²áµØÖ·,  ¹«Ë¾¼ò½é, ¾­ÓªÄ£Ê½,    Ö÷Òª²úÆ·,
           ·¨ÈË´ú±í,¹«Ë¾¼ò³Æ,    ·¨ÈËµç»°,  Ö°Îñ,      ÓªÒµÆÚÏÞÖÁ,      ÓªÒµÆÚÏÞ×Ô,ºË×¼Ê±¼ä, ×é³ÉÐÎÊ½,Í³Ò»Éç»áÐÅÓÃ´úÂë,
          (
          a1+a2+a3+a4+a5+a6+a7+a8+a9+
          b1+b2+b3+b4+b5+b6+b7+b8+b9+
          c1+c2+c3+c4+c5+c6+c7+c8+c9+
          d1+d2+d3+d4+ d7+d8+d9+
          e1+e2+e3+e4+e5+e6+e7+e8+e9+
          f1+f2+f3+f4+f5+f6+f7+f8+f9
          ) i 
    from (
      select  ×¢²áºÅ,  ×éÖ¯»ú¹¹´úÂë,trim(¹«Ë¾Ãû³Æ) as ¹«Ë¾Ãû³Æ ,  ÆóÒµÀàÐÍ,  ¹ú±ð»òµØÇø,      ÐÐÕþÇø»®,  ÓÊÕþ±àÂë, ËùÊôµØÇø,    ÏêÏ¸µØÖ·,
             ËùÊôÐÐÒµ,¾­Óª·¶Î§,    ¾­ÓªÃæ»ý,  ³ÉÁ¢ÈÕÆÚ,  ×¢²áÀàÐÍ,        ×¢²á×Ê½ð,  ×¢²áÈÕÆÚ, ÆóÒµµÇ¼Ç×´Ì¬,½ø³ö¿Ú´úÂë,
             ¹úË°ºÅ,  µØË°ºÅ,      ¹«»ý½ðºÅ,  ¼ìÒßµÇ¼ÇºÅ,ÍøÖ· as ÍøÖ·,            ÁªÏµµç»°,  ·Ö»úºÅ,   ´«Õæ,        Ô±¹¤Êý,            
             ÆäËûÐÅÏ¢,¸üÐÂÊ±¼ä,    ²É¼¯Ê±¼ä,  Êý¾ÝÀ´Ô´,  /*Èë¿âÊ±¼ä,        ÎÄ¼þÃû,*/    ÊÖ»ú,     µç×ÓÓÊÏä,    ¸ºÔðÈË,       
             µÇ¼Ç»ú¹Ø,Ö¤È¯¼ò³Æ,    ¹«Ë¾Ó¢ÎÄÃû,ÔøÓÃÃû,    Ö¤È¯¼ò³Æ±ä¸üÀúÊ·,×¢²áµØÖ·,  ¹«Ë¾¼ò½é, ¾­ÓªÄ£Ê½,    Ö÷Òª²úÆ·,
             ·¨ÈË´ú±í,¹«Ë¾¼ò³Æ,    ·¨ÈËµç»°,  Ö°Îñ,      ÓªÒµÆÚÏÞÖÁ,      ÓªÒµÆÚÏÞ×Ô,ºË×¼Ê±¼ä, ×é³ÉÐÎÊ½,Í³Ò»Éç»áÐÅÓÃ´úÂë
            --,×¢²áºÅ,  ×éÖ¯»ú¹¹´úÂë,¹«Ë¾Ãû³Æ,  ÆóÒµÀàÐÍ,  ¹ú±ð»òµØÇø,      ÐÐÕþÇø»®,  ÓÊÕþ±àÂë, ËùÊôµØÇø,    ÏêÏ¸µØÖ·,
            ,nvl2(×¢²áºÅ,1,0) a1,nvl2(×éÖ¯»ú¹¹´úÂë,1,0) a2,nvl2(¹«Ë¾Ãû³Æ,1,0) a3
            ,nvl2(ÆóÒµÀàÐÍ,1,0) a4,nvl2(¹ú±ð»òµØÇø,1,0) a5,nvl2(ÐÐÕþÇø»®,1,0) a6
            ,nvl2(ÓÊÕþ±àÂë,1,0) a7,nvl2(ËùÊôµØÇø,1,0) a8,nvl2(ÏêÏ¸µØÖ·,1,0) a9
            --  ËùÊôÐÐÒµ,¾­Óª·¶Î§,    ¾­ÓªÃæ»ý,  ³ÉÁ¢ÈÕÆÚ,  ×¢²áÀàÐÍ,        ×¢²á×Ê½ð,  ×¢²áÈÕÆÚ, ÆóÒµµÇ¼Ç×´Ì¬,½ø³ö¿Ú´úÂë,
            ,nvl2(ËùÊôÐÐÒµ,1,0) b1,nvl2(¾­Óª·¶Î§,1,0) b2,nvl2(¾­ÓªÃæ»ý,1,0) b3
            ,nvl2(³ÉÁ¢ÈÕÆÚ,1,0) b4,nvl2(×¢²áÀàÐÍ,1,0) b5,nvl2(×¢²á×Ê½ð,1,0) b6
            ,nvl2(×¢²áÈÕÆÚ,1,0) b7,nvl2(ÆóÒµµÇ¼Ç×´Ì¬,1,0) b8,nvl2(½ø³ö¿Ú´úÂë,1,0) b9
            -- ¹úË°ºÅ,  µØË°ºÅ,      ¹«»ý½ðºÅ,  ¼ìÒßµÇ¼ÇºÅ,ÍøÖ·,            ÁªÏµµç»°,  ·Ö»úºÅ,   ´«Õæ,        Ô±¹¤Êý,     
            ,nvl2(¹úË°ºÅ,1,0) c1,nvl2(µØË°ºÅ,1,0) c2,nvl2(¹«»ý½ðºÅ,1,0) c3
            ,nvl2(¼ìÒßµÇ¼ÇºÅ,1,0) c4,nvl2(ÍøÖ·,1,0) c5,nvl2(ÁªÏµµç»°,1,0) c6
            ,nvl2(·Ö»úºÅ,1,0) c7,nvl2(´«Õæ,1,0) c8,nvl2(Ô±¹¤Êý,1,0) c9
            -- ÆäËûÐÅÏ¢,¸üÐÂÊ±¼ä,    ²É¼¯Ê±¼ä,  Êý¾ÝÀ´Ô´,  Èë¿âÊ±¼ä,        ÎÄ¼þÃû,    ÊÖ»ú,     µç×ÓÓÊÏä,    ¸ºÔðÈË,     
            ,nvl2(ÆäËûÐÅÏ¢,1,0) d1,nvl2(¸üÐÂÊ±¼ä,1,0) d2,nvl2(²É¼¯Ê±¼ä,1,0) d3
            ,nvl2(Êý¾ÝÀ´Ô´,1,0) d4 /* ,nvl2(Èë¿âÊ±¼ä,1,0) d5,nvl2(ÎÄ¼þÃû,1,0) d6 */
            ,nvl2(ÊÖ»ú,1,0) d7,nvl2(µç×ÓÓÊÏä,1,0) d8,nvl2(¸ºÔðÈË,1,0) d9
            --  µÇ¼Ç»ú¹Ø,Ö¤È¯¼ò³Æ,    ¹«Ë¾Ó¢ÎÄÃû,ÔøÓÃÃû,    Ö¤È¯¼ò³Æ±ä¸üÀúÊ·,×¢²áµØÖ·,  ¹«Ë¾¼ò½é, ¾­ÓªÄ£Ê½,    Ö÷Òª²úÆ·,
            ,nvl2(µÇ¼Ç»ú¹Ø,1,0) e1,nvl2(Ö¤È¯¼ò³Æ,1,0) e2,nvl2(¹«Ë¾Ó¢ÎÄÃû,1,0) e3
            ,nvl2(ÔøÓÃÃû,1,0) e4,nvl2(Ö¤È¯¼ò³Æ±ä¸üÀúÊ·,1,0) e5,nvl2(×¢²áµØÖ·,1,0) e6
            ,nvl2(¹«Ë¾¼ò½é,1,0) e7,nvl2(¾­ÓªÄ£Ê½,1,0) e8,nvl2(Ö÷Òª²úÆ·,1,0) e9
            -- ·¨ÈË´ú±í,¹«Ë¾¼ò³Æ,    ·¨ÈËµç»°,  Ö°Îñ,      ÓªÒµÆÚÏÞÖÁ,      ÓªÒµÆÚÏÞ×Ô,ºË×¼Ê±¼ä, ×é³ÉÐÎÊ½
            ,nvl2(·¨ÈË´ú±í,1,0) f1,nvl2(¹«Ë¾¼ò³Æ,1,0) f2,nvl2(·¨ÈËµç»°,1,0) f3
            ,nvl2(Ö°Îñ,1,0) f4,nvl2(ÓªÒµÆÚÏÞÖÁ,1,0) f5,nvl2(ÓªÒµÆÚÏÞ×Ô,1,0) f6
            ,nvl2(ºË×¼Ê±¼ä,1,0) f7,nvl2(×é³ÉÐÎÊ½,1,0) f8,nvl2(Í³Ò»Éç»áÐÅÓÃ´úÂë,1,0) f9

       from zhcx.cropBase_unionall_temp1
      ) v
    )
  )
where ord=1
;

-- 
drop table cropBase_unionall_temp1
;



-- ÅäÖÃÏµÍ³±í

--  ±¸·ÝÊý¾Ý¿â  
--  É¾µô Êý¾Ý±í
/*
shxg_qyxg_¹«Ë¾»ù±¾ÐÅÏ¢
shxg_qyxg_¹«Ë¾»ù±¾ÐÅÏ¢_8g
*/
 
