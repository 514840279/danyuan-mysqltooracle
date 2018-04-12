package tk.ainiyue.danyuan.controller;

import java.util.List;

import org.danyuan.utils.dao.impl.HibernateDaoImpl;
import org.danyuan.utils.files.TxtFilesReader;

import tk.ainiyue.danyuan.Constant;
import tk.ainiyue.danyuan.file.FileController;
import tk.ainiyue.danyuan.po.SysFilesInfo;
import tk.ainiyue.danyuan.search.ReadFileList;

/**
 * 文件名 ： Centroller.java
 * 包 名 ： tk.ainiyue.danyuan.controller
 * 描 述 ： TODO(用一句话描述该文件做什么)
 * 机能名称：
 * 技能ID ：
 * 作 者 ： Administrator
 * 时 间 ： 2016年7月6日 上午10:58:16
 * 版 本 ： V1.0
 */
public class Centroller extends HibernateDaoImpl<SysFilesInfo> {
	
	/**
	 * 方法名： run
	 * 功 能： 运行
	 * 参 数：
	 * 返 回： void
	 * 作 者 ： Administrator
	 * @throws
	 */
	public static void run() {
		// 配置文件的路径
		String path = System.getProperty("user.dir") + Constant._CONTROLL_NAME;
		// 配置文件内的文件路径列表
		List<String> strlist = TxtFilesReader.readFileByLines(path);
		if (strlist.contains("search")) {
			// 查找文件信息
			ReadFileList read = new ReadFileList();
			// 执行 查找 文件 信息
			read.runsearch();
		}
		Centroller cc = new Centroller();
		FileController co = new FileController();
		// 不断去执行取信息
		while (true) {
			// 获取数据库中没有做处理的数据 每次取10条执行
			List<SysFilesInfo> list = cc.findTypefromDB(strlist);
			// 遍历文件信息
			for (SysFilesInfo sysFilesInfo : list) {
				// 处理文件
				co.runController(sysFilesInfo);
			}
			list = null;
			System.gc();
		}
	}
	
	/**
	 * 方法名： findTypefromDB
	 * 功 能： TODO(这里用一句话描述这个方法的作用)
	 * 参 数： @param strlist
	 * 参 数： @return
	 * 返 回： List<SysFilesInfo>
	 * 作 者 ： Administrator
	 * @throws
	 */
	public List<SysFilesInfo> findTypefromDB(List<String> strlist) {
		Centroller cc = new Centroller();
		// hql 语句
		String hql = "From SysFilesInfo where (flag = '0' or flag is null) and  lower(type) in ('";
		// 只要取配置的文件类型
		for (String string : strlist) {
			hql += string + "','";
		}
		// 取前10条信息
		hql += "') and rownum< 50";
		// 以文件大小排序
		hql += "   order by byttery  ";
		// 返回 文件信息
		return cc.getObject(hql, Constant._HIBERNATE_ORCL, null);
		
	}
	
}
