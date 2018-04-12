create or replace view vw_show_file_map_repeat as
select a.n,a.file_desc as file_desc1,
a.file_col as file_col1,
b.file_desc as file_desc2,
b.file_col as file_col2,
a.tab_name,
a.tab_col
  from (select rowid as n,n.* from sys_lrd_cols_map n) a,(select rowid as n,m.* from sys_lrd_cols_map m) b
where a.n<>b.n
and a.file_col = b.file_col
and a.tab_name = b.tab_name
and a.tab_col = b.tab_col
and a.file_desc like '%'||b.file_desc||'%';
