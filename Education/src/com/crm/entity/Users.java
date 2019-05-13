package com.crm.entity;

import org.springframework.stereotype.Component;

/**
 * 用户
 * @author hasee
 *
 */
@Component
public class Users {
	private Integer u_id;
	private String u_loginname;
	private String u_password;
	private Integer u_islockout;
	private String u_lastlogintime;
	private String u_createtime;
	private Integer u_psdwrongtime;
	private String u_locktime;
	private String u_protectemail;
	private String u_protectmtel;
	public Users(Integer u_id, String u_loginname, String u_password, Integer u_islockout, String u_lastlogintime,
			String u_createtime, Integer u_psdwrongtime, String u_locktime, String u_protectemail,
			String u_protectmtel) {
		super();
		this.u_id = u_id;
		this.u_loginname = u_loginname;
		this.u_password = u_password;
		this.u_islockout = u_islockout;
		this.u_lastlogintime = u_lastlogintime;
		this.u_createtime = u_createtime;
		this.u_psdwrongtime = u_psdwrongtime;
		this.u_locktime = u_locktime;
		this.u_protectemail = u_protectemail;
		this.u_protectmtel = u_protectmtel;
	}
	public Users() {
		super();
	}
	public Integer getU_id() {
		return u_id;
	}
	public void setU_id(Integer u_id) {
		this.u_id = u_id;
	}
	public String getU_loginname() {
		return u_loginname;
	}
	public void setU_loginname(String u_loginname) {
		this.u_loginname = u_loginname;
	}
	public String getU_password() {
		return u_password;
	}
	public void setU_password(String u_password) {
		this.u_password = u_password;
	}
	public Integer getU_islockout() {
		return u_islockout;
	}
	public void setU_islockout(Integer u_islockout) {
		this.u_islockout = u_islockout;
	}
	public String getU_lastlogintime() {
		return u_lastlogintime;
	}
	public void setU_lastlogintime(String u_lastlogintime) {
		this.u_lastlogintime = u_lastlogintime;
	}
	public String getU_createtime() {
		return u_createtime;
	}
	public void setU_createtime(String u_createtime) {
		this.u_createtime = u_createtime;
	}
	public Integer getU_psdwrongtime() {
		return u_psdwrongtime;
	}
	public void setU_psdwrongtime(Integer u_psdwrongtime) {
		this.u_psdwrongtime = u_psdwrongtime;
	}
	public String getU_locktime() {
		return u_locktime;
	}
	public void setU_locktime(String u_locktime) {
		this.u_locktime = u_locktime;
	}
	public String getU_protectemail() {
		return u_protectemail;
	}
	public void setU_protectemail(String u_protectemail) {
		this.u_protectemail = u_protectemail;
	}
	public String getU_protectmtel() {
		return u_protectmtel;
	}
	public void setU_protectmtel(String u_protectmtel) {
		this.u_protectmtel = u_protectmtel;
	}
	@Override
	public String toString() {
		return "Users [u_id=" + u_id + ", u_loginname=" + u_loginname + ", u_password=" + u_password + ", u_islockout="
				+ u_islockout + ", u_lastlogintime=" + u_lastlogintime + ", u_createtime=" + u_createtime
				+ ", u_psdwrongtime=" + u_psdwrongtime + ", u_locktime=" + u_locktime + ", u_protectemail="
				+ u_protectemail + ", u_protectmtel=" + u_protectmtel + "]";
	}
	
}
