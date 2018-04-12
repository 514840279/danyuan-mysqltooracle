package org.danyuan.weburl.bean;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 文件名 ： WebUrl.java
 * 包 名 ： org.danyuan.weburl.bean
 * 描 述 ： TODO(用一句话描述该文件做什么)
 * 机能名称：
 * 技能ID ：
 * 作 者 ： wang
 * 时 间 ： 2016年10月7日 上午3:46:42
 * 版 本 ： V1.0
 */
@Entity
@Table(name = "web_url")
public class WebUrl {
	// 唯一主键 uuid varchar（32）
	@Id
	@Column(name = "uuid", length = 32)
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid") // 注解于属性中
	private String	uuid;
	// 文件名 file_name varchar（100）
	@Column(name = "parrent_url", length = 4000, nullable = true)
	private String	parrentUrl;
	@Column(name = "url", length = 4000, nullable = true)
	private String	url;
	@Column(name = "title", length = 4000, nullable = true)
	private String	title;
	// 文件类型 type varchar（50）
	@Column(name = "type", length = 50, nullable = true)
	private String	type;
	@Column(name = "flag", length = 2, nullable = true)
	private String	flag;
	@Column(name = "insert_timestimp", updatable = false)
	public Date		insertTimestimp;
	@Column(name = "update_timestimp")
	public Date		updateTimestimp;
	
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
	 * 方法名 ： getParrentUrl
	 * 功 能 ： 返回变量 parrentUrl 的值
	 * 
	 * @return: String
	 */
	public String getParrentUrl() {
		return parrentUrl;
	}
	
	/**
	 * 方法名 ： setParrentUrl
	 * 功 能 ： 设置变量 parrentUrl 的值
	 */
	public void setParrentUrl(String parrentUrl) {
		this.parrentUrl = parrentUrl;
	}
	
	/**
	 * 方法名 ： getUrl
	 * 功 能 ： 返回变量 url 的值
	 * 
	 * @return: String
	 */
	public String getUrl() {
		return url;
	}
	
	/**
	 * 方法名 ： setUrl
	 * 功 能 ： 设置变量 url 的值
	 */
	public void setUrl(String url) {
		this.url = url;
	}
	
	/**
	 * 方法名 ： getTitle
	 * 功 能 ： 返回变量 title 的值
	 * 
	 * @return: String
	 */
	public String getTitle() {
		return title;
	}
	
	/**
	 * 方法名 ： setTitle
	 * 功 能 ： 设置变量 title 的值
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	
	/**
	 * 方法名 ： getType
	 * 功 能 ： 返回变量 type 的值
	 * 
	 * @return: String
	 */
	public String getType() {
		return type;
	}
	
	/**
	 * 方法名 ： setType
	 * 功 能 ： 设置变量 type 的值
	 */
	public void setType(String type) {
		this.type = type;
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
	 * 方法名 ： getInsertTimestimp
	 * 功 能 ： 返回变量 insertTimestimp 的值
	 * 
	 * @return: Date
	 */
	public Date getInsertTimestimp() {
		return insertTimestimp;
	}
	
	/**
	 * 方法名 ： setInsertTimestimp
	 * 功 能 ： 设置变量 insertTimestimp 的值
	 */
	public void setInsertTimestimp(Date insertTimestimp) {
		this.insertTimestimp = insertTimestimp;
	}
	
	/**
	 * 方法名 ： getUpdateTimestimp
	 * 功 能 ： 返回变量 updateTimestimp 的值
	 * 
	 * @return: Date
	 */
	public Date getUpdateTimestimp() {
		return updateTimestimp;
	}
	
	/**
	 * 方法名 ： setUpdateTimestimp
	 * 功 能 ： 设置变量 updateTimestimp 的值
	 */
	public void setUpdateTimestimp(Date updateTimestimp) {
		this.updateTimestimp = updateTimestimp;
	}
	
}
