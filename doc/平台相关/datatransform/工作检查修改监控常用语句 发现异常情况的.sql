-- ���ݿ� �� û�е��� �� ���ñ��� ��� Ϊ ��2�� �� ��ʾ ����
select t.flag,
       t.inser_num,
       t.to_database_table_name,
       t.file_path,
       t.*,
       t.rowid
  from sys_files_info t
 where t.flag = '2'
   and upper(t.to_database_table_name) not in
       (select table_name from user_tables a)
 order by t.end_eimestimp desc;

-- ���ݿ� ���б�  ���� �� ���ñ��� ��� ���� ��2�� ����   ���߲�ѯ���������ĸ�
select 'drop table ' || to_database_table_name || ';',
       a.flag,
       a.inser_num,
       a.to_database_table_name,
       a.file_path,
       a.*,
       a.rowid
  from sys_files_info a
 where a.to_database_table_name IN
       (select table_name
          from user_tables a
         where a.table_name in (select upper(t.to_database_table_name)
                                  from sys_files_info t
                                 where t.flag <> '2'))
   and a.flag <> '2';

-- ƴ�� ɾ����� ���ݶ�ȡ ��¼��� ������ ��ƥ���   ���� �� ����� �� ������ŵ� ���� ƴ�� ����� ���� sql
select 'drop table ' || t.to_database_table_name || ';'
  from sys_files_info t
 inner join user_tables r on upper(t.to_database_table_name) = r.table_name
 where t.flag = '-2';

-- �ֶ����� �쳣 �� ���� �� ���� ֻ��һ�� ���� ���� �� ���е� 
--select * from 
select 'drop table ' || tm.table_name || ';', count(tm.COLUMN_NAME)
  from user_tables t
 inner join user_tab_columns tm on t.table_name = tm.table_name
 group by tm.table_name
having count(COLUMN_NAME) < 3;


-- ���sheet ��
select t.* ,t.rowid from sys_files_info t
where t.file_path in(
select file_path from sys_files_info a
group by file_path
having count(1)>1
)



-- �޸�
update sys_files_info t
   set t.flag                   = '0',
       t.to_database_table_name = '',
       t.separator              = '',
       t.error_message          = '',
       t.inser_num = 0,
       t.row_count=0
 where
--t.flag not in �� '-100', '0', '1', '2', '10', '11', '12', '13', '96', '97', '100', '-101' ��
 t.flag = '0'
 and t.to_database_table_name is not null;
commit;




-- �Ѿ���� ����ͳ��   10881   15484531
--                     15584   67618784
--                     16074   69841591
--                     16495   72171532
--                     17084   74506062
--                     17719   77121313
--                     17819   77555599
--                     17877   77731589
--                     17912   77855687
--                     17961   78147248
select count(1), sum(t.row_count) 
from sys_files_info t
 where t.flag = '2';

-- û�з�����������ͳ��        390958 
--                             385842
--                             385239
--                             384662
--                             384060
--                             383366
--                             290401
--                             92716
--                             0
select count(1), sum(t.row_count)
  from sys_files_info t
 where t.flag = '0'
   and t.type in
       ('#search', '#txt', 'xlsx', 'xls', '#csv', 'mdb', 'rar', 'zip', 'dbf',
        'doc', 'sql', 'lnk', 'jpg', 'bmp', 'jpeg', 'htm', 'png', '');

--  y�쳣��Ϣ��ʾ  0
select sysfilesin0_.flag,
       sysfilesin0_.inser_num,
       sysfilesin0_.to_database_table_name,
       sysfilesin0_.file_path,
       sysfilesin0_.*,
       sysfilesin0_.rowid
  from sys_files_info sysfilesin0_
 where (sysfilesin0_.flag = '-3' or sysfilesin0_.flag is null)
   and (sysfilesin0_.type in
       ('#search', 'txt', 'xlsx', 'xls', 'csv', 'mdb', 'rar', 'zip', 'dbf',
        'doc', 'sql', 'lnk', 'jpg', 'bmp', 'jpeg', 'htm', 'png', ''));

--  y�쳣��Ϣ��ʾ  2
select sysfilesin0_.flag,
       sysfilesin0_.inser_num,
       sysfilesin0_.to_database_table_name,
       sysfilesin0_.file_path,
       sysfilesin0_.*,
       sysfilesin0_.rowid
  from sys_files_info sysfilesin0_
 where (sysfilesin0_.flag not in�� '2', '1', '100', '-100', '0', '96', '97', '12', '11', '13','14', '10',
        '-101' ��)
   and (sysfilesin0_.type in
       ('#search', 'txt', 'xlsx', 'xls', 'csv', 'mdb', 'rar', 'zip', 'dbf',
        'doc', 'sql', 'lnk', 'jpg', 'bmp', 'jpeg', 'htm', 'png', ''));
-- and sysfilesin0_.error_message = 'û�в���һ������';

select t.*, t.rowid
  from sys_files_info t
 where t.flag = '2'
   and t.type in ('xls', 'xlsx', 'txt', 'csv')
 order by t.end_eimestimp desc

 where t.file_path = 'G:\����\����\201310���Ϻ��й���.xls'

;
