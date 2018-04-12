package org.danyuan.identify.base.info.po;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "sys_virtual_persion_base_info")
public class SysVirtualPersionBaseInfo {
	@Column(name = "uuid")
	private String	uuid;
	@Column(name = "id")
	private String	id;
	@Column(name = "qq")
	private String	qq;
	@Column(name = "nick")
	private String	nick;
	@Column(name = "real_name")
	private String	realName;
	@Column(name = "address")
	private String	address;
	@Column(name = "mobile")
	private String	mobile;
	@Column(name = "email")
	private String	email;
	@Column(name = "astro")
	private String	astro;
	@Column(name = "sex")
	private String	sex;
	@Column(name = "birthday")
	private String	birthday;
	@Column(name = "blood_type")
	private String	bloodType;
	@Column(name = "id_card")
	private String	idCard;
	@Column(name = "corporation")
	private String	corporation;
	@Column(name = "create_user")
	private String	createUser;
	@Column(name = "create_time")
	private Date	createTime;
	@Column(name = "update_user")
	private String	updateUser;
	@Column(name = "update_time")
	private Date	updatetime;
	@Column(name = "flag")
	private String	flag;
	
	public String getUuid() {
		return uuid;
	}
	
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getQq() {
		return qq;
	}
	
	public void setQq(String qq) {
		this.qq = qq;
	}
	
	public String getNick() {
		return nick;
	}
	
	public void setNick(String nick) {
		this.nick = nick;
	}
	
	public String getRealName() {
		return realName;
	}
	
	public void setRealName(String realName) {
		this.realName = realName;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getMobile() {
		return mobile;
	}
	
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getAstro() {
		return astro;
	}
	
	public void setAstro(String astro) {
		this.astro = astro;
	}
	
	public String getSex() {
		return sex;
	}
	
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	public String getBirthday() {
		return birthday;
	}
	
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	
	public String getBloodType() {
		return bloodType;
	}
	
	public void setBloodType(String bloodType) {
		this.bloodType = bloodType;
	}
	
	public String getIdCard() {
		return idCard;
	}
	
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	
	public String getCorporation() {
		return corporation;
	}
	
	public void setCorporation(String corporation) {
		this.corporation = corporation;
	}
	
	public String getCreateUser() {
		return createUser;
	}
	
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	
}
