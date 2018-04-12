package tk.ainiyue.admin.sysmenu.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import tk.ainiyue.admin.sysmenu.po.SysMenuInfo;

/**
 * 文件名 ： SysmenuDao.java
 * 包 名 ： tk.ainiyue.admin.sysmenu.dao
 * 描 述 ： TODO(用一句话描述该文件做什么)
 * 机能名称：
 * 技能ID ：
 * 作 者 ： wang
 * 时 间 ： 2016年6月11日 上午10:52:15
 * 版 本 ： V1.0
 */
@Repository("sysMenuDao")
public interface SysMenuDao extends CrudRepository<SysMenuInfo, String> {
    
}
