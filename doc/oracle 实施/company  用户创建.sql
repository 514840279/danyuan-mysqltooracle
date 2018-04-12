-- 1.�����û�
create user company identified by company;

-- 2 ��Ȩ ����������ӣ�dba
grant resource ,connect ,dba to company;

-- 3.1 �鿴��ռ��λ��
SELECT tablespace_name, 
file_id, 
file_name, 
round(bytes / (1024 * 1024), 0) total_space 
FROM dba_data_files 
ORDER BY tablespace_name; 

-- 3.2 ������ռ� wth_data
create tablespace company_data 
logging 
datafile 'E:\DATABASE\ORCL18\company_data001.dbf' 
size 1024m 
autoextend on 
next 500m maxsize 20480m 
extent management local; 

-- 3.3 ������ռ� wth_index
create tablespace company_index
logging 
datafile 'E:\DATABASE\ORCL18\company_index002.dbf' 
size 1024m 
autoextend on 
next 500m maxsize 20480m 
extent management local; 


--3.4 �޸��û���ռ�Ȩ��
alter user company quota unlimited on company_data;
alter user company quota unlimited on company_index;
alter user company  default tablespace company_data;


--alter tablespace datatransform_index drop datafile 'E:\DATABASE\ORCL18\company_index001.dbf';

-- 4�޸ı�ռ��С����ӱ�ռ���ļ�
ALTER TABLESPACE company_data ADD DATAFILE 'E:\DATABASE\ORCL18\company_data002.dbf'SIZE 1024M AUTOEXTEND ON NEXT 500M MAXSIZE UNLIMITED;
ALTER TABLESPACE company_data ADD DATAFILE 'E:\DATABASE\ORCL18\company_data003.dbf'SIZE 1024M AUTOEXTEND ON NEXT 500M MAXSIZE UNLIMITED;
ALTER TABLESPACE company_data ADD DATAFILE 'E:\DATABASE\ORCL18\company_data004.dbf'SIZE 1024M AUTOEXTEND ON NEXT 500M MAXSIZE UNLIMITED;
ALTER TABLESPACE company_data ADD DATAFILE 'E:\DATABASE\ORCL18\company_data005.dbf'SIZE 1024M AUTOEXTEND ON NEXT 500M MAXSIZE UNLIMITED;
ALTER TABLESPACE company_data ADD DATAFILE 'E:\DATABASE\ORCL18\company_data006.dbf'SIZE 1024M AUTOEXTEND ON NEXT 500M MAXSIZE UNLIMITED;
ALTER TABLESPACE company_data ADD DATAFILE 'E:\DATABASE\ORCL18\company_data007.dbf'SIZE 1024M AUTOEXTEND ON NEXT 500M MAXSIZE UNLIMITED;
ALTER TABLESPACE company_data ADD DATAFILE 'E:\DATABASE\ORCL18\company_data008.dbf'SIZE 1024M AUTOEXTEND ON NEXT 500M MAXSIZE UNLIMITED;
ALTER TABLESPACE company_data ADD DATAFILE 'E:\DATABASE\ORCL18\company_data009.dbf'SIZE 1024M AUTOEXTEND ON NEXT 500M MAXSIZE UNLIMITED;
ALTER TABLESPACE company_data ADD DATAFILE 'E:\DATABASE\ORCL18\company_data010.dbf'SIZE 1024M AUTOEXTEND ON NEXT 500M MAXSIZE UNLIMITED;

-- 5 ��������������
-- ���� company

-- Create database link 
drop public database link DBLINK_172_16_3_18;

create public database link DBLINK_172_16_3_18
  connect to company identified by 2017oracle2017
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
select * from user_tables@DBLINK_172_16_3_18 t;

-- 6 �鿴 ��ռ��С
Select a.Tablespace_Name, Total, Free, Total - Free Used
  From ���� (Select Tablespace_Name, Sum(Bytes) / 1024 / 1024 Total
             From Dba_Data_Files ����group By Tablespace_Name) a,
       ���� (Select Tablespace_Name, Sum(Bytes) / 1024 / 1024 Free
             From Dba_Free_Space ����group By Tablespace_Name) b ����where a.Tablespace_Name = b.Tablespace_Name;
