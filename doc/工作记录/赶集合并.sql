create table ci_ganji_resume
as
select * from ci_ganji_resume_1_201508_04
union

select * from ci_ganji_resume_1_201509_01 union
select * from ci_ganji_resume_201508_04 union
select * from ci_ganji_resume_3_201509_01 union
select * from ci_ganji_resume_3_201509_03 union
select * from ci_ganji_resume_5_201509_03 union
select * from ci_ganji_resume_6_201509_03 union
select * from ci_ganji_resume_7_201509_03 union
select * from ci_ganji_resume_mdj_20150615 union
select * from ci_ganji_resume_xj_201509_03
;
drop  table ci_ganji_resume_1_201508_04;
drop  table ci_ganji_resume_1_201509_01;
drop  table ci_ganji_resume_201508_04;
drop  table ci_ganji_resume_3_201509_01;
drop  table ci_ganji_resume_3_201509_03;
drop  table ci_ganji_resume_5_201509_03;
drop  table ci_ganji_resume_6_201509_03;
drop  table ci_ganji_resume_7_201509_03;
drop  table ci_ganji_resume_mdj_20150615;
drop  table ci_ganji_resume_xj_201509_03;

purge  recyclebin;
