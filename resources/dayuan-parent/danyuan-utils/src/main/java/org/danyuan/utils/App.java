package org.danyuan.utils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.danyuan.utils.db.DBUtils ;
import org.danyuan.utils.db.SQLiteDBUtils ;

/**
 * Hello world!
 *
 */
public class App {
	public static void main(String[] args) throws SQLException {
		task();
	}
	
	static void task() throws SQLException {
		// String sql = "select distinct t.公司名称 as A from shxg_qyxg_公司基本信息 t where t.公司名称 is not null";
		//		String creattable = "create table name(name varchar(20));";
		String intertable = "insert into name values(?) ";
		String getcharset = "select name from name";
		Connection oracle = DBUtils.getConnection();
		Connection sqlite = SQLiteDBUtils.getConnection();
		
		Statement stat = oracle.createStatement();
		Statement statlite = sqlite.createStatement();
		// statlite.executeUpdate(creattable);
		List<String> listsql = getSql();
		List<String> list = new ArrayList<String>();
		
		ResultSet rss = statlite.executeQuery(getcharset);
		while (rss.next()) {
			list.add(rss.getString(1));
			System.out.print(rss.getString(1));
		}
		for (String sql : listsql) {
			System.out.println(sql);
			ResultSet rs = stat.executeQuery(sql);
			while (rs.next()) {
				String str = rs.getString(1);
				// for (int i = 0; i < str.length(); i++) {
				// char c = str.charAt(i);
				if (list.contains(str)) {
					continue;
				}
				intertable = "insert into name values('" + str + "');";
				statlite.execute(intertable);
				list.add(str);
				System.out.print(str);
				// }
			}
		}
		oracle.close();
		sqlite.close();
	}
	
	private static List<String> getSql() throws SQLException {
		Connection oracle = DBUtils.getConnection();
		Statement stat = oracle.createStatement();
		String sql = "select t.TABLE_NAME,t.COLUMN_NAME from user_tab_columns t where t.COLUMN_NAME in （'负责人','董事','高管','姓名','法人','法人代表','股东'）";
		ResultSet rs = stat.executeQuery(sql);
		List<String> list = new ArrayList<String>();
		while (rs.next()) {
			String TABLE_NAME = rs.getString("TABLE_NAME");
			String COLUMN_NAME = rs.getString("COLUMN_NAME");
			String ss = "select distinct " + COLUMN_NAME + " from " + TABLE_NAME + " where " + COLUMN_NAME + " is not null";
			list.add(ss);
		}
		
		return list;
	}
	
}
