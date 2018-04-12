select
        sysfilesin0_.file_name as file_nam7_0_,
        sysfilesin0_.file_path as file_pat8_0_,
        sysfilesin0_.error_message as error_me5_0_,
        sysfilesin0_.start_timestimp as start_t15_0_,
        sysfilesin0_.to_database_table_name as to_data16_0_,
        sysfilesin0_.type as type17_0_ ,
        sysfilesin0_.uuid as uuid1_0_,
        sysfilesin0_.byttery as byttery2_0_,
        sysfilesin0_.database_id as database3_0_,
        sysfilesin0_.end_eimestimp as end_eime4_0_,
        sysfilesin0_.excel_sheet_name as excel_sh6_0_,
        sysfilesin0_.flag as flag9_0_,
        sysfilesin0_.inser_num as inser_n10_0_,
        sysfilesin0_.is_dir as is_dir11_0_,
        sysfilesin0_.optionally as optiona12_0_,
        sysfilesin0_.row_count as row_cou13_0_,
        sysfilesin0_.separator as separat14_0_        
    from
        sys_files_info sysfilesin0_ 
    where
        (
            sysfilesin0_.flag='0' 
            or sysfilesin0_.flag is null
        ) 
        and (
            sysfilesin0_.type in (
                '#search' , 'txt' , 'xlsx', 'xls'  , 'csv' , 'mdb' , 'rar' , 'zip' , 'dbf' , 'doc' , 'sql' , 'lnk' , 'jpg' , 'bmp' , 'jpeg' , 'htm' , 'png' , ''
            )
        ) 
       and rownum<10
      --  and sysfilesin0_.inser_num >0
    order by
        sysfilesin0_.byttery;
        
        
        
        
        select
        sysfilesin0_.*,
        sysfilesin0_.rowid
    from
        sys_files_info sysfilesin0_ 
    where
        (
            sysfilesin0_.flag='0' 
            or sysfilesin0_.flag is null
        ) 
        and (
            sysfilesin0_.type in (
                '#search' , 'txt' , 'xlsx' , 'xls' 
                --, 'csv' , 'mdb' , 'rar' , 'zip' , 'dbf' , 'doc' , 'sql' , 'lnk' , 'jpg' , 'bmp' , 'jpeg' , 'htm' , 'png' , ''
            )
        ) 
       -- and sysfilesin0_.file_path = 'E:\数据文件\硬盘名_G_新加卷\其他\企业名录\省市名录\内蒙古\2009年最新新开发内蒙古自治区包头市厂商名录数据库1021条(更多数据请联系QQ-872291209).xls';
        
        
        
        
        update sys_files_info t
        set t.to_database_table_name= ''
        where t.flag='-2'
        and t.to_database_table_name is not null;
        commit;
        
        
        
        
        
      ---  388323   0  
        select count（1）
    from
        sys_files_info sysfilesin0_ 
    where
        (
            sysfilesin0_.flag='-3' 
            or sysfilesin0_.flag is null
        ) 
        and (
            sysfilesin0_.type in (
                '#search' , 'txt' , 'xlsx' , 'xls' , 'csv' , 'mdb' , 'rar' , 'zip' , 'dbf' , 'doc' , 'sql' , 'lnk' , 'jpg' , 'bmp' , 'jpeg' , 'htm' , 'png' , ''
            )
        ) 
        AND sysfilesin0_.flag='-3' 
        
        
        
