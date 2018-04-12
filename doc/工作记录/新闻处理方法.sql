select * from yanshi.新闻_allnews2_distinct_btipoff;

select substr(charge,0,instr(charge,' ')-1) from yanshi.新闻_allnews2_distinct_btipoff;

update yanshi.新闻_allnews2_distinct_btipoff
set charge_1 = substr(charge,0,instr(charge,' ')-1);

commit;
update yanshi.新闻_allnews2_distinct_btipoff
set charge_1 = charge
where charge_1 is null;
commit;
