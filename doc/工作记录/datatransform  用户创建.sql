-- 1.�����û�
create user datatransform identified by dbdatatransform;

-- 2 ��Ȩ ����������ӣ�dba
grant resource ,connect ,dba to datatransform;

-- 3.1 �鿴��ռ��λ��
SELECT tablespace_name, 
file_id, 
file_name, 
round(bytes / (1024 * 1024), 0) total_space 
FROM dba_data_files 
ORDER BY tablespace_name; 

-- 3.2 ������ռ� wth_data
create tablespace datatransform_data 
logging 
datafile '/home/db2/datatransform_data001.dbf' 
size 1024m 
autoextend on 
next 500m maxsize 20480m 
extent management local; 

-- 3.3 ������ռ� wth_index
create tablespace datatransform_index
logging 
datafile '/home/db2/datatransform_index001.dbf' 
size 1024m 
autoextend on 
next 500m maxsize 20480m 
extent management local; 


--3.4 �޸��û���ռ�Ȩ��
alter user datatransform quota unlimited on datatransform_data;
alter user datatransform quota unlimited on datatransform_index;
alter user datatransform  default tablespace datatransform_data;


alter tablespace wth_data drop datafile '/home/db2/datatransform_data002.dbf';

-- 4�޸ı�ռ��С����ӱ�ռ���ļ�
ALTER TABLESPACE datatransform_data ADD DATAFILE '/home/db2/datatransform_data002.dbf'SIZE 1024M AUTOEXTEND ON NEXT 500M MAXSIZE UNLIMITED;
ALTER TABLESPACE datatransform_data ADD DATAFILE '/home/db2/datatransform_data003.dbf'SIZE 1024M AUTOEXTEND ON NEXT 500M MAXSIZE UNLIMITED;
ALTER TABLESPACE datatransform_data ADD DATAFILE '/home/db2/datatransform_data004.dbf'SIZE 1024M AUTOEXTEND ON NEXT 500M MAXSIZE UNLIMITED;
ALTER TABLESPACE datatransform_data ADD DATAFILE '/home/db2/datatransform_data005.dbf'SIZE 1024M AUTOEXTEND ON NEXT 500M MAXSIZE UNLIMITED;
ALTER TABLESPACE datatransform_data ADD DATAFILE '/home/db2/datatransform_data006.dbf'SIZE 1024M AUTOEXTEND ON NEXT 500M MAXSIZE UNLIMITED;
ALTER TABLESPACE datatransform_data ADD DATAFILE '/home/db2/datatransform_data007.dbf'SIZE 1024M AUTOEXTEND ON NEXT 500M MAXSIZE UNLIMITED;
ALTER TABLESPACE datatransform_data ADD DATAFILE '/home/db2/datatransform_data008.dbf'SIZE 1024M AUTOEXTEND ON NEXT 500M MAXSIZE UNLIMITED;
ALTER TABLESPACE datatransform_data ADD DATAFILE '/home/db2/datatransform_data009.dbf'SIZE 1024M AUTOEXTEND ON NEXT 500M MAXSIZE UNLIMITED;
ALTER TABLESPACE datatransform_data ADD DATAFILE '/home/db2/datatransform_data010.dbf'SIZE 1024M AUTOEXTEND ON NEXT 500M MAXSIZE UNLIMITED;

-- 5 ��������������
-- ���� datatransform

-- Create database link 
drop public database link DBLINK_172_16_3_5;

create public database link DBLINK_172_16_3_5
  connect to datatransform identified by dbdatatransform
  using '(DESCRIPTION =
          (ADDRESS_LIST =
            (ADDRESS = (PROTOCOL = TCP)(HOST = 172.16.3.5)(PORT = 1521))
          )
          (CONNECT_DATA =
            (SERVER = DEDICATED)
            (SERVICE_NAME = orcl)
          )
        )';


        
--  5.2 ���� ����
select * from user_tables@DBLINK_172_16_3_5 t;

-- 6 �鿴 ��ռ��С
Select a.Tablespace_Name, Total, Free, Total - Free Used
  From ���� (Select Tablespace_Name, Sum(Bytes) / 1024 / 1024 Total
             From Dba_Data_Files ����group By Tablespace_Name) a,
       ���� (Select Tablespace_Name, Sum(Bytes) / 1024 / 1024 Free
             From Dba_Free_Space ����group By Tablespace_Name) b ����where a.Tablespace_Name = b.Tablespace_Name;
