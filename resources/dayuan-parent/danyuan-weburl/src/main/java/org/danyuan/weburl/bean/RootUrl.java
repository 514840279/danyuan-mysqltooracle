package org.danyuan.weburl.bean;

import java.sql.Clob;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 文件名 ： RootUrl.java
 * 包 名 ： org.danyuan.weburl.bean
 * 描 述 ： TODO(用一句话描述该文件做什么)
 * 机能名称：
 * 技能ID ：
 * 作 者 ： wang
 * 时 间 ： 2016年10月12日 下午8:01:36
 * 版 本 ： V1.0
 */
@Entity
@Table(name = "root_url")
public class RootUrl {
	// 唯一主键 uuid varchar（32）
	@Id
	@Column(name = "uuid", length = 32)
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid") // 注解于属性中
	private String	uuid;
	// 网站地址
	@Column(name = "url", length = 2000, nullable = true)
	private String	url;
	// 网站标题
	@Column(name = "title", length = 500, nullable = true)
	private String	title;
	// 网站字符集
	@Column(name = "charset", length = 50, nullable = true)
	private String	charset;
	// 文件头作用类型 json组
	@Column(name = "http_equiv", nullable = true)
	private Clob	httpEquiv;
	@Column(name = "name", nullable = true)
	private Clob	name;
	// 网站关键词 name="Kyewords" Lang="EN" Content="vacation,greece,sunshine"
	@Column(name = "keyword", length = 500, nullable = true)
	private String	keyword;
	// 网站作者
	@Column(name = "author", length = 500, nullable = true)
	private String	author;
	// 网站日期
	@Column(name = "build", length = 500, nullable = true)
	private String	build;
	// 网站关版权
	@Column(name = "coprright", length = 500, nullable = true)
	private String	coprright;
	// 网站email
	@Column(name = "reply_to", length = 500, nullable = true)
	private String	replyTo;
	// 网站支持爬取方式 机器人向导
	@Column(name = "robots", length = 500, nullable = true)
	private String	robots;
	// 网站简介
	@Column(name = "description", length = 500, nullable = true)
	private String	description;
	// 辑器
	@Column(name = "generator", length = 400, nullable = true)
	private String	generator;
	// 网站简介
	@Column(name = "revisit_after", length = 400, nullable = true)
	private String	revisitAfter;
	// 商标/图标
	@Column(name = "viewport", length = 200, nullable = true)
	private String	viewport;
	// 图标
	@Column(name = "link", length = 2000, nullable = true)
	private String	link;
	// 图标
	@Column(name = "document_state", length = 50, nullable = true)
	private String	documentState;
	// 会话
	@Column(name = "session", length = 300, nullable = true)
	private String	session;
	// 采集的标记
	@Column(name = "flag", length = 2, nullable = true)
	private String	flag;
	// 收录时间
	@Column(name = "insert_timestimp", updatable = false)
	public Date		insertTimestimp;
	// 修改时间
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
	 * 方法名 ： getCharset
	 * 功 能 ： 返回变量 charset 的值
	 * 
	 * @return: String
	 */
	public String getCharset() {
		return charset;
	}
	
	/**
	 * 方法名 ： setCharset
	 * 功 能 ： 设置变量 charset 的值
	 */
	public void setCharset(String charset) {
		this.charset = charset;
	}
	
	/**
	 * 方法名 ： getHttpEquiv
	 * 功 能 ： 返回变量 httpEquiv 的值
	 * 
	 * @return: Clob
	 */
	public Clob getHttpEquiv() {
		return httpEquiv;
	}
	
	/**
	 * 方法名 ： setHttpEquiv
	 * 功 能 ： 设置变量 httpEquiv 的值
	 */
	public void setHttpEquiv(Clob httpEquiv) {
		this.httpEquiv = httpEquiv;
	}
	
	/**
	 * 方法名 ： getName
	 * 功 能 ： 返回变量 name 的值
	 * 
	 * @return: Clob
	 */
	public Clob getName() {
		return name;
	}
	
	/**
	 * 方法名 ： setName
	 * 功 能 ： 设置变量 name 的值
	 */
	public void setName(Clob name) {
		this.name = name;
	}
	
	/**
	 * 方法名 ： getDocumentState
	 * 功 能 ： 返回变量 documentState 的值
	 * 
	 * @return: String
	 */
	public String getDocumentState() {
		return documentState;
	}
	
	/**
	 * 方法名 ： setDocumentState
	 * 功 能 ： 设置变量 documentState 的值
	 */
	public void setDocumentState(String documentState) {
		this.documentState = documentState;
	}
	
	/**
	 * 方法名 ： getKeyword
	 * 功 能 ： 返回变量 keyword 的值
	 * 
	 * @return: String
	 */
	public String getKeyword() {
		return keyword;
	}
	
	/**
	 * 方法名 ： setKeyword
	 * 功 能 ： 设置变量 keyword 的值
	 */
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	/**
	 * 方法名 ： getAuthor
	 * 功 能 ： 返回变量 author 的值
	 * 
	 * @return: String
	 */
	public String getAuthor() {
		return author;
	}
	
	/**
	 * 方法名 ： setAuthor
	 * 功 能 ： 设置变量 author 的值
	 */
	public void setAuthor(String author) {
		this.author = author;
	}
	
	/**
	 * 方法名 ： getBuild
	 * 功 能 ： 返回变量 build 的值
	 * 
	 * @return: String
	 */
	public String getBuild() {
		return build;
	}
	
	/**
	 * 方法名 ： setBuild
	 * 功 能 ： 设置变量 build 的值
	 */
	public void setBuild(String build) {
		this.build = build;
	}
	
	/**
	 * 方法名 ： getCoprright
	 * 功 能 ： 返回变量 coprright 的值
	 * 
	 * @return: String
	 */
	public String getCoprright() {
		return coprright;
	}
	
	/**
	 * 方法名 ： setCoprright
	 * 功 能 ： 设置变量 coprright 的值
	 */
	public void setCoprright(String coprright) {
		this.coprright = coprright;
	}
	
	/**
	 * 方法名 ： getReplyTo
	 * 功 能 ： 返回变量 replyTo 的值
	 * 
	 * @return: String
	 */
	public String getReplyTo() {
		return replyTo;
	}
	
	/**
	 * 方法名 ： setReplyTo
	 * 功 能 ： 设置变量 replyTo 的值
	 */
	public void setReplyTo(String replyTo) {
		this.replyTo = replyTo;
	}
	
	/**
	 * 方法名 ： getRobots
	 * 功 能 ： 返回变量 robots 的值
	 * 
	 * @return: String
	 */
	public String getRobots() {
		return robots;
	}
	
	/**
	 * 方法名 ： setRobots
	 * 功 能 ： 设置变量 robots 的值
	 */
	public void setRobots(String robots) {
		this.robots = robots;
	}
	
	/**
	 * 方法名 ： getDescription
	 * 功 能 ： 返回变量 description 的值
	 * 
	 * @return: String
	 */
	public String getDescription() {
		return description;
	}
	
	/**
	 * 方法名 ： setDescription
	 * 功 能 ： 设置变量 description 的值
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	
	/**
	 * 方法名 ： getGenerator
	 * 功 能 ： 返回变量 generator 的值
	 * 
	 * @return: String
	 */
	public String getGenerator() {
		return generator;
	}
	
	/**
	 * 方法名 ： setGenerator
	 * 功 能 ： 设置变量 generator 的值
	 */
	public void setGenerator(String generator) {
		this.generator = generator;
	}
	
	/**
	 * 方法名 ： getRevisitAfter
	 * 功 能 ： 返回变量 revisitAfter 的值
	 * 
	 * @return: String
	 */
	public String getRevisitAfter() {
		return revisitAfter;
	}
	
	/**
	 * 方法名 ： setRevisitAfter
	 * 功 能 ： 设置变量 revisitAfter 的值
	 */
	public void setRevisitAfter(String revisitAfter) {
		this.revisitAfter = revisitAfter;
	}
	
	/**
	 * 方法名 ： getViewport
	 * 功 能 ： 返回变量 viewport 的值
	 * 
	 * @return: String
	 */
	public String getViewport() {
		return viewport;
	}
	
	/**
	 * 方法名 ： setViewport
	 * 功 能 ： 设置变量 viewport 的值
	 */
	public void setViewport(String viewport) {
		this.viewport = viewport;
	}
	
	/**
	 * 方法名 ： getLink
	 * 功 能 ： 返回变量 link 的值
	 * 
	 * @return: String
	 */
	public String getLink() {
		return link;
	}
	
	/**
	 * 方法名 ： setLink
	 * 功 能 ： 设置变量 link 的值
	 */
	public void setLink(String link) {
		this.link = link;
	}
	
	/**
	 * 方法名 ： getSession
	 * 功 能 ： 返回变量 session 的值
	 * 
	 * @return: String
	 */
	public String getSession() {
		return session;
	}
	
	/**
	 * 方法名 ： setSession
	 * 功 能 ： 设置变量 session 的值
	 */
	public void setSession(String session) {
		this.session = session;
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
