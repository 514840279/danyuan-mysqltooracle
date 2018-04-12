update sys_virtual_persion_base_info t
set t.birthday_year = func_birth_4(t.birthday)
where t.birthday_year is null
and t.birthday is not null;
commit;