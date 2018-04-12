-- 1.创建用户
create user analysis identified by analysis;

-- 2 授权 表操作，连接，dba
grant resource ,connect ,dba to analysis;

-- 3.1 查看表空间的位置
SELECT tablespace_name, 
file_id, 
file_name, 
round(bytes / (1024 * 1024), 0) total_space 
FROM dba_data_files 
ORDER BY tablespace_name; 

-- 3.2 创建表空间 wth_data
create tablespace analysis_data 
logging 
datafile 'E:\DATABASE\ORACLE\ORCL\analysis_data001.DBF' 
size 1024m 
autoextend on 
next 500m maxsize 20480m 
extent management local; 

-- 3.3 创建表空间 wth_index
create tablespace analysis_index
logging 
datafile 'E:\DATABASE\ORACLE\ORCL\analysis_index001.DBF' 
size 1024m 
autoextend on 
next 500m maxsize 20480m 
extent management local; 


--3.4 修改用户表空间权限
alter user analysis quota unlimited on analysis_data;
alter user analysis quota unlimited on analysis_index;
alter user analysis  default tablespace analysis_data;

-- 4修改表空间大小，添加表空间的文件
--ALTER TABLESPACE wth_data ADD DATAFILE 'E:\DATABASE\ORACLE\ORCL\analysis_data002.DBF'SIZE 1024M AUTOEXTEND ON NEXT 500M MAXSIZE UNLIMITED;


-- 5 创建数据桥连接
-- 连接wth

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
        
--  5.2 测试 连接
select * from user_tables@DBLINK_172_16_3_17 t;
select * from user_tables@DBLINK_172_16_3_18 t;

-- 6 查看 表空间大小
Select a.Tablespace_Name, Total, Free, Total - Free Used
  From 　　 (Select Tablespace_Name, Sum(Bytes) / 1024 / 1024 Total
             From Dba_Data_Files 　　group By Tablespace_Name) a,
       　　 (Select Tablespace_Name, Sum(Bytes) / 1024 / 1024 Free
             From Dba_Free_Space 　　group By Tablespace_Name) b 　　where a.Tablespace_Name = b.Tablespace_Name;
             
             
