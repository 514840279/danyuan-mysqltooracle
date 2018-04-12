package org.danyuan.identify.base.info.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "sys_qq_persion_nature_info")
public class SysQqPersionNatureInfo {
	// 唯一主键 uuid varchar（32）
	@Column(name = "qq")
	private String	qq;
	@Column(name = "real_name")
	private String	realName;
	@Column(name = "astro")
	private String	astro;
	@Column(name = "sex")
	private String	sex;
	@Column(name = "address")
	private String	address;
	@Column(name = "birthday")
	private String	birthday;
	@Column(name = "blood_type")
	private String	bloodType;
	@Column(name = "user_name")
	private String	userName;
	
	public String getQq() {
		return qq;
	}
	
	public void setQq(String qq) {
		this.qq = qq;
	}
	
	public String getRealName() {
		return realName;
	}
	
	public void setRealName(String realName) {
		this.realName = realName;
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
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
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
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Override
	public String toString() {
		return "SysQqPersionNatureInfo [qq=" + qq + ", realName=" + realName + ", astro=" + astro + ", sex=" + sex + ", address=" + address + ", birthday=" + birthday + ", bloodType=" + bloodType + ", userName=" + userName + "]";
	}
	
}
