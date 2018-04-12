package org.danyuan.utils.dbconn;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**    
*  文件名 ： DBConnUtils.java  
*  包    名 ： tk.ainiyue.wth.automatic.dbconn  
*  描    述 ： TODO(用一句话描述该文件做什么)  
*  作    者 ： Tenghui.Wang  
*  时    间 ： 2015年10月10日 上午9:25:11  
*  版    本 ： V1.0    
*/
public interface DBConnUtils {
	// 查询所有内容
	ResultSet queryAll(Connection conn, String sql, String... str) throws SQLException;
	
	// 更新数据
	int update(Connection conn, String sql, String... str) throws SQLException;
	
	// 关闭
	void close(Connection conn);
	
	// 关闭
	void close(ResultSet rs);
	
	// 关闭
	void close(Statement state);
}
