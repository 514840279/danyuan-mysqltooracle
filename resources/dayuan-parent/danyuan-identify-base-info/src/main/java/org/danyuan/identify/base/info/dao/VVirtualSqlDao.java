package org.danyuan.identify.base.info.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.danyuan.identify.base.info.po.VVirtualSql;

/**    
*  文件名 ： VVirtualSqlDao.java  
*  包    名 ： org.danyuan.identify.base.info.dao  
*  描    述 ： TODO(用一句话描述该文件做什么)  
*  机能名称：
*  技能ID ：
*  作    者 ： wang  
*  时    间 ： 2017年3月21日 上午8:51:28  
*  版    本 ： V1.0    
*/
public class VVirtualSqlDao {
	
	/**
	 * @throws SQLException 
	 * 方法名： findTypefromDB
	 * 功 能： TODO(这里用一句话描述这个方法的作用)
	 * 参 数： @param strlist
	 * 参 数： @return
	 * 返 回： List<SysFilesInfo>
	 * 作 者 ： Administrator
	 * @throws
	 */
	public static List<VVirtualSql> findVVirtualSql() throws SQLException {
		Connection connection = org.danyuan.identify.base.info.db.DBUtils.getConnection();
		// hql 语句
		String sql = "select *  From V_Virtual_Sql where  deleteFlag <> '2' ";
		Statement st = connection.createStatement();
		ResultSet result = st.executeQuery(sql);
		List<VVirtualSql> list = new ArrayList<VVirtualSql>();
		VVirtualSql virtualSql = null;
		while (result.next()) {
			virtualSql = new VVirtualSql();
			virtualSql.setDeleteFlag(result.getString("DELETE_FLAG"));
			virtualSql.setFindSql(result.getString("FIND_SQL"));
			virtualSql.setFromTables(result.getString("FROM_TABLES"));
			virtualSql.setToTables(result.getString("TO_TABLES"));
			list.add(virtualSql);
		}
		// 返回 文件信息
		return list;
		
	}
	
}
