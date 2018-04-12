package org.danyuan.identify.base.info.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "sys_qq_persion_rl_info")
public class SysQqPersionRlInfo {
	@Column(name = "qq")
	private String	qq;
	@Column(name = "user_name")
	private String	userName;
	@Column(name = "real_name")
	private String	realName;
	@Column(name = "mobile")
	private String	mobile;
	@Column(name = "email")
	private String	email;
	@Column(name = "address")
	private String	address;
	
	public String getQq() {
		return qq;
	}
	
	public void setQq(String qq) {
		this.qq = qq;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getRealName() {
		return realName;
	}
	
	public void setRealName(String realName) {
		this.realName = realName;
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
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	@Override
	public String toString() {
		return "SysQqPersionRlInfo [qq=" + qq + ", userName=" + userName + ", realName=" + realName + ", mobile=" + mobile + ", email=" + email + ", address=" + address + "]";
	}
	
}
