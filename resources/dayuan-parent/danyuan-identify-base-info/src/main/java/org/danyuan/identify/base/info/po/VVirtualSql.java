package org.danyuan.identify.base.info.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**    
*  文件名 ： VVirtualSql.java  
*  包    名 ： org.danyuan.identify.base.info.po  
*  描    述 ： TODO(用一句话描述该文件做什么)  
*  机能名称：
*  技能ID ：
*  作    者 ： wang  
*  时    间 ： 2017年3月20日 下午5:52:19  
*  版    本 ： V1.0    
*/
@Entity
@Table(name = "v_virtual_sql")
public class VVirtualSql {
	@Column(name = "from_tables", length = 2000)
	private String	fromTables;
	@Column(name = "to_tables", length = 2000)
	private String	toTables;
	@Column(name = "find_sql", length = 2000)
	private String	findSql;
	@Column(name = "delete_flag", length = 2000)
	private String	deleteFlag;
	
	/**  
	 *  方法名 ： getFromTables 
	 *  功    能 ： 返回变量 fromTables 的值  
	 *  @return: String 
	 */
	public String getFromTables() {
		return fromTables;
	}
	
	/**  
	 *  方法名 ： setFromTables 
	 *  功    能 ： 设置变量 fromTables 的值
	 */
	public void setFromTables(String fromTables) {
		this.fromTables = fromTables;
	}
	
	/**  
	 *  方法名 ： getToTables 
	 *  功    能 ： 返回变量 toTables 的值  
	 *  @return: String 
	 */
	public String getToTables() {
		return toTables;
	}
	
	/**  
	 *  方法名 ： setToTables 
	 *  功    能 ： 设置变量 toTables 的值
	 */
	public void setToTables(String toTables) {
		this.toTables = toTables;
	}
	
	/**  
	 *  方法名 ： getFindSql 
	 *  功    能 ： 返回变量 findSql 的值  
	 *  @return: String 
	 */
	public String getFindSql() {
		return findSql;
	}
	
	/**  
	 *  方法名 ： setFindSql 
	 *  功    能 ： 设置变量 findSql 的值
	 */
	public void setFindSql(String findSql) {
		this.findSql = findSql;
	}
	
	/**  
	 *  方法名 ： getDeleteFlag 
	 *  功    能 ： 返回变量 deleteFlag 的值  
	 *  @return: String 
	 */
	public String getDeleteFlag() {
		return deleteFlag;
	}
	
	/**  
	 *  方法名 ： setDeleteFlag 
	 *  功    能 ： 设置变量 deleteFlag 的值
	 */
	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	
}
