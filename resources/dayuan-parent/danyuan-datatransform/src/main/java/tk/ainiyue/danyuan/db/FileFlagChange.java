package tk.ainiyue.danyuan.db;

import java.util.List;

import org.danyuan.utils.dao.impl.HibernateDaoImpl;

import tk.ainiyue.danyuan.Constant;
import tk.ainiyue.danyuan.po.SysFilesInfo;
import tk.ainiyue.danyuan.search.ReadFileList;

/**
 * 文件名 ： FileFlagChange.java
 * 包 名 ： tk.ainiyue.danyuan.db
 * 描 述 ： 改变文件状态
 * 机能名称：
 * 技能ID ：
 * 作 者 ： Administrator
 * 时 间 ： 2016年7月7日 上午9:47:03
 * 版 本 ： V1.0
 */
public class FileFlagChange extends HibernateDaoImpl<SysFilesInfo> {
	
	/**
	 * 方法名： changeFlag
	 * 功 能： 修改文件的状态
	 * 参 数： @param sysFilesInfo
	 * 返 回： void
	 * 作 者 ： Administrator
	 * @throws
	 */
	public void changeFlag(SysFilesInfo sysFilesInfo) {
		HibernateDaoImpl<SysFilesInfo> dao = new HibernateDaoImpl<SysFilesInfo>();
		dao.saveOrUpdate(sysFilesInfo, Constant._HIBERNATE_ORCL);
	};
	
	/**
	 * 方法名： deleteByPath
	 * 功 能： 通过路径 执行 删除
	 * 参 数： @param hql
	 * 返 回： void
	 * 作 者 ： Administrator
	 * @throws
	 */
	public void deleteByPath(String hql) {
		HibernateDaoImpl<SysFilesInfo> dao = new HibernateDaoImpl<SysFilesInfo>();
		dao.delete(hql, Constant._HIBERNATE_ORCL);
	}
	
	/**
	 * 方法名： findFile
	 * 功 能： 找到 数据库 中的 存在 文件
	 * 参 数： @param str
	 * 参 数： @return
	 * 返 回： boolean
	 * 作 者 ： Administrator
	 * @throws
	 */
	public boolean findFile(String str) {
		// 写入数据库
		ReadFileList dao = new ReadFileList();
		// hql 语句
		String hql = "From SysFilesInfo  t where t.filePath='" + str + "'";
		// 获取数据
		List<SysFilesInfo> info = dao.getObject(hql, Constant._HIBERNATE_ORCL, null);
		// 返回值 默认 为真
		boolean flag = true;
		// 如果 有数据 就返回 假
		if (info.size() > 0) {
			flag = false;
		}
		return flag;
	}
	
	/**
	 * 方法名： readFileByDirFromDB
	 * 功 能： 读取文件从数据库中
	 * 参 数： @return
	 * 返 回： List<String>
	 * 作 者 ： Administrator
	 * @throws
	 */
	public List<String> readFileByDirFromDB() {
		HibernateDaoImpl<String> dao = new HibernateDaoImpl<String>();
		String hql = "Select filePath From SysFilesInfo  where isDir='1' and rownum<11 ";
		return dao.getObject(hql, Constant._HIBERNATE_ORCL, null);
	}
}
