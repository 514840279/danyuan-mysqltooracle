update sys_virtual_persion_base_info t
set t.data_source = '360百科'
where t.head_pic is not null
and t.head_pic like '%/pic_360/360_pic%';

commit;

update sys_virtual_persion_base_info t
set t.data_source = '智联招聘'
where t.head_pic is not null
and t.head_pic not like '%/pic_360/360_pic%';
commit;

update sys_virtual_persion_base_info t
set t.data_source = 'qq空间墙'
where t.head_pic is  null;
commit;