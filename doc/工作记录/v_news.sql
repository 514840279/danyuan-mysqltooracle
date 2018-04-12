create or replace view yanshi.v_news as
select
t1.title,t1.content,t1.author,t1.publishtime,t1.comefrom,t1.职务犯罪相关
,t2.name,t2.sex,t2.nation,t2.edusta,t2.job,t2.province,t2.province2,t2.area
,t2.city,t2.city2,t2.grade,t2.open,t2.town,t2.system,t2.workplace,t2.workplace_cluster
,t2.workplace_cluster2,t2.workroom,t2.workroom1,t2.workroom2,t2.workroom_cluster,t2.position
,t2.position_cluster,t2.charge,t2.charge_1,t2.pctwwp,t2.ybs,t2.sjsz,t2.gtfz,t2.szbf,t2.tazs,t2.saje,t2.sazjsx,t2.sajedw,t2.biao,t2.display
--,t3.原文,t3.手段,t3.行为,t3.useful
,t2.meanswords 手段,t2.charge 行为
from
/*
yanshi.新闻_ALLNEWS t1
,yanshi.新闻_allnews_btipoff t2
,yanshi.新闻_手段和行为 t3
*/
yanshi.新闻_allnews2_distinct t1
,yanshi.新闻_allnews2_distinct_btipoff t2
--,yanshi.新闻_罪名与手段对应 t3
where
t2.s_rownumber=t1.rownumber
--and
--t3.=t1.rownumber;
