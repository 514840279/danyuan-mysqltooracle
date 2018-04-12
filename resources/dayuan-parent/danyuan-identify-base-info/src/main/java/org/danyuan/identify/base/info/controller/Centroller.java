package org.danyuan.identify.base.info.controller;

import java.sql.SQLException;
import java.util.List;

import org.danyuan.identify.base.info.dao.VVirtualSqlDao;
import org.danyuan.identify.base.info.po.SysVirtualPersionBaseInfo;
import org.danyuan.identify.base.info.po.VVirtualSql;

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
public class Centroller {
	
	/**
	 * @throws SQLException 
	 * 方法名： run
	 * 功 能： 运行
	 * 参 数：
	 * 返 回： void
	 * 作 者 ： Administrator
	 * @throws
	 */
	public static void run() throws SQLException {
		SysVirtualPersionBaseInfo base = null;
		// 读取配置表 取得记录
		List<VVirtualSql> list = VVirtualSqlDao.findVVirtualSql();
		// 循环判断取得的表的执行状态
		for (VVirtualSql vVirtualSql : list) {
			if ("0".equals(vVirtualSql.getDeleteFlag())) {
				// 未执行的进行合并qq好到临时表
				
				// 执行更新表状态 状态更新1
			}
			// 执行中查询一个qq
			// 更新状态
			// 查询补齐数据
			base = new SysVirtualPersionBaseInfo();
			// 更新记录
			// 删除临时表qq
			// 执行更新表状态 状态更新2
			// 垃圾回收
			System.gc();
		}
		
	}
	
}
