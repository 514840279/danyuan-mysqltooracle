create or replace view sys.all_directories as
select u.name, o.name, d.os_path
from sys.user$ u, sys.obj$ o, sys.dir$ d
where u.user# = o.owner#
  and o.obj# = d.obj#
  and ( o.owner# =  userenv('SCHEMAID')
        or o.obj# in
           (select oa.obj#
            from sys.objauth$ oa
            where grantee# in (select kzsrorol
                               from x$kzsro
                              )
           )
        or exists (select null from v$enabledprivs
                   where priv_number in (-177, /* CREATE ANY DIRECTORY */
                                         -178  /* DROP ANY DIRECTORY */)
                  )
      );
