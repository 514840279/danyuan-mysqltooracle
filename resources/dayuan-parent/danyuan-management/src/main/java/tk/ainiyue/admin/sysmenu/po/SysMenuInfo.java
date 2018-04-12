package tk.ainiyue.admin.sysmenu.po;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.Length;

/**
 * 文件名 ： SysMenuInfo.java
 * 包 名 ： tk.ainiyue.admin.menu.bean
 * 描 述 ： TODO(用一句话描述该文件做什么)
 * 机能名称：
 * 技能ID ：
 * 作 者 ： Administrator
 * 时 间 ： 2016年6月3日 下午5:36:05
 * 版 本 ： V1.0
 */
@Entity
@Table(name = "sys_menu_info")
public class SysMenuInfo {
	
	@Id
	@GenericGenerator(name = "idGenerator", strategy = "uuid")
	@GeneratedValue(generator = "idGenerator")
	@Column(name = "UUID", updatable = false)
	@NotNull
	@Length(max = 32)
	private String	uuid;
	
	@Column(name = "system_id")
	@NotNull
	@Length(max = 32)
	private String	systemId;
	
	@Column(name = "parents_id")
	@NotNull
	@Length(max = 32)
	private String	parentsId;
	
	@Column(name = "menu_name")
	@NotNull
	@Length(max = 50)
	private String	menuName;
	
	@Column(name = "uri")
	@Length(max = 1024)
	private String	uri;
	
	@Column(name = "discription")
	@NotNull
	@Length(max = 120)
	private String	discription;
	
	@Column(name = "class_type")
	@NotNull
	@Length(max = 100)
	private String	classType;
	
	@Column(name = "insert_datetime", updatable = false)
	@NotNull
	private Date	insertDatetime;
	
	@Column(name = "updata_datetime")
	private Date	updataDatetime;
	
	@Column(name = "flag")
	@Length(max = 30)
	private String	flag;
	
	/**
	 * 方法名 ： getUuid
	 * 功 能 ： 返回变量 uuid 的值
	 * 
	 * @return: String
	 */
	public String getUuid() {
		return uuid;
	}
	
	/**
	 * 方法名 ： setUuid
	 * 功 能 ： 设置变量 uuid 的值
	 */
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	
	/**
	 * 方法名 ： getSystemId
	 * 功 能 ： 返回变量 systemId 的值
	 * 
	 * @return: String
	 */
	public String getSystemId() {
		return systemId;
	}
	
	/**
	 * 方法名 ： setSystemId
	 * 功 能 ： 设置变量 systemId 的值
	 */
	public void setSystemId(String systemId) {
		this.systemId = systemId;
	}
	
	/**
	 * 方法名 ： getParentsId
	 * 功 能 ： 返回变量 parentsId 的值
	 * 
	 * @return: String
	 */
	public String getParentsId() {
		return parentsId;
	}
	
	/**
	 * 方法名 ： setParentsId
	 * 功 能 ： 设置变量 parentsId 的值
	 */
	public void setParentsId(String parentsId) {
		this.parentsId = parentsId;
	}
	
	/**
	 * 方法名 ： getMenuName
	 * 功 能 ： 返回变量 menuName 的值
	 * 
	 * @return: String
	 */
	public String getMenuName() {
		return menuName;
	}
	
	/**
	 * 方法名 ： setMenuName
	 * 功 能 ： 设置变量 menuName 的值
	 */
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	
	/**
	 * 方法名 ： getUri
	 * 功 能 ： 返回变量 uri 的值
	 * 
	 * @return: String
	 */
	public String getUri() {
		return uri;
	}
	
	/**
	 * 方法名 ： setUri
	 * 功 能 ： 设置变量 uri 的值
	 */
	public void setUri(String uri) {
		this.uri = uri;
	}
	
	/**
	 * 方法名 ： getDiscription
	 * 功 能 ： 返回变量 discription 的值
	 * 
	 * @return: String
	 */
	public String getDiscription() {
		return discription;
	}
	
	/**
	 * 方法名 ： setDiscription
	 * 功 能 ： 设置变量 discription 的值
	 */
	public void setDiscription(String discription) {
		this.discription = discription;
	}
	
	/**
	 * 方法名 ： getClassType
	 * 功 能 ： 返回变量 classType 的值
	 * 
	 * @return: String
	 */
	public String getClassType() {
		return classType;
	}
	
	/**
	 * 方法名 ： setClassType
	 * 功 能 ： 设置变量 classType 的值
	 */
	public void setClassType(String classType) {
		this.classType = classType;
	}
	
	/**
	 * 方法名 ： getInsertDatetime
	 * 功 能 ： 返回变量 insertDatetime 的值
	 * 
	 * @return: Date
	 */
	public Date getInsertDatetime() {
		return insertDatetime;
	}
	
	/**
	 * 方法名 ： setInsertDatetime
	 * 功 能 ： 设置变量 insertDatetime 的值
	 */
	public void setInsertDatetime(Date insertDatetime) {
		this.insertDatetime = insertDatetime;
	}
	
	/**  
	 *  方法名 ： getUpdataDatetime 
	 *  功    能 ： 返回变量 updataDatetime 的值  
	 *  @return: Date 
	 */
	public Date getUpdataDatetime() {
		return updataDatetime;
	}
	
	/**  
	 *  方法名 ： setUpdataDatetime 
	 *  功    能 ： 设置变量 updataDatetime 的值
	 */
	public void setUpdataDatetime(Date updataDatetime) {
		this.updataDatetime = updataDatetime;
	}
	
	/**
	 * 方法名 ： getFlag
	 * 功 能 ： 返回变量 flag 的值
	 * 
	 * @return: String
	 */
	public String getFlag() {
		return flag;
	}
	
	/**
	 * 方法名 ： setFlag
	 * 功 能 ： 设置变量 flag 的值
	 */
	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	/**
	 * 构造方法：
	 * 描 述： TODO(这里用一句话描述这个方法的作用)
	 * 参 数：
	 * 作 者 ： Administrator
	 * @throws
	 */
	public SysMenuInfo() {
		super();
	}
	
	/**
	 * 构造方法：
	 * 描 述： TODO(这里用一句话描述这个方法的作用)
	 * 参 数： @param uuid
	 * 作 者 ： Administrator
	 * @throws
	 */
	public SysMenuInfo(String uuid) {
		super();
		this.uuid = uuid;
	}
	
}
