--  ��ҵ��¼
insert into company_2016822_union (UUID,
ʡ��,����,--��ҵ���ô���,ע���,
��˾����,
--��˾���,������,��˾Ӣ����,
���˴���,���֤��,���˵绰,��������,��������,ע������,��ַ����,��ַγ��,�칫��ַ,Ա����,
--QQ����,
--��������,
--��˾���,
--��˾��ַ,
--��Ӫ״��,��ҵ����,�Ǽǻ���,

--��Ҫ��Ʒ,ע���ַ,ע������,
--ע���ʽ�
��Ӫ��Χ
--��ҵ֤�����ӵ�ַ,ע��ʱ��,�ɼ�ʱ��,Ӫҵ������,Ӫҵ������

)
select replace(sys_guid(), '-', '') as uuid,PROVINCE ,CITY,COMPANY,
nvl(OWNER,CONTACT),nvl(OWNER_CTZID,CONTACT_PST),
--ADMINI_AREA,
nvl(MOBILE,PHONE),
--CITY_NO,FAX,
ZIP_NO,EMAIL,REGIST_DATE,ADDR_LAT,ADDR_LNG,ADDRESS_STD,STAFF,

BUSS_SCOPE
 from COMPANY_INFO_LARGE_DIS;
 
 
 drop table COMPANY_INFO_LARGE_DIS;
 
 
 
 
 
--  ��ҵ��¼
insert into company_2016822_union (UUID,
ʡ��,����,--��ҵ���ô���,ע���,
��˾����,
--��˾���,������,��˾Ӣ����,
���˴���,���֤��,���˵绰,��������,��������,ע������,��ַ����,��ַγ��,�칫��ַ,Ա����,
--QQ����,
--��������,
--��˾���,
--��˾��ַ,
--��Ӫ״��,��ҵ����,�Ǽǻ���,

--��Ҫ��Ʒ,ע���ַ,ע������,
--ע���ʽ�
��Ӫ��Χ
--��ҵ֤�����ӵ�ַ,ע��ʱ��,�ɼ�ʱ��,Ӫҵ������,Ӫҵ������

)
select replace(sys_guid(), '-', '') as uuid,PROVINCE ,CITY,COMPANY,
nvl(OWNER,CONTACT),nvl(OWNER_CTZID,CONTACT_PST),
--ADMINI_AREA,
nvl(MOBILE,PHONE),
--CITY_NO,FAX,
ZIP_NO,EMAIL,REGIST_DATE,ADDR_LAT,ADDR_LNG,ADDRESS_STD,STAFF,

BUSS_SCOPE
 from COMPANY_INFO_LITTLE_1;
 
 
 
 drop table COMPANY_INFO_LITTLE_1;
 
 
 
 
 
 -- 40323091
select count(1) from ��ҵ��¼_20160823 t
