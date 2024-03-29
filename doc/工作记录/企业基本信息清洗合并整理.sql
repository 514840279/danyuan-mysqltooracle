-- 企业基本信息整理清洗
/*
shxg_qyxg_公司基本信息
shxg_qyxg_公司基本信息_8g
shxg_qyxg_公司基本信息_西岗
shxg_qyxg_公司基本信息_qyfl
shxg_qyxg_公司基本信息_大连1
shxg_qyxg_公司基本信息_辽宁
shxg_qyxg_公司基本信息_西岗
*/

-- 去掉没有用的数据
--drop table   
--drop table  shxg_qyxg_公司基本信息_qyfl;
--drop table  shxg_qyxg_公司基本信息_大连1;
--drop table  shxg_qyxg_公司基本信息_辽宁;
--drop table  shxg_qyxg_公司基本信息_西岗;
--drop table  shxg_qyxg_xyxg_公司基本信息_sz;

-- NO1 合并数据库 生成历史数据
create table  shxg_qyxg_cropBase_unionall
as
select 注册号,       组织机构代码,       公司名称,       企业类型,       国别或地区,       行政区划,       邮政编码,       所属地区,       详细地址,
       所属行业,       经营范围,       经营面积,       成立日期,       注册类型,       注册资金,       注册日期,       企业登记状态,       进出口代码,
       国税号,       地税号,       公积金号,       检疫登记号,       网址,       联系电话,       分机号,       传真,       员工数,       法人代表,       法人电话,
       其他信息,       更新时间,       采集时间,       数据来源,       入库时间,       文件名,       手机,       电子邮箱,       负责人,       公司简称,
       登记机关,       证券简称,       公司英文名,       曾用名,       证券简称变更历史,       注册地址,       公司简介,       经营模式,       主要产品,
       职务,       营业期限至,       营业期限自,       核准时间,       组成形式
  from shxg_qyxg_公司基本信息
union all
select 注册号,       组织机构代码,       公司名称,       企业类型,       国别或地区,       行政区划,       邮政编码,       所属地区,       详细地址,
       所属行业,       经营范围,       经营面积,       成立日期,       注册类型,       注册资金,       注册日期,       企业登记状态,       进出口代码,
       国税号,       地税号,       公积金号,       检疫登记号,       网址,       联系电话,       分机号,       传真,       员工数,       法人代表,       法人电话,
       其他信息,       更新时间,       采集时间,       数据来源,       入库时间,       文件名,       手机,       电子邮箱,       负责人,       公司简称,
       登记机关,       证券简称,       公司英文名,       曾用名,       证券简称变更历史,       注册地址,       公司简介,       经营模式,       主要产品,
       职务,       营业期限至,       营业期限自,       核准时间,       组成形式
  from shxg_qyxg_公司基本信息_8g
;



-- NO。2 筛选出我想要的信息

--  1 cropBase_union_full_name

create table cropBase_unionall_temp as
select trim(注册号) as 注册号,         trim(组织机构代码) as 组织机构代码,        trim(公司名称) as 公司名称,        trim(企业类型) as 企业类型,       
       trim(行政区划) as 行政区划,     trim(邮政编码) as 邮政编码,                trim(所属地区) as 所属地区,        trim(详细地址) as 详细地址,      
       trim(所属行业) as 所属行业,     trim(经营范围) as 经营范围,                trim(经营面积) as 经营面积,        trim(成立日期) as 成立日期,       
       trim(注册资金) as 注册资金,     trim(注册日期) as 注册日期,                trim(企业登记状态) as 企业登记状态,trim(进出口代码) as 进出口代码,    
       trim(国别或地区) as 国别或地区, trim(联系电话) as 联系电话,                trim(手机) as 手机,                trim(采集时间) as 采集时间, 
       trim(国税号) as 国税号,         trim(地税号) as 地税号,                    trim(公积金号) as 公积金号,        trim(检疫登记号) as 检疫登记号,               
       trim(分机号) as 分机号,         trim(传真) as 传真,                        trim(员工数) as 员工数,            trim(法人代表) as 法人代表,       
       trim(其他信息) as 其他信息,     trim(更新时间) as 更新时间,                trim(文件名) as 文件名,            trim(数据来源) as 数据来源,                
       trim(电子邮箱) as 电子邮箱,     trim(负责人) as 负责人,                    trim(公司简称) as 公司简称,        trim(登记机关) as 登记机关,              
       trim(曾用名) as 曾用名,         trim(证券简称变更历史) as 证券简称变更历史,trim(注册地址) as 注册地址,        trim(公司简介) as 公司简介,        
       trim(职务) as 职务,             trim(营业期限至) as 营业期限至,            trim(营业期限自) as 营业期限自,    trim(核准时间) as 核准时间,  
       trim(法人电话) as 法人电话,     trim(网址) as网址,                         trim(入库时间) as 入库时间,        trim(证券简称) as 证券简称,  
       trim(经营模式) as 经营模式,     trim(注册类型) as 注册类型,                trim(公司英文名) as 公司英文名,    trim(主要产品) as 主要产品,
       trim(组成形式)  as 组成形式
from shxg_qyxg_cropBase_unionall  t
where  t.公司名称 is not null;

-- 2 去重  
-- I  1 直接拿出不重复的数据到最终表中
/*
create table cropBase_union_full_name 
as
select * from cropBase_unionall_temp
where 公司名称 in(
  select 公司名称 from cropBase_unionall_temp
  group by 公司名称
  having count(1)<2
)
;

--    2 去掉临时表中的单条记录
delete from cropBase_unionall_temp
where 公司名称 in(
  select 公司名称 from cropBase_unionall_temp
  group by 公司名称
  having count(1)<2
)
;*/
-- II  多条记录的处理
--   1 拿到不重复的企业名 、注册号
create table cropBase_union_full_name 
as
select  注册号,  组织机构代码,公司名称,  企业类型,  国别或地区,      行政区划,  邮政编码, 所属地区,    详细地址,
       所属行业,经营范围,    经营面积,  成立日期,  注册类型,        注册资金,  注册日期, 企业登记状态,进出口代码,
       国税号,  地税号,      公积金号,  检疫登记号,网址,            联系电话,  分机号,   传真,        员工数,            
       其他信息,更新时间,    采集时间,  数据来源,  入库时间,        文件名,    手机,     电子邮箱,    负责人,       
       登记机关,证券简称,    公司英文名,曾用名,    证券简称变更历史,注册地址,  公司简介, 经营模式,    主要产品,
       法人代表,公司简称,    法人电话,  职务,      营业期限至,      营业期限自,核准时间, 组成形式 
from(
  select 注册号,  组织机构代码,公司名称,  企业类型,  国别或地区,      行政区划,  邮政编码, 所属地区,    详细地址,
       所属行业,经营范围,    经营面积,  成立日期,  注册类型,        注册资金,  注册日期, 企业登记状态,进出口代码,
       国税号,  地税号,      公积金号,  检疫登记号,网址,            联系电话,  分机号,   传真,        员工数,            
       其他信息,更新时间,    采集时间,  数据来源,  入库时间,        文件名,    手机,     电子邮箱,    负责人,       
       登记机关,证券简称,    公司英文名,曾用名,    证券简称变更历史,注册地址,  公司简介, 经营模式,    主要产品,
       法人代表,公司简称,    法人电话,  职务,      营业期限至,      营业期限自,核准时间, 组成形式 ,row_number() over (partition by 公司名称 order by i desc) ord 
   from (
    select  注册号,  组织机构代码,公司名称,  企业类型,  国别或地区,      行政区划,  邮政编码, 所属地区,    详细地址,
           所属行业,经营范围,    经营面积,  成立日期,  注册类型,        注册资金,  注册日期, 企业登记状态,进出口代码,
           国税号,  地税号,      公积金号,  检疫登记号,网址,            联系电话,  分机号,   传真,        员工数,            
           其他信息,更新时间,    采集时间,  数据来源,  入库时间,        文件名,    手机,     电子邮箱,    负责人,       
           登记机关,证券简称,    公司英文名,曾用名,    证券简称变更历史,注册地址,  公司简介, 经营模式,    主要产品,
           法人代表,公司简称,    法人电话,  职务,      营业期限至,      营业期限自,核准时间, 组成形式,
          (
          a1+a2+a3+a4+a5+a6+a7+a8+a9+
          b1+b2+b3+b4+b5+b6+b7+b8+b9+
          c1+c2+c3+c4+c5+c6+c7+c8+c9+
          d1+d2+d3+d4+d5+d6+d7+d8+d9+
          e1+e2+e3+e4+e5+e6+e7+e8+e9+
          f1+f2+f3+f4+f5+f6+f7+f8
          ) i 
    from (
      select  注册号,  组织机构代码,公司名称,  企业类型,  国别或地区,      行政区划,  邮政编码, 所属地区,    详细地址,
             所属行业,经营范围,    经营面积,  成立日期,  注册类型,        注册资金,  注册日期, 企业登记状态,进出口代码,
             国税号,  地税号,      公积金号,  检疫登记号,as网址 as 网址,            联系电话,  分机号,   传真,        员工数,            
             其他信息,更新时间,    采集时间,  数据来源,  入库时间,        文件名,    手机,     电子邮箱,    负责人,       
             登记机关,证券简称,    公司英文名,曾用名,    证券简称变更历史,注册地址,  公司简介, 经营模式,    主要产品,
             法人代表,公司简称,    法人电话,  职务,      营业期限至,      营业期限自,核准时间, 组成形式
            --,注册号,  组织机构代码,公司名称,  企业类型,  国别或地区,      行政区划,  邮政编码, 所属地区,    详细地址,
            ,nvl2(注册号,1,0) a1,nvl2(组织机构代码,1,0) a2,nvl2(公司名称,1,0) a3
            ,nvl2(企业类型,1,0) a4,nvl2(国别或地区,1,0) a5,nvl2(行政区划,1,0) a6
            ,nvl2(邮政编码,1,0) a7,nvl2(所属地区,1,0) a8,nvl2(详细地址,1,0) a9
            --  所属行业,经营范围,    经营面积,  成立日期,  注册类型,        注册资金,  注册日期, 企业登记状态,进出口代码,
            ,nvl2(所属行业,1,0) b1,nvl2(经营范围,1,0) b2,nvl2(经营面积,1,0) b3
            ,nvl2(成立日期,1,0) b4,nvl2(注册类型,1,0) b5,nvl2(注册资金,1,0) b6
            ,nvl2(注册日期,1,0) b7,nvl2(企业登记状态,1,0) b8,nvl2(进出口代码,1,0) b9
            -- 国税号,  地税号,      公积金号,  检疫登记号,网址,            联系电话,  分机号,   传真,        员工数,     
            ,nvl2(国税号,1,0) c1,nvl2(地税号,1,0) c2,nvl2(公积金号,1,0) c3
            ,nvl2(检疫登记号,1,0) c4,nvl2(as网址,1,0) c5,nvl2(联系电话,1,0) c6
            ,nvl2(分机号,1,0) c7,nvl2(传真,1,0) c8,nvl2(员工数,1,0) c9
            -- 其他信息,更新时间,    采集时间,  数据来源,  入库时间,        文件名,    手机,     电子邮箱,    负责人,     
            ,nvl2(其他信息,1,0) d1,nvl2(更新时间,1,0) d2,nvl2(采集时间,1,0) d3
            ,nvl2(数据来源,1,0) d4,nvl2(入库时间,1,0) d5,nvl2(文件名,1,0) d6
            ,nvl2(手机,1,0) d7,nvl2(电子邮箱,1,0) d8,nvl2(负责人,1,0) d9
            --  登记机关,证券简称,    公司英文名,曾用名,    证券简称变更历史,注册地址,  公司简介, 经营模式,    主要产品,
            ,nvl2(登记机关,1,0) e1,nvl2(证券简称,1,0) e2,nvl2(公司英文名,1,0) e3
            ,nvl2(曾用名,1,0) e4,nvl2(证券简称变更历史,1,0) e5,nvl2(注册地址,1,0) e6
            ,nvl2(公司简介,1,0) e7,nvl2(经营模式,1,0) e8,nvl2(主要产品,1,0) e9
            -- 法人代表,公司简称,    法人电话,  职务,      营业期限至,      营业期限自,核准时间, 组成形式
            ,nvl2(法人代表,1,0) f1,nvl2(公司简称,1,0) f2,nvl2(法人电话,1,0) f3
            ,nvl2(职务,1,0) f4,nvl2(营业期限至,1,0) f5,nvl2(营业期限自,1,0) f6
            ,nvl2(核准时间,1,0) f7,nvl2(组成形式,1,0) f8

       from zhcx.cropBase_unionall_temp
      ) v
    )
  )
where ord=1
;
--   2  drop
--drop table cropBase_unionall_temp;


-- III 整理
--   1 注册号整理 信用代码和注册号
alter table cropBase_union_full_name add 统一社会信用代码 varchar2(20);
update cropBase_union_full_name
set 统一社会信用代码 = 注册号,
注册号 = ''
where lengthb(注册号) = 18
and 注册号 not like '%-%'
and 注册号 not like '%(%'
--lengthb(注册号) = length(注册号)
;
commit;
 
update cropBase_union_full_name
set 注册号 = 统一社会信用代码
, 统一社会信用代码 = ''
where lengthb(统一社会信用代码) <> length(统一社会信用代码)
and 统一社会信用代码 is not null;
commit;

--   2 文件名 入库时间
 alter table cropBase_union_full_name drop column 文件名;  
 alter table cropBase_union_full_name drop column 入库时间;  
 
--  3  公司名称清洗
--  删掉数字
update cropBase_union_full_name
set 公司名称 = to_single_byte(公司名称)
;
commit;


delete from cropBase_union_full_name
where length(公司名称) = lengthb(公司名称);
commit;

delete from cropBase_union_full_name
where 公司名称 like '____年__月__日';
commit;
--
 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'?',''))
where 公司名称 like '%?%';
commit;


-- 该表更新时间




 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'',''))
where 公司名称 like '%%';
commit;

 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'
',''))
where 公司名称 like '%
%';
commit;

 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'',''))
where 公司名称 like '%%';
commit;

 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'',''))
where 公司名称 like '%%';
commit;


 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'',''))
where 公司名称 like '%%';
commit;


 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'!',''))
where 公司名称 like '%!%';
commit;

 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'"',''))
where 公司名称 like '%"%';
commit;

--
 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,')',''))
where 公司名称 like ')%';
commit;

 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'.',''))
where 公司名称 like '%.%';
commit;

 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'*',''))
where 公司名称 like '%*%';
commit;


 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'+',''))
where 公司名称 like '+%';
commit;


 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,',',''))
where 公司名称 like ',%';
commit;

 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'-',''))
where 公司名称 like '-%';
commit;

 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'/',''))
where 公司名称 like '/%';
commit;


 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'=',''))
where 公司名称 like '=%';
commit;

 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'>',''))
where 公司名称 like '>%';
commit;


 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,' ',''))
where 公司名称 like ' %';
commit;

 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'’',''))
where 公司名称 like '’%';
commit;
 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'‖',''))
where 公司名称 like '‖%';
commit;
 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'·',''))
where 公司名称 like '·%';
commit;
 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'。',''))
where 公司名称 like '。%';
commit;
 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'。',''))
where 公司名称 like '。%';
commit;
 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'|',''))
where 公司名称 like '|%';
commit;
 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'nbsp;',''))
where 公司名称 like 'nbsp;%';
commit;

 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'~',''))
where 公司名称 like '~%';
commit;

 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'#',''))
where 公司名称 like '#%';
commit;
 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'`',''))
where 公司名称 like '`%';
commit;
 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'_',''))
where 公司名称 like '_%';
commit;
 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'^',''))
where 公司名称 like '^%';
commit;
 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,']',''))
where 公司名称 like ']%';
commit;
 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'\',''))
where 公司名称 like '\%';
commit;
 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'>',''))
where 公司名称 like '>%';
commit;
 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'?',''))
where 公司名称 like '?%';
commit;
 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'@',''))
where 公司名称 like '@%';
commit;
 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,';',''))
where 公司名称 like ';%';
commit;
 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'&',''))
where 公司名称 like '&%';
commit;
 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'''',''))
where 公司名称 like '''%';
commit;
-- 全角空格
 update cropBase_union_full_name
set 公司名称 = trim(replace(公司名称,'　',''))
where 公司名称 like '%　%';
commit;

--
select * from cropBase_union_full_name
where length(公司名称) = lengthb(公司名称)


--  *** 删掉 空的
delete from cropBase_union_full_name
where length(公司名称) = lengthb(公司名称);
commit;

delete from cropBase_union_full_name t
where length(t.公司名称)<4
;
commit;
-- 从新去重生成表
select t.公司名称 from cropBase_union_full_name t
group by t.公司名称
having count(1)>1



-- alter 
rename cropBase_union_full_name to cropBase_unionall_temp1;


create table cropBase_union_full_name 
as
select  注册号,  组织机构代码,公司名称,  企业类型,  国别或地区,      行政区划,  邮政编码, 所属地区,    详细地址,
       所属行业,经营范围,    经营面积,  成立日期,  注册类型,        注册资金,  注册日期, 企业登记状态,进出口代码,
       国税号,  地税号,      公积金号,  检疫登记号,网址,            联系电话,  分机号,   传真,        员工数,            
       其他信息,更新时间,    采集时间,  数据来源, /* 入库时间,        文件名,*/    手机,     电子邮箱,    负责人,       
       登记机关,证券简称,    公司英文名,曾用名,    证券简称变更历史,注册地址,  公司简介, 经营模式,    主要产品,
       法人代表,公司简称,    法人电话,  职务,      营业期限至,      营业期限自,核准时间, 组成形式 ,统一社会信用代码
from(
  select 注册号,  组织机构代码,公司名称,  企业类型,  国别或地区,      行政区划,  邮政编码, 所属地区,    详细地址,
       所属行业,经营范围,    经营面积,  成立日期,  注册类型,        注册资金,  注册日期, 企业登记状态,进出口代码,
       国税号,  地税号,      公积金号,  检疫登记号,网址,            联系电话,  分机号,   传真,        员工数,            
       其他信息,更新时间,    采集时间,  数据来源,  /*入库时间,        文件名,  */  手机,     电子邮箱,    负责人,       
       登记机关,证券简称,    公司英文名,曾用名,    证券简称变更历史,注册地址,  公司简介, 经营模式,    主要产品,
       法人代表,公司简称,    法人电话,  职务,      营业期限至,      营业期限自,核准时间, 组成形式,统一社会信用代码
        ,row_number() over (partition by 公司名称 order by i desc) ord 
   from (
    select  注册号,  组织机构代码,公司名称,  企业类型,  国别或地区,      行政区划,  邮政编码, 所属地区,    详细地址,
           所属行业,经营范围,    经营面积,  成立日期,  注册类型,        注册资金,  注册日期, 企业登记状态,进出口代码,
           国税号,  地税号,      公积金号,  检疫登记号,网址,            联系电话,  分机号,   传真,        员工数,            
           其他信息,更新时间,    采集时间,  数据来源, /* 入库时间,        文件名,*/    手机,     电子邮箱,    负责人,       
           登记机关,证券简称,    公司英文名,曾用名,    证券简称变更历史,注册地址,  公司简介, 经营模式,    主要产品,
           法人代表,公司简称,    法人电话,  职务,      营业期限至,      营业期限自,核准时间, 组成形式,统一社会信用代码,
          (
          a1+a2+a3+a4+a5+a6+a7+a8+a9+
          b1+b2+b3+b4+b5+b6+b7+b8+b9+
          c1+c2+c3+c4+c5+c6+c7+c8+c9+
          d1+d2+d3+d4+ d7+d8+d9+
          e1+e2+e3+e4+e5+e6+e7+e8+e9+
          f1+f2+f3+f4+f5+f6+f7+f8+f9
          ) i 
    from (
      select  注册号,  组织机构代码,trim(公司名称) as 公司名称 ,  企业类型,  国别或地区,      行政区划,  邮政编码, 所属地区,    详细地址,
             所属行业,经营范围,    经营面积,  成立日期,  注册类型,        注册资金,  注册日期, 企业登记状态,进出口代码,
             国税号,  地税号,      公积金号,  检疫登记号,网址 as 网址,            联系电话,  分机号,   传真,        员工数,            
             其他信息,更新时间,    采集时间,  数据来源,  /*入库时间,        文件名,*/    手机,     电子邮箱,    负责人,       
             登记机关,证券简称,    公司英文名,曾用名,    证券简称变更历史,注册地址,  公司简介, 经营模式,    主要产品,
             法人代表,公司简称,    法人电话,  职务,      营业期限至,      营业期限自,核准时间, 组成形式,统一社会信用代码
            --,注册号,  组织机构代码,公司名称,  企业类型,  国别或地区,      行政区划,  邮政编码, 所属地区,    详细地址,
            ,nvl2(注册号,1,0) a1,nvl2(组织机构代码,1,0) a2,nvl2(公司名称,1,0) a3
            ,nvl2(企业类型,1,0) a4,nvl2(国别或地区,1,0) a5,nvl2(行政区划,1,0) a6
            ,nvl2(邮政编码,1,0) a7,nvl2(所属地区,1,0) a8,nvl2(详细地址,1,0) a9
            --  所属行业,经营范围,    经营面积,  成立日期,  注册类型,        注册资金,  注册日期, 企业登记状态,进出口代码,
            ,nvl2(所属行业,1,0) b1,nvl2(经营范围,1,0) b2,nvl2(经营面积,1,0) b3
            ,nvl2(成立日期,1,0) b4,nvl2(注册类型,1,0) b5,nvl2(注册资金,1,0) b6
            ,nvl2(注册日期,1,0) b7,nvl2(企业登记状态,1,0) b8,nvl2(进出口代码,1,0) b9
            -- 国税号,  地税号,      公积金号,  检疫登记号,网址,            联系电话,  分机号,   传真,        员工数,     
            ,nvl2(国税号,1,0) c1,nvl2(地税号,1,0) c2,nvl2(公积金号,1,0) c3
            ,nvl2(检疫登记号,1,0) c4,nvl2(网址,1,0) c5,nvl2(联系电话,1,0) c6
            ,nvl2(分机号,1,0) c7,nvl2(传真,1,0) c8,nvl2(员工数,1,0) c9
            -- 其他信息,更新时间,    采集时间,  数据来源,  入库时间,        文件名,    手机,     电子邮箱,    负责人,     
            ,nvl2(其他信息,1,0) d1,nvl2(更新时间,1,0) d2,nvl2(采集时间,1,0) d3
            ,nvl2(数据来源,1,0) d4 /* ,nvl2(入库时间,1,0) d5,nvl2(文件名,1,0) d6 */
            ,nvl2(手机,1,0) d7,nvl2(电子邮箱,1,0) d8,nvl2(负责人,1,0) d9
            --  登记机关,证券简称,    公司英文名,曾用名,    证券简称变更历史,注册地址,  公司简介, 经营模式,    主要产品,
            ,nvl2(登记机关,1,0) e1,nvl2(证券简称,1,0) e2,nvl2(公司英文名,1,0) e3
            ,nvl2(曾用名,1,0) e4,nvl2(证券简称变更历史,1,0) e5,nvl2(注册地址,1,0) e6
            ,nvl2(公司简介,1,0) e7,nvl2(经营模式,1,0) e8,nvl2(主要产品,1,0) e9
            -- 法人代表,公司简称,    法人电话,  职务,      营业期限至,      营业期限自,核准时间, 组成形式
            ,nvl2(法人代表,1,0) f1,nvl2(公司简称,1,0) f2,nvl2(法人电话,1,0) f3
            ,nvl2(职务,1,0) f4,nvl2(营业期限至,1,0) f5,nvl2(营业期限自,1,0) f6
            ,nvl2(核准时间,1,0) f7,nvl2(组成形式,1,0) f8,nvl2(统一社会信用代码,1,0) f9

       from zhcx.cropBase_unionall_temp1
      ) v
    )
  )
where ord=1
;

-- 
drop table cropBase_unionall_temp1
;



-- 配置系统表

--  备份数据库  
--  删掉 数据表
/*
shxg_qyxg_公司基本信息
shxg_qyxg_公司基本信息_8g
*/
 
