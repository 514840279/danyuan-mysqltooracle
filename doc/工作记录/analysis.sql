-- 1.�����û�
create user analysis identified by analysis;

-- 2 ��Ȩ ����������ӣ�dba
grant resource ,connect ,dba to analysis;

-- 3.1 �鿴��ռ��λ��
SELECT tablespace_name, 
file_id, 
file_name, 
round(bytes / (1024 * 1024), 0) total_space 
FROM dba_data_files 
ORDER BY tablespace_name; 

-- 3.2 ������ռ� wth_data
create tablespace analysis_data 
logging 
datafile 'E:\DATABASE\ORACLE\ORCL\analysis_data001.DBF' 
size 1024m 
autoextend on 
next 500m maxsize 20480m 
extent management local; 

-- 3.3 ������ռ� wth_index
create tablespace analysis_index
logging 
datafile 'E:\DATABASE\ORACLE\ORCL\analysis_index001.DBF' 
size 1024m 
autoextend on 
next 500m maxsize 20480m 
extent management local; 


--3.4 �޸��û���ռ�Ȩ��
alter user analysis quota unlimited on analysis_data;
alter user analysis quota unlimited on analysis_index;
alter user analysis  default tablespace analysis_data;

-- 4�޸ı�ռ��С����ӱ�ռ���ļ�
--ALTER TABLESPACE wth_data ADD DATAFILE 'E:\DATABASE\ORACLE\ORCL\analysis_data002.DBF'SIZE 1024M AUTOEXTEND ON NEXT 500M MAXSIZE UNLIMITED;


-- 5 ��������������
-- ����wth

-- Create database link 
drop public database link DBLINK_172_16_3_17;

create public database link DBLINK_172_16_3_17
  connect to ZHCX identified by smzhcx
  using '(DESCRIPTION =
          (ADDRESS_LIST =
            (ADDRESS = (PROTOCOL = TCP)(HOST = 172.16.3.17)(PORT = 1521))
          )
          (CONNECT_DATA =
            (SERVER = DEDICATED)
            (SERVICE_NAME = orcl17)
          )
        )';
drop public database link DBLINK_172_16_3_18;

create public database link DBLINK_172_16_3_18
  connect to hadoop identified by smhadoop
  using '(DESCRIPTION =
          (ADDRESS_LIST =
            (ADDRESS = (PROTOCOL = TCP)(HOST = 172.16.3.18)(PORT = 1521))
          )
          (CONNECT_DATA =
            (SERVER = DEDICATED)
            (SERVICE_NAME = orcl18)
          )
        )';
        
--  5.2 ���� ����
select * from user_tables@DBLINK_172_16_3_17 t;
select * from user_tables@DBLINK_172_16_3_18 t;

-- 6 �鿴 ��ռ��С
Select a.Tablespace_Name, Total, Free, Total - Free Used
  From ���� (Select Tablespace_Name, Sum(Bytes) / 1024 / 1024 Total
             From Dba_Data_Files ����group By Tablespace_Name) a,
       ���� (Select Tablespace_Name, Sum(Bytes) / 1024 / 1024 Free
             From Dba_Free_Space ����group By Tablespace_Name) b ����where a.Tablespace_Name = b.Tablespace_Name;
             
             
