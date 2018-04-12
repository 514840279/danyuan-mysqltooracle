package tk.ainiyue.danyuan.file;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.List;


import tk.ainiyue.danyuan.Constant;
import tk.ainiyue.danyuan.db.DBUtils;
import tk.ainiyue.danyuan.db.FileFlagChange;
import tk.ainiyue.danyuan.po.SysFilesInfo;

/**
 * 文件名 ： DBHandle.java
 * 包 名 ： tk.ainiyue.danyuan.file
 * 描 述 ： (用一句话描述该文件做什么)
 * 机能名称：
 * 技能ID ：
 * 作 者 ： Tenghui.Wang
 * 时 间 ： 2016年7月7日 下午9:12:10
 * 版 本 ： V1.0
 */
public class DBHandle {
	
	/**
	 * @return
	 * 方法名： createtable
	 * 功 能： 创建一个表
	 * 参 数： @param num
	 * @param sysFilesInfo
	 * 返 回： String
	 * 作 者 ： Administrator
	 * @throws
	 */
	public void createtable(SysFilesInfo sysFilesInfo, int num, boolean flag) {
		// 文件名
		String string = sysFilesInfo.getFileName();
		// 替换掉特殊字符
		string = string.substring(0, string.lastIndexOf("."))
				.replaceAll("(?:\\)|\\(|_|-|—|－| |	|　|\\.|《|》|'|~|”|“|【|】|\\[|\\]|[|]|,|，|。|\\?|？|（|）|＝|=|\\+|＋|、|\"|·|`|～)", "")
				.trim();
		if(flag||sysFilesInfo.getToDatabaseTableName()==null||"".equals(sysFilesInfo.getToDatabaseTableName())){
			
			// 判断字符长度 超过 25 
			while (findlengthb(string) > 23) {
				// 字符较长的截取字符 保留前25个
				string = string.substring(0, string.length() - 2);
			}
			// 先拼接 "DB_" +sheet 个数
			string = "DB_"+num+string;
			// 拼接个随机数
			string = string + (Math.round(Math.random() * 98));
		}else{
			// 删除之前的表
			dropTable(sysFilesInfo.getToDatabaseTableName());
			string = sysFilesInfo.getToDatabaseTableName();
		}
		// 验证 表名 是否存在 存在 就返回 个新的 表名
		string = validateTableName(string);
		// 表名
		sysFilesInfo.setToDatabaseTableName(string);
		// 拼接个表
		String sql = "create table " + string + "(";
		// 记录 列的个数
		int a = 1;
		for (int i = 0; i < num; i++) {
			sql += "A"+a + " varchar2(4000),";
			a++;
		}
		sql += "数据来源  varchar2(4000),入库时间  date";
		sql += ")";
		System.out.println(sql.toString());
		// 执行sql
		Connection conn = DBUtils.getConnection();
		Statement st;
		try {
			st = conn.createStatement();
			// 执行sql
			st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtils.close(conn);
		}
	}
	
	/**  
	*  方法名： validateTableName  
	*  功    能： 验证 不要重复的表名
	*  参    数： @param string
	*  参    数： @return 
	*  返    回： String  
	*  作    者 ： Administrator  
	*  @throws  
	*/
	private String validateTableName(String string) {
		Connection conn = DBUtils.getConnection();
		PreparedStatement prest;
		String result = string;
		// 拼接可执行的语句
		String sql = "Select *  from user_tables where table_name=upper('"+string+"') ";
		try {
			// 执行 录入数据库
			prest = conn.prepareStatement(sql);
			// 结果集
			ResultSet rs = prest.executeQuery();
			// 判断结果是否有
			while (rs.next()) {
				// 获取结果
				result = string.substring(0,string.length()-2)+ Math.round(Math.random()*99);
				// 直到验证 成功
				validateTableName( result);
			}
		} catch (SQLException e) {
			// TODO 导出 错误的 记录
			System.err.println(sql.toString());
		} finally {
			DBUtils.close(conn);
		}
		return result;
	}

	/**  
	*  方法名： findlengthb  
	*  功    能： 获取字符的长度  
	*  参    数： @param string
	*  参    数： @return 
	*  返    回： int  
	*  作    者 ： Administrator  
	*  @throws  
	*/
	private int findlengthb(String string) {
		Connection conn = DBUtils.getConnection();
		PreparedStatement prest;
		int result = 0;
		// 拼接可执行的语句
		String sql = "Select lengthb('" + string + "')  from dual ";
		try {
			// 执行 录入数据库
			prest = conn.prepareStatement(sql);
			// 结果集
			ResultSet rs = prest.executeQuery();
			// 判断结果是否有
			while (rs.next()) {
				// 获取结果
				result = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO 导出 错误的 记录
			System.err.println(sql.toString());
		} finally {
			DBUtils.close(conn);
		}
		return result;
	}
	
	/**
	 * 方法名： updateFileinfo
	 * 功 能： 修改 最终 录入 的 结果 信息
	 * 参 数： @param sysFilesInfo
	 * 返 回： void
	 * 作 者 ： Administrator
	 * @throws
	 */
	public void updateFileinfo(SysFilesInfo sysFilesInfo) {
		// 改变文件信息
		FileFlagChange change = new FileFlagChange();
		change.changeFlag(sysFilesInfo);
		
	}
	

	/**
	 * 方法名： insertIntoDB
	 * 功 能： 录入 数据库
	 * 参 数： @param SysFilesInfo
	 * 参 数： @param list
	 * 返 回： void
	 * 作 者 ： Administrator
	 * @throws
	 */
	public void insertIntoDB(SysFilesInfo sysFilesInfo, List<String> list) {
		
		// 修改处理结果
		sysFilesInfo.setRowCount(list.size());
		// 错误处理 语句 保存到文本中
		Connection conn = DBUtils.getConnection();
		String sql = "";
		try {
			Statement st =conn.createStatement();// 执行 录入数据库
			// 取消自动提交
			conn.setAutoCommit(false);
			for (int x = 0; x < list.size(); x++) {
				// 拼接可执行的语句
				sql = "insert into " + sysFilesInfo.getToDatabaseTableName() + "  values ('";
				// 如果有分割字符的 替换字符 没有的 拼接 字符 ”‘.’“
				if(sysFilesInfo.getSeparator()!=null&&!"".equals(sysFilesInfo.getSeparator())){
					sql += list.get(x).trim().replace("'", "").replace("\"", "").replace(sysFilesInfo.getSeparator(), "','");
				}else{
					String temp ="".equals(list.get(x).trim())?"空":list.get(x).trim();
					sql += temp;
				}
				sql += "','";
				sql += sysFilesInfo.getFilePath() + "',sysdate)" ;
				st.addBatch(sql);
				if(x%1000==0){
					 //执行批量执行 
					st.executeBatch(); 
				}
			}
			
			 //执行批量执行 
			st.executeBatch(); 
			// 提交
			conn.commit();
		} catch (SQLException e) {
			// 导出 错误的 记录
			System.err.println(sql.toString());
		}
		sysFilesInfo.setRowCount(list.size());
		// 关闭连接
		try {
			conn.commit();
			DBUtils.close(conn);
		} catch (SQLException e) {
		}
		
	}
	
	/**  
	*  方法名： excelinsertIntoDB  
	*  功    能： excel的 入库方法
	*  参    数： @param sysFilesInfo
	*  参    数： @param list2 
	*  返    回： void  
	*  作    者 ： Administrator  
	*  @throws  
	*/
	public void excelinsertIntoDB(SysFilesInfo sysFilesInfo, List<String> list2) {
		sysFilesInfo.setRowCount(sysFilesInfo.getRowCount() + list2.size());
		// 错误处理 语句 保存到文本中
		Connection conn = DBUtils.getConnection();
		PreparedStatement prest;
		// 拼接可执行的语句
		String sql = "insert into " + sysFilesInfo.getToDatabaseTableName() + " values ('";
		for (String row : list2) {
			sql += row.replace("'", "").replace("\"", "").trim() + "','";
		}
		
		sql += sysFilesInfo.getFilePath() + "',sysdate";
		sql += ")";
		try {
			// 执行 录入数据库
			prest = conn.prepareStatement(sql);
			
			prest.execute();
		} catch (SQLException e) {
			// TODO 导出 错误的 记录
			System.err.println(sql.toString());
		} finally {
			DBUtils.close(conn);
		}
	}
	
	/**
	 * 
	*  方法名： validateTables  
	*  功    能： 验证表录入是否正确 异常的标注出来
	*  参    数： @param sysFilesInfo 
	*  返    回： void  
	*  作    者 ： Administrator  
	*  @throws
	 */
	public void validateTables(SysFilesInfo sysFilesInfo){
		// 读取数据库中表的记录数 
		int num = readRowCountFromDB(sysFilesInfo.getToDatabaseTableName());
		// 比较两个数据量是否一样  不一样的 标注 异常 信息
		sysFilesInfo.setFlag("2");
		sysFilesInfo.setInserNum(num);
		if(num!=sysFilesInfo.getRowCount()){
			sysFilesInfo.setFlag("-2");
			sysFilesInfo.setErrormessage("数据量比较 不一致 ，确认 数据库 和文件 正常 ，再是一次");
		}else if(num==0){
			sysFilesInfo.setFlag("-3");
			sysFilesInfo.setErrormessage("没有插入一条数据");
			dropTable(sysFilesInfo.getToDatabaseTableName());
		}
		sysFilesInfo.setEndEimestimp(new Date());
		FileFlagChange change = new FileFlagChange();
		// 更新 文件入库的信息
		change.saveOrUpdate(sysFilesInfo, Constant._HIBERNATE_ORCL);
		
	}

	/**  
	*  方法名： dropTable  
	*  功    能： 删掉 没有数据量的空表
	*  参    数： @param toDatabaseTableName 
	*  返    回： void  
	*  作    者 ： Administrator  
	*  @throws  
	*/
	private void dropTable(String toDatabaseTableName) {
		Connection conn = DBUtils.getConnection();
		String sql = "drop table " + toDatabaseTableName ;
		try {
			PreparedStatement prest = conn.prepareStatement(sql);
			 prest.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @return   
	*  方法名： readRowCountFromDB  
	*  功    能： 读取数据库中的记录总数
	*  参    数： @param toDatabaseTableName 
	*  返    回： int  
	*  作    者 ： Administrator  
	*  @throws  
	*/
	private int readRowCountFromDB(String toDatabaseTableName) {
		int num = 0;
		Connection conn = DBUtils.getConnection();
		String sql = "select count(1) from " + toDatabaseTableName ;
		try {
			PreparedStatement prest = conn.prepareStatement(sql);
			ResultSet rs = prest.executeQuery();
			while(rs.next()){
				num = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}
}
