package org.danyuan.utils.db;

/**
 * 文件名 ： d.java 包 名 ： testsqlite 描 述 ： TODO(用一句话描述该文件做什么) 机能名称： 技能ID ： 作 者 ： Tenghui.Wang 时 间 ： 2015年8月26日 下午8:16:25 版 本 ： V1.0
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SQLiteDBUtils {
	
	static {
		try {
			// 连接SQLite的JDBC
			
			Class.forName("org.sqlite.JDBC");
			
			// 建立一个数据库名zieckey.db的连接，如果不存在就在当前目录下创建之
			//
			// Connection conn = DriverManager.getConnection("jdbc:sqlite:src/main/resources/zieckey.db3");
			//
			// Statement stat = conn.createStatement();
			
			// stat.executeUpdate("create table tbl1(name varchar(20), salary int);");// 创建一个表，两列
			//
			// stat.executeUpdate("insert into tbl1 values('ZhangSan',8000);"); // 插入数据
			//
			// stat.executeUpdate("insert into tbl1 values('LiSi',7800);");
			// stat.executeUpdate("insert into tbl1 values('WangWu',5800);");
			// stat.executeUpdate("insert into tbl1 values('ZhaoLiu',9100);");
			
			// ResultSet rs = stat.executeQuery("select * from tbl1;"); // 查询数据
			//
			// while (rs.next()) { // 将查询到的数据打印出来
			//
			// System.out.print("name = " + rs.getString("name") + " "); // 列属性一
			//
			// System.out.println("salary = " + rs.getString("salary")); // 列属性二
			//
			// }
			// rs.close();
			// conn.close(); // 结束数据库的连接
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() {
		
		try {
			String path = System.getProperty("user.dir");
			return DriverManager.getConnection("jdbc:sqlite:" + path + "\\wth.db3");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static void close(Connection conn) {
		try {
			if (conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement state) {
		try {
			if (state != null) {
				state.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}