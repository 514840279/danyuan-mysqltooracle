package org.danyuan.identify.base.info.po;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

/**    
*  文件名 ： SysVirtualLTemp.java  
*  包    名 ： org.danyuan.identify.base.info.po  
*  描    述 ： TODO(用一句话描述该文件做什么)  
*  机能名称：
*  技能ID ：
*  作    者 ： wang  
*  时    间 ： 2017年3月21日 上午9:29:28  
*  版    本 ： V1.0    
*/
@Entity
@Table(name = "sys_virtual_temp")
public class SysVirtualTemp {
	
	private String	keyCode;
	private String	keyName;
	private String	keyValue;
	private Date	insertTime;
	private String	insertUser;
	private Date	updateTime;
	private String	updateUser;
	private String	tableName;
	private String	deleteFlag;
	
	/**  
	 *  方法名 ： getKeyCode 
	 *  功    能 ： 返回变量 keyCode 的值  
	 *  @return: String 
	 */
	public String getKeyCode() {
		return keyCode;
	}
	
	/**  
	 *  方法名 ： setKeyCode 
	 *  功    能 ： 设置变量 keyCode 的值
	 */
	public void setKeyCode(String keyCode) {
		this.keyCode = keyCode;
	}
	
	/**  
	 *  方法名 ： getKeyName 
	 *  功    能 ： 返回变量 keyName 的值  
	 *  @return: String 
	 */
	public String getKeyName() {
		return keyName;
	}
	
	/**  
	 *  方法名 ： setKeyName 
	 *  功    能 ： 设置变量 keyName 的值
	 */
	public void setKeyName(String keyName) {
		this.keyName = keyName;
	}
	
	/**  
	 *  方法名 ： getKeyValue 
	 *  功    能 ： 返回变量 keyValue 的值  
	 *  @return: String 
	 */
	public String getKeyValue() {
		return keyValue;
	}
	
	/**  
	 *  方法名 ： setKeyValue 
	 *  功    能 ： 设置变量 keyValue 的值
	 */
	public void setKeyValue(String keyValue) {
		this.keyValue = keyValue;
	}
	
	/**  
	 *  方法名 ： getInsertUser 
	 *  功    能 ： 返回变量 insertUser 的值  
	 *  @return: String 
	 */
	public String getInsertUser() {
		return insertUser;
	}
	
	/**  
	 *  方法名 ： setInsertUser 
	 *  功    能 ： 设置变量 insertUser 的值
	 */
	public void setInsertUser(String insertUser) {
		this.insertUser = insertUser;
	}
	
	/**  
	 *  方法名 ： getInsertTime 
	 *  功    能 ： 返回变量 insertTime 的值  
	 *  @return: Date 
	 */
	public Date getInsertTime() {
		return insertTime;
	}
	
	/**  
	 *  方法名 ： setInsertTime 
	 *  功    能 ： 设置变量 insertTime 的值
	 */
	public void setInsertTime(Date insertTime) {
		this.insertTime = insertTime;
	}
	
	/**  
	 *  方法名 ： getUpdateTime 
	 *  功    能 ： 返回变量 updateTime 的值  
	 *  @return: Date 
	 */
	public Date getUpdateTime() {
		return updateTime;
	}
	
	/**  
	 *  方法名 ： setUpdateTime 
	 *  功    能 ： 设置变量 updateTime 的值
	 */
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
	/**  
	 *  方法名 ： getUpdateUser 
	 *  功    能 ： 返回变量 updateUser 的值  
	 *  @return: String 
	 */
	public String getUpdateUser() {
		return updateUser;
	}
	
	/**  
	 *  方法名 ： setUpdateUser 
	 *  功    能 ： 设置变量 updateUser 的值
	 */
	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}
	
	/**  
	 *  方法名 ： getTableName 
	 *  功    能 ： 返回变量 tableName 的值  
	 *  @return: String 
	 */
	public String getTableName() {
		return tableName;
	}
	
	/**  
	 *  方法名 ： setTableName 
	 *  功    能 ： 设置变量 tableName 的值
	 */
	public void setTableName(String tableName) {
		this.tableName = tableName;
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
